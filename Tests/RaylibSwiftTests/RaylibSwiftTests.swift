import XCTest
@testable import RaylibSwift

final class RaylibSwiftTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.

	let w : Int32 = 144
	let h : Int32 = 81
	var buf = Array<UInt8>(repeating: 0, count: Int(w * h * 4))
	InitWindow(w, h, "RaylibSwift");

	var frame = 0
	while (frame < 100) {
	 BeginDrawing();
	 DrawFPS(10,10);
	 EndDrawing();

	 if(frame == 60) {
	  	  glReadPixels(0, 0, w, h, UInt32(GL_RGBA), UInt32(GL_UNSIGNED_BYTE), &buf);
		  let head = "P7\nWIDTH \(w)\nHEIGHT \(h)\nDEPTH 8\nMAXVAL 255\nTUPLTYPE RGB_ALPHA\nENDHDR\n".data(using: .utf8)!
		  let d = Data(head + buf)
		  try? d.write(to: URL(fileURLWithPath: "/tmp/fps.pam"))
	 }

	 frame += 1
	 
	 }

        XCTAssertEqual("OK", "OK")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
