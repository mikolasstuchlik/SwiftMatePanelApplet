// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftMatePanelApplet",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SwiftMatePanelApplet",
            targets: ["SwiftMatePanelApplet"]),
    ],
    dependencies: [
        .package(name: "gir2swift", url: "https://github.com/rhx/gir2swift.git", .branch("main")),
        .package(name: "Gtk", url: "https://github.com/rhx/SwiftGtk.git", .branch("gtk3"))
    ],
    targets: [
        .systemLibrary(name: "CMatePanelApplet", pkgConfig: "libmatepanelapplet-4.0"),
        .target(
            name: "SwiftMatePanelApplet",
            dependencies: ["CMatePanelApplet", "Gtk"])
    ]
)
