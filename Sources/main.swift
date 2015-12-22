//
//  main.swift
//  API
//
//  Created by Quentin Pré on 28/08/15.
//  Copyright © 2015 Quentin Pré. All rights reserved.
//

import Foundation
import Octopus

#if os(Linux)
  import Glibc
#endif

print("starting Phubo API")

do {
  let arguments   = Process.arguments

  print("port: String -> Int")
  let port        = Int(arguments[1])

  print("instantiating new OctopusServer")
  let server      = OctopusServer(port: port!)

  try server.start()

  while (true) {
    sleep(1)
  }

  print("")
} catch {
    print("Failed at starting Phubo API")
}
