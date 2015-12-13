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
  server["/resources/:file"] = HttpHandlers.directory("public")
  server["/files/:path"]     = HttpHandlers.directoryBrowser("~/")
  server["/"]                = { r in
    return .OK(.Html("Welcome on Phubo's API (powered by Swifter)"))
  }

  try server.start()

  while true {
    sleep(1)
  }
} catch {
    print("Failed at starting")
}
