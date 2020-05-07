//
//  PlexorTest.swift
//  SwiftdeOSTests
//
//  Created by 秋勇紀 on 2020/05/08.
//

import XCTest
@testable import SwiftdeOSKit

class PlexorTest: XCTestCase {

    func testMultiPlexor() throws {
        XCTAssertEqual(Plexor.multiPlexor(a: Bit.low, b: Bit.low, sel: .low), .low)
        XCTAssertEqual(Plexor.multiPlexor(a: Bit.low, b: Bit.high, sel: .low), .low)
        XCTAssertEqual(Plexor.multiPlexor(a: Bit.high, b: Bit.low, sel: .low), .high)
        XCTAssertEqual(Plexor.multiPlexor(a: Bit.high, b: Bit.high, sel: .low), .high)
        XCTAssertEqual(Plexor.multiPlexor(a: Bit.low, b: Bit.low, sel: .high), .low)
        XCTAssertEqual(Plexor.multiPlexor(a: Bit.low, b: Bit.high, sel: .high), .high)
        XCTAssertEqual(Plexor.multiPlexor(a: Bit.high, b: Bit.low, sel: .high), .low)
        XCTAssertEqual(Plexor.multiPlexor(a: Bit.high, b: Bit.high, sel: .high), .high)
    }
    
    func testDeMultiPlexor() throws {
        let lowlow1 = Plexor.deMultiPlexor(in: Bit.low, sel: Bit.low)
        XCTAssertEqual(lowlow1.a, .low)
        XCTAssertEqual(lowlow1.b, .low)

        let lowlow2 = Plexor.deMultiPlexor(in: Bit.low, sel: Bit.high)
        XCTAssertEqual(lowlow2.a, .low)
        XCTAssertEqual(lowlow2.b, .low)
        
        let highlow = Plexor.deMultiPlexor(in: Bit.high, sel: Bit.low)
        XCTAssertEqual(highlow.a, .high)
        XCTAssertEqual(highlow.b, .low)
        
        let lowhigh = Plexor.deMultiPlexor(in: Bit.high, sel: Bit.high)
        XCTAssertEqual(lowhigh.a, .low)
        XCTAssertEqual(lowhigh.b, .high)
    }

    static var allTests = [
        ("testMultiPlexor", testMultiPlexor),
    ]
}
