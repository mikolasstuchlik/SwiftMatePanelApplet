// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MatePanelApplet",
    products: [
        .executable(
            name: "MatePanelAppletDemo",
            targets: ["MatePanelAppletDemo"]
        ),
        .library(
            name: "MatePanelApplet",
            targets: ["MatePanelApplet"]
        ),
    ],
    dependencies: [
        .package(name: "gir2swift", url: "https://github.com/rhx/gir2swift.git", .branch("main")),
        .package(name: "Gtk", url: "https://github.com/rhx/SwiftGtk.git", .branch("gtk3"))
    ],
    targets: [
        .systemLibrary(
            name: "CMatePanelApplet", 
            pkgConfig: "libmatepanelapplet-4.0", 
            providers: [.apt(["libmate-panel-applet-dev"])]
        ),
        .target(
            name: "MatePanelApplet", 
            dependencies: ["CMatePanelApplet", "Gtk"],
            swiftSettings: [.unsafeFlags(["-Xfrontend", "-serialize-debugging-options"], .when(configuration: .debug))]
        ),
        .target(
            name: "MatePanelAppletDemo", 
            dependencies: ["MatePanelApplet"]
        ),
    ]
)
