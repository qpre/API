import PackageDescription

let package = Package(
  name: "PhuboAPI",
  dependencies: [
    .Package(url: "https://github.com/qpre/swifter.git", majorVersion: 1),
  ]
)
