import PackageDescription

let package = Package(
  name: "PhuboAPI",
  dependencies: [
    .Package(url: "https://github.com/qpre/octopus.git", majorVersion: 1),
  ]
)
