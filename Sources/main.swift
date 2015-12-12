#!/usr/bin/env swift

#if os(Linux)
    import Glibc

    let sin_zero = (UInt8(0),UInt8(0),UInt8(0),UInt8(0),UInt8(0),UInt8(0),UInt8(0),UInt8(0))
    let sock_stream = Int32(SOCK_STREAM.rawValue)
#else
    import Darwin.C

    let sin_zero = (Int8(0),Int8(0),Int8(0),Int8(0),Int8(0),Int8(0),Int8(0),Int8(0))
    let sock_stream = SOCK_STREAM
#endif

let INADDR_ANY = in_addr_t(0)

func htons(value: CUnsignedShort) -> CUnsignedShort {
    return (value << 8) + (value >> 8)
}

func rawPrint(socket: Int32, _ output: String) {
    output.withCString { (bytes) in
        send(socket, bytes, Int(strlen(bytes)), 0)
    }
}

func sockaddr_cast(p: UnsafeMutablePointer<Void>) -> UnsafeMutablePointer<sockaddr> {
    return UnsafeMutablePointer<sockaddr>(p)
}

let payload = "Hello Heroku.\n"
let portNumber: UInt16!

if let arg = Process.arguments.last, value = UInt16(arg) {
    portNumber = value
} else {
    print("Usage: \(Process.arguments.first!) portNumber")
    exit(1)
}

let sock = socket(AF_INET, Int32(sock_stream), 0)

if sock < 0 { fatalError("Could not create server socket.") }

var optval = 1
if setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, &optval, socklen_t(sizeof(Int))) < 0 {
    fatalError("Could not set SO_REUSEADDR")
}

let socklen = UInt8(sizeof(sockaddr_in))

var serveraddr = sockaddr_in()
serveraddr.sin_family = sa_family_t(AF_INET)
serveraddr.sin_port = in_port_t(htons(in_port_t(portNumber)))
serveraddr.sin_addr = in_addr(s_addr: INADDR_ANY)
serveraddr.sin_zero = sin_zero

#if !os(Linux)
    serveraddr.sin_len = socklen
#endif

if bind(sock, sockaddr_cast(&serveraddr), socklen_t(socklen)) < 0 {
    fatalError("Could not bind to socket")
}

if listen(sock, 5) < 0 {
    fatalError("Could not listen on socket")
}

print("Listening on port \(portNumber)...")

repeat {
    let clientSocket = accept(sock, nil, nil)

    rawPrint(clientSocket, "HTTP/1.1 200 OK\n")
    rawPrint(clientSocket, "Server: Tiny Web Server\n");
    rawPrint(clientSocket, "Content-length: \(payload.characters.count)\n");
    rawPrint(clientSocket, "Content-type: text-plain\n");
    rawPrint(clientSocket, "\r\n");

    rawPrint(clientSocket, payload)

    close(clientSocket)
} while(sock >= 0)
