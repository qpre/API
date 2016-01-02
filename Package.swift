import PackageDescription

let package = Package(
  name: "PhuboAPI",
  dependencies: [
    .Package(url: "https://github.com/qpre/octopus.git", majorVersion: 1),
    .Package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", versions: "2.3.3" ..< Version.max)
  ]
)
