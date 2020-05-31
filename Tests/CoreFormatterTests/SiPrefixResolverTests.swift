//
//  File.swift
//  
//
//  Created by Jan Ruhlaender on 31.05.20.
//
import XCTest
import CoreFormatter
import Foundation

final class CoreSiPrefixResolverTests: XCTestCase {

    @available(iOS 10.0, *)
    func testBasic() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let resolver = SiPrefixResolver.default
        XCTAssertEqual(resolver.resolve(for: 1234), .kilo)
        XCTAssertEqual(resolver.resolve(for: 0), .none)
        XCTAssertEqual(resolver.resolve(for: 999.99), .none)
        XCTAssertEqual(resolver.resolve(for: 0.1), .milli)
        XCTAssertEqual(resolver.resolve(for: 0.001), .milli)
        XCTAssertEqual(resolver.resolve(for: 0.0001), .micro)
        XCTAssertEqual(resolver.resolve(for: 0.000001), .micro)
        XCTAssertEqual(resolver.resolve(for: 0.0000001), .nano)
    }

    func testFormatter() {
        let formatter = SiNumberFormatter(unitSymbol: "V")
        formatter.forcedPrefix = .kilo
        formatter.fractionDigits = 0

        XCTAssertEqual("1 234 568 kV", formatter.string(for: 1234567890))
        formatter.forcedPrefix = nil
        XCTAssertEqual("1 kV", formatter.string(for: 1234))
        formatter.forcedPrefix = SiPrefix.none
        formatter.thousandsSeparator = ","
        XCTAssertEqual("1,234 V", formatter.string(for: 1234))
        formatter.forcedPrefix = SiPrefix.none
        formatter.thousandsSeparator = " "
        formatter.decimalSeparator = ","
        formatter.fractionDigits = 3
        XCTAssertEqual("1 234,568 V", formatter.string(for: 1234.5678))

    }

//    static var allTests = [
//        ("testExample", testExample),
//    ]
}
