import XCTest
@testable import CoreFormatter

final class CoreFormatterTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CoreFormatter().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
