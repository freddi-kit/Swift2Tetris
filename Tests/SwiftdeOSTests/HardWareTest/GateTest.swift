//
//  GateTest.swift
//  
//
//  Created by 秋勇紀 on 2020/05/05.
//

import XCTest
@testable import SwiftdeOSKit
    
final class GateTest: XCTestCase {
    
    func testNandGate() throws {
        XCTAssertEqual(Bit.nand(x: .low, y: .low), .high)
        XCTAssertEqual(Bit.nand(x: .low, y: .high), .high)
        XCTAssertEqual(Bit.nand(x: .high, y: .low), .high)
        XCTAssertEqual(Bit.nand(x: .high, y: .high), .low)
    }
    
    func testNotGate() throws {
        XCTAssertEqual(Bit.not(x: .high), .low)
        XCTAssertEqual(Bit.not(x: .low), .high)
    }
    
    func testOrGate() throws {
        XCTAssertEqual(Bit.or(x: .low, y: .low), .low)
        XCTAssertEqual(Bit.or(x: .low, y: .high), .high)
        XCTAssertEqual(Bit.or(x: .high, y: .low), .high)
        XCTAssertEqual(Bit.or(x: .high, y: .high), .high)
    }
    
    func testAndGate() throws {
        XCTAssertEqual(Bit.and(x: .low, y: .low), .low)
        XCTAssertEqual(Bit.and(x: .low, y: .high), .low)
        XCTAssertEqual(Bit.and(x: .high, y: .low), .low)
        XCTAssertEqual(Bit.and(x: .high, y: .high), .high)
    }
    
    func testXorGate() throws {
        XCTAssertEqual(Bit.xor(x: .low, y: .low), .low)
        XCTAssertEqual(Bit.xor(x: .low, y: .high), .high)
        XCTAssertEqual(Bit.xor(x: .high, y: .low), .high)
        XCTAssertEqual(Bit.xor(x: .high, y: .high), .low)
    }
    
    static var allTests = [
        ("testGate", testNotGate),
    ]
}
