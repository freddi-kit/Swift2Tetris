//
//  ALUTest.swift
//  SwiftdeOSTests
//
//  Created by 秋勇紀 on 2020/05/08.
//

import XCTest
@testable import SwiftdeOSKit

class ALUTest: XCTestCase {
    
    private let testBit1 = Bit16(bits: (.low, .high, .low, .low, .high, .high, .low, .high, .high, .high, .low, .high, .high, .high, .high, .low))
    private let testBit2 = Bit16(bits: (.high, .low, .high, .low, .high, .low, .low, .high, .low, .high, .low, .low, .low, .low, .high, .high))

    func testALUzxzy() throws {
        
        let result1 = ALU.alu(x: testBit1, y: testBit2, zx: .high, nx: .low, zy: .low, ny: .low, f: .low, no: .low)
        XCTAssertEqual(result1.bits.0, testBit2.bits.0)
        XCTAssertEqual(result1.bits.1, testBit2.bits.1)
        XCTAssertEqual(result1.bits.2, testBit2.bits.2)
        XCTAssertEqual(result1.bits.3, testBit2.bits.3)
        XCTAssertEqual(result1.bits.4, testBit2.bits.4)
        XCTAssertEqual(result1.bits.5, testBit2.bits.5)
        XCTAssertEqual(result1.bits.6, testBit2.bits.6)
        XCTAssertEqual(result1.bits.7, testBit2.bits.7)
        XCTAssertEqual(result1.bits.8, testBit2.bits.8)
        XCTAssertEqual(result1.bits.9, testBit2.bits.9)
        XCTAssertEqual(result1.bits.10, testBit2.bits.10)
        XCTAssertEqual(result1.bits.11, testBit2.bits.11)
        XCTAssertEqual(result1.bits.12, testBit2.bits.12)
        XCTAssertEqual(result1.bits.13, testBit2.bits.13)
        XCTAssertEqual(result1.bits.14, testBit2.bits.14)
        XCTAssertEqual(result1.bits.15, testBit2.bits.15)
        
        let result2 = ALU.alu(x: testBit1, y: testBit2, zx: .low, nx: .low, zy: .high, ny: .low, f: .low, no: .low)
        XCTAssertEqual(result2.bits.0, testBit1.bits.0)
        XCTAssertEqual(result2.bits.1, testBit1.bits.1)
        XCTAssertEqual(result2.bits.2, testBit1.bits.2)
        XCTAssertEqual(result2.bits.3, testBit1.bits.3)
        XCTAssertEqual(result2.bits.4, testBit1.bits.4)
        XCTAssertEqual(result2.bits.5, testBit1.bits.5)
        XCTAssertEqual(result2.bits.6, testBit1.bits.6)
        XCTAssertEqual(result2.bits.7, testBit1.bits.7)
        XCTAssertEqual(result2.bits.8, testBit1.bits.8)
        XCTAssertEqual(result2.bits.9, testBit1.bits.9)
        XCTAssertEqual(result2.bits.10, testBit1.bits.10)
        XCTAssertEqual(result2.bits.11, testBit1.bits.11)
        XCTAssertEqual(result2.bits.12, testBit1.bits.12)
        XCTAssertEqual(result2.bits.13, testBit1.bits.13)
        XCTAssertEqual(result2.bits.14, testBit1.bits.14)
        XCTAssertEqual(result2.bits.15, testBit1.bits.15)
    }
    
    func testALUAddr() throws {
        
        let result1 = ALU.alu(x: testBit1, y: testBit2, zx: .low, nx: .low, zy: .low, ny: .low, f: .low, no: .low)
        XCTAssertEqual(result1.bits.0, .high)
        XCTAssertEqual(result1.bits.1, .high)
        XCTAssertEqual(result1.bits.2, .high)
        XCTAssertEqual(result1.bits.3, .low)
        XCTAssertEqual(result1.bits.4, .low)
        XCTAssertEqual(result1.bits.5, .low)
        XCTAssertEqual(result1.bits.6, .high)
        XCTAssertEqual(result1.bits.7, .low)
        XCTAssertEqual(result1.bits.8, .low)
        XCTAssertEqual(result1.bits.9, .high)
        XCTAssertEqual(result1.bits.10, .high)
        XCTAssertEqual(result1.bits.11, .high)
        XCTAssertEqual(result1.bits.12, .high)
        XCTAssertEqual(result1.bits.13, .high)
        XCTAssertEqual(result1.bits.14, .low)
        XCTAssertEqual(result1.bits.15, .low)
    }
    
    func testALUAddrZxNx() throws {
        
        let result1 = ALU.alu(x: testBit1, y: .allLow, zx: .high, nx: .high, zy: .low, ny: .low, f: .low, no: .low)
        XCTAssertEqual(result1.bits.0, .high)
        XCTAssertEqual(result1.bits.1, .high)
        XCTAssertEqual(result1.bits.2, .high)
        XCTAssertEqual(result1.bits.3, .high)
        XCTAssertEqual(result1.bits.4, .high)
        XCTAssertEqual(result1.bits.5, .high)
        XCTAssertEqual(result1.bits.6, .high)
        XCTAssertEqual(result1.bits.7, .high)
        XCTAssertEqual(result1.bits.8, .high)
        XCTAssertEqual(result1.bits.9, .high)
        XCTAssertEqual(result1.bits.10, .high)
        XCTAssertEqual(result1.bits.11, .high)
        XCTAssertEqual(result1.bits.12, .high)
        XCTAssertEqual(result1.bits.13, .high)
        XCTAssertEqual(result1.bits.14, .high)
        XCTAssertEqual(result1.bits.15, .high)
    }
    
    func testALUAddrZyNy() throws {
        
        let result1 = ALU.alu(x: .allLow, y: testBit1, zx: .low, nx: .low, zy: .high, ny: .high, f: .low, no: .low)
        XCTAssertEqual(result1.bits.0, .high)
        XCTAssertEqual(result1.bits.1, .high)
        XCTAssertEqual(result1.bits.2, .high)
        XCTAssertEqual(result1.bits.3, .high)
        XCTAssertEqual(result1.bits.4, .high)
        XCTAssertEqual(result1.bits.5, .high)
        XCTAssertEqual(result1.bits.6, .high)
        XCTAssertEqual(result1.bits.7, .high)
        XCTAssertEqual(result1.bits.8, .high)
        XCTAssertEqual(result1.bits.9, .high)
        XCTAssertEqual(result1.bits.10, .high)
        XCTAssertEqual(result1.bits.11, .high)
        XCTAssertEqual(result1.bits.12, .high)
        XCTAssertEqual(result1.bits.13, .high)
        XCTAssertEqual(result1.bits.14, .high)
        XCTAssertEqual(result1.bits.15, .high)
    }
    
    func testALUAddrZxNxZyNy() throws {
        
        let result1 = ALU.alu(x: testBit1, y: testBit2, zx: .high, nx: .high, zy: .high, ny: .high, f: .low, no: .low)
        XCTAssertEqual(result1.bits.0, .low)
        XCTAssertEqual(result1.bits.1, .high)
        XCTAssertEqual(result1.bits.2, .high)
        XCTAssertEqual(result1.bits.3, .high)
        XCTAssertEqual(result1.bits.4, .high)
        XCTAssertEqual(result1.bits.5, .high)
        XCTAssertEqual(result1.bits.6, .high)
        XCTAssertEqual(result1.bits.7, .high)
        XCTAssertEqual(result1.bits.8, .high)
        XCTAssertEqual(result1.bits.9, .high)
        XCTAssertEqual(result1.bits.10, .high)
        XCTAssertEqual(result1.bits.11, .high)
        XCTAssertEqual(result1.bits.12, .high)
        XCTAssertEqual(result1.bits.13, .high)
        XCTAssertEqual(result1.bits.14, .high)
        XCTAssertEqual(result1.bits.15, .high)
    }
    
    func testALUAnd() throws {
        
        let result1 = ALU.alu(x: testBit1, y: testBit2, zx: .low, nx: .low, zy: .low, ny: .low, f: .high, no: .low)
        XCTAssertEqual(result1.bits.0, .low)
        XCTAssertEqual(result1.bits.1, .low)
        XCTAssertEqual(result1.bits.2, .low)
        XCTAssertEqual(result1.bits.3, .low)
        XCTAssertEqual(result1.bits.4, .high)
        XCTAssertEqual(result1.bits.5, .low)
        XCTAssertEqual(result1.bits.6, .low)
        XCTAssertEqual(result1.bits.7, .high)
        XCTAssertEqual(result1.bits.8, .low)
        XCTAssertEqual(result1.bits.9, .high)
        XCTAssertEqual(result1.bits.10, .low)
        XCTAssertEqual(result1.bits.11, .low)
        XCTAssertEqual(result1.bits.12, .low)
        XCTAssertEqual(result1.bits.13, .low)
        XCTAssertEqual(result1.bits.14, .high)
        XCTAssertEqual(result1.bits.15, .low)
    }
    
    func testALUAddrNoOut() throws {
        
        let result1 = ALU.alu(x: testBit1, y: testBit2, zx: .low, nx: .low, zy: .low, ny: .low, f: .low, no: .high)
        XCTAssertNotEqual(result1.bits.0, .high)
        XCTAssertNotEqual(result1.bits.1, .high)
        XCTAssertNotEqual(result1.bits.2, .high)
        XCTAssertNotEqual(result1.bits.3, .low)
        XCTAssertNotEqual(result1.bits.4, .low)
        XCTAssertNotEqual(result1.bits.5, .low)
        XCTAssertNotEqual(result1.bits.6, .high)
        XCTAssertNotEqual(result1.bits.7, .low)
        XCTAssertNotEqual(result1.bits.8, .low)
        XCTAssertNotEqual(result1.bits.9, .high)
        XCTAssertNotEqual(result1.bits.10, .high)
        XCTAssertNotEqual(result1.bits.11, .high)
        XCTAssertNotEqual(result1.bits.12, .high)
        XCTAssertNotEqual(result1.bits.13, .high)
        XCTAssertNotEqual(result1.bits.14, .low)
        XCTAssertNotEqual(result1.bits.15, .low)
        
    }
    
    static var allTests = [
        ("testALUzxzy", testALUzxzy),
        ("testALUAddr", testALUAddr),
        ("testALUAnd", testALUAnd),
        ("testALUAddrZxNx", testALUAddrZxNx),
        ("testALUAddrZyNy", testALUAddrZyNy),
        ("testALUAddrZxNxZyNy", testALUAddrZxNxZyNy),
        ("testALUAddrNoOut", testALUAddrNoOut),
    ]
}
