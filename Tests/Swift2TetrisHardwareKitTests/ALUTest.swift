//
//  ALUTest.swift
//  Swift2TetrisTests
//
//  Created by 秋勇紀 on 2020/05/08.
//

import XCTest
@testable import Swift2TetrisHardwareKit

class ALUTest: XCTestCase {
    
    private let testBit1 = Bit16(bits: (.low, .high, .low, .low, .high, .high, .low, .high, .high, .high, .low, .high, .high, .high, .high, .low))
    private let testBit2 = Bit16(bits: (.high, .low, .high, .low, .high, .low, .low, .high, .low, .high, .low, .low, .low, .low, .high, .high))

    func testALUZero() throws {
        let alu = ALU.alu(x: testBit1, y: testBit2, zx: .high, nx: .low, zy: .high, ny: .low, f: .high, no: .low)
        let result1 = alu.out
        let expected = Bit16.allLow
        XCTAssertEqual(result1, expected)
        XCTAssertEqual(alu.ng, .low)
        XCTAssertEqual(alu.zr, .high)
    }
    
    func testALUOne() throws {
        let alu = ALU.alu(x: testBit1, y: testBit2, zx: .high, nx: .high, zy: .high, ny: .high, f: .high, no: .high)
        let result1 = alu.out
        let expected = Bit16(bits: (Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.high))
        XCTAssertEqual(result1, expected)
        
        XCTAssertEqual(alu.ng, .low)
        XCTAssertEqual(alu.zr, .low)
    }

    func testALUMinusOne() throws {
        let alu = ALU.alu(x: testBit1, y: testBit2, zx: .high, nx: .high, zy: .high, ny: .low, f: .high, no: .low)
        let result1 = alu.out

        let expected = Bit16(bits: (Bit.high, Bit.high, Bit.high, Bit.high, Bit.high, Bit.high, Bit.high, Bit.high, Bit.high, Bit.high, Bit.high, Bit.high, Bit.high, Bit.high, Bit.high, Bit.high))
        XCTAssertEqual(result1, expected)
        
        XCTAssertEqual(alu.ng, .high)
        XCTAssertEqual(alu.zr, .low)
    }

    func testALUx() throws {
        let result1 = ALU.alu(x: testBit1, y: testBit2, zx: .low, nx: .low, zy: .high, ny: .high, f: .low, no: .low).out
        let expected = testBit1
        XCTAssertEqual(result1, expected)
    }
    
    func testALUy() throws {
        let result1 = ALU.alu(x: testBit1, y: testBit2, zx: .high, nx: .high, zy: .low, ny: .low, f: .low, no: .low).out
        let expected = testBit2
        XCTAssertEqual(result1, expected)
    }
    
    func testALUnotX() throws {
        let result1 = ALU.alu(x: testBit1, y: testBit2, zx: .low, nx: .low, zy: .high, ny: .high, f: .low, no: .high).out
        let expected = Bit16.not(x: testBit1)
        XCTAssertEqual(result1, expected)
    }

    func testALUnotY() throws {
        let result1 = ALU.alu(x: testBit1, y: testBit2, zx: .high, nx: .high, zy: .low, ny: .low, f: .low, no: .high).out
        let expected = Bit16.not(x: testBit2)
        XCTAssertEqual(result1, expected)
    }
    
    func testALUincrementX() throws {
        let result1 = ALU.alu(x: testBit1, y: testBit2, zx: .low, nx: .high, zy: .high, ny: .high, f: .high, no: .high).out
        let expected = Bit16.incrementor(x: testBit1)
        XCTAssertEqual(result1, expected)
    }
    
    func testALUOr() throws {
        let result1 = ALU.alu(x: testBit1, y: testBit2, zx: .low, nx: .high, zy: .low, ny: .high, f: .low, no: .high).out
        let expected = Bit16.or(x: testBit1, y: testBit2)
        XCTAssertEqual(result1, expected)
    }
    
    func testALUAnd() throws {
        let result1 = ALU.alu(x: testBit1, y: testBit2, zx: .low, nx: .low, zy: .low, ny: .low, f: .low, no: .low).out
        let expected = Bit16.and(x: testBit1, y: testBit2)
        XCTAssertEqual(result1, expected)
    }
    
    static var allTests = [
        ("testALUZero", testALUZero),
        ("testALUOne", testALUOne),
        ("testALUMinusOne", testALUMinusOne),
        ("testALUx", testALUx),
        ("testALUy", testALUy),
        ("testALUnotX", testALUnotX),
        ("testALUnotY", testALUnotY),
        ("testALUincrementX", testALUincrementX),
        ("testALUOr", testALUOr),
        ("testALUAnd", testALUAnd),
    ]
}
