//
//  main.swift
//  API
//
//  Created by Quentin Pré on 28/08/15.
//  Copyright © 2015 Quentin Pré. All rights reserved.
//

#if os(Linux)
  import Glibc
#endif

import Foundation
import Octopus
import JSON

do {
  let arguments   = Process.arguments
  let port        = Int(arguments[1])
  let server      = Octopus.Server(port: port!)

  print("Starting Phubo server on port: \(port)")

  attachUsersRoutes(server.router)

  try server.start()

  while true {
    sleep(1)
  }
} catch {
    print("Failed at starting Phubo API")
}
