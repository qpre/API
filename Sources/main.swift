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

do {
  server["/test"] = { request in
    return .OK(.Html("ok !"))
  }
  try server.start()
} catch {
    print("Failed at starting")
}
