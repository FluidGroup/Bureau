// swift-tools-version:5.5
import PackageDescription

let package = Package(
  name: "Bureau",
  platforms: [.iOS(.v12)],
  products: [
    .library(name: "Bureau", targets: ["Bureau"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "Bureau",
      path: "Bureau",
      exclude: ["Info.plist"]
    ),
  ]
)
