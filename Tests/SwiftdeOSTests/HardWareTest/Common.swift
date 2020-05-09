//
//  Common.swift
//  SwiftdeOS
//
//  Created by 秋勇紀 on 2020/05/09.
//

import XCTest
@testable import SwiftdeOSKit

func XCAssertBit16Equal(_ a: Bit16, _ b: Bit16, _ message: String = "") {
    XCTAssertEqual(a.bits.0, b.bits.0, message)
    XCTAssertEqual(a.bits.1, b.bits.1)
    XCTAssertEqual(a.bits.2, b.bits.2)
    XCTAssertEqual(a.bits.3, b.bits.3)
    XCTAssertEqual(a.bits.4, b.bits.4)
    XCTAssertEqual(a.bits.5, b.bits.5)
    XCTAssertEqual(a.bits.6, b.bits.6)
    XCTAssertEqual(a.bits.7, b.bits.7)
    XCTAssertEqual(a.bits.8, b.bits.8)
    XCTAssertEqual(a.bits.9, b.bits.9)
    XCTAssertEqual(a.bits.10, b.bits.10)
    XCTAssertEqual(a.bits.11, b.bits.11)
    XCTAssertEqual(a.bits.12, b.bits.12)
    XCTAssertEqual(a.bits.13, b.bits.13)
    XCTAssertEqual(a.bits.14, b.bits.14)
    XCTAssertEqual(a.bits.15, b.bits.15)
}
