// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RaylibSwift",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "RaylibSwift",
            targets: ["RaylibSwift"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "RaylibSwift",
            dependencies: [],
	    sources: ["RaylibSwift.c"],
	    publicHeadersPath: "include",
	    cSettings: [
	    	       .headerSearchPath("include"),
		       .define("PLATFORM", to: "PLATFORM_RPI"),
       		       .define("GRAPHICS_API_OPENGL_ES2", to: "1"),
		       .unsafeFlags([
			    ])
			    ],
	    linkerSettings: [
	    		    .linkedLibrary(":/usr/local/lib/libraylib.a"),
    	    		    .linkedLibrary(":/opt/vc/lib/libbrcmGLESv2.so"),
    	    		    .linkedLibrary(":/opt/vc/lib/libbrcmEGL.so"),
    	    		    .linkedLibrary(":/opt/vc/lib/libbcm_host.so"),			    
			    
//			    .linkedLibrary("brcmGLESv2"),
//			    .linkedLibrary("brcmEGL"),
//    			    .linkedLibrary("bcm_host") //,
//			    .unsafeFlags([
//			    "-L/usr/local/lib",
//			    "-L/opt/vc/lib",
//			    ])
			    ]
	    ),
        .testTarget(
            name: "RaylibSwiftTests",
            dependencies: ["RaylibSwift"]),
    ]
)
