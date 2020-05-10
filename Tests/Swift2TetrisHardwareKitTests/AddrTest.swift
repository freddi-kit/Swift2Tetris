//
//  AddrTest.swift
//  Swift2TetrisTests
//
//  Created by 秋勇紀 on 2020/05/09.
//

import XCTest
@testable import Swift2TetrisHardwareKit

class AddrTest: XCTestCase {

    func testAddr() throws {
        let result = Adder.Add16(
            a: Bit16(bits: (.low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .high)),
            b: Bit16(bits: (.low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .high)))
        XCTAssertEqual(result.bits.0, .low)
        XCTAssertEqual(result.bits.1, .low)
        XCTAssertEqual(result.bits.2, .low)
        XCTAssertEqual(result.bits.3, .low)
        XCTAssertEqual(result.bits.4, .low)
        XCTAssertEqual(result.bits.5, .low)
        XCTAssertEqual(result.bits.6, .low)
        XCTAssertEqual(result.bits.7, .low)
        XCTAssertEqual(result.bits.8, .low)
        XCTAssertEqual(result.bits.9, .low)
        XCTAssertEqual(result.bits.10, .low)
        XCTAssertEqual(result.bits.11, .low)
        XCTAssertEqual(result.bits.12, .low)
        XCTAssertEqual(result.bits.13, .low)
        XCTAssertEqual(result.bits.14, .high)
        XCTAssertEqual(result.bits.15, .low)
    }

}
