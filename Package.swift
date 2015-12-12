import PackageDescription

let package = Package(
  name: "PhuboAPI",
  dependencies: [
    .Package(url: "https://github.com/julien-c/swifter.git", majorVersion: 1),
  ]
)
