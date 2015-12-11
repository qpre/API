//
//  main.swift
//  API
//
//  Created by Quentin Pré on 28/08/15.
//  Copyright © 2015 Quentin Pré. All rights reserved.
//

#if os(Linux)
    import Glibc
    srandom(UInt32(clock()))
#endif


import Foundation
import Swifter

let server = HttpServer()

server["/"] = { .OK(.HTML("This is the API endpoint for Phubo")) }

server.start()
