//
//  ALUTest.swift
//  Swift2TetrisTests
//
//  Created by 秋勇紀 on 2020/05/08.
//

import XCTest
@testable import Swift2TetrisKit

class ALUTest: XCTestCase {
    
    private let testBit1 = Bit16(bits: (.low, .high, .low, .low, .high, .high, .low, .high, .high, .high, .low, .high, .high, .high, .high, .low))
    private let testBit2 = Bit16(bits: (.high, .low, .high, .low, .high, .low, .low, .high, .low, .high, .low, .low, .low, .low, .high, .high))

    func testALUZero() throws {
        let alu = ALU.alu(x: testBit1, y: testBit2, zx: .high, nx: .low, zy: .high, ny: .low, f: .high, no: .low)
        let result1 = alu.out
        let expected = Bit16.allLow.bits
        XCTAssertEqual(result1.bits.0, expected.0)
        XCTAssertEqual(result1.bits.1, expected.1)
        XCTAssertEqual(result1.bits.2, expected.2)
        XCTAssertEqual(result1.bits.3, expected.3)
        XCTAssertEqual(result1.bits.4, expected.4)
        XCTAssertEqual(result1.bits.5, expected.5)
        XCTAssertEqual(result1.bits.6, expected.6)
        XCTAssertEqual(result1.bits.7, expected.7)
        XCTAssertEqual(result1.bits.8, expected.8)
        XCTAssertEqual(result1.bits.9, expected.9)
        XCTAssertEqual(result1.bits.10, expected.10)
        XCTAssertEqual(result1.bits.11, expected.11)
        XCTAssertEqual(result1.bits.12, expected.12)
        XCTAssertEqual(result1.bits.13, expected.13)
        XCTAssertEqual(result1.bits.14, expected.14)
        XCTAssertEqual(result1.bits.15, expected.15)
        
        XCTAssertEqual(alu.ng, .low)
        XCTAssertEqual(alu.zr, .high)
    }
    
    func testALUOne() throws {
        let alu = ALU.alu(x: testBit1, y: testBit2, zx: .high, nx: .high, zy: .high, ny: .high, f: .high, no: .high)
        let result1 = alu.out
        let expected = (Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.high)
        XCTAssertEqual(result1.bits.0, expected.0)
        XCTAssertEqual(result1.bits.1, expected.1)
        XCTAssertEqual(result1.bits.2, expected.2)
        XCTAssertEqual(result1.bits.3, expected.3)
        XCTAssertEqual(result1.bits.4, expected.4)
        XCTAssertEqual(result1.bits.5, expected.5)
        XCTAssertEqual(result1.bits.6, expected.6)
        XCTAssertEqual(result1.bits.7, expected.7)
        XCTAssertEqual(result1.bits.8, expected.8)
        XCTAssertEqual(result1.bits.9, expected.9)
        XCTAssertEqual(result1.bits.10, expected.10)
        XCTAssertEqual(result1.bits.11, expected.11)
        XCTAssertEqual(result1.bits.12, expected.12)
        XCTAssertEqual(result1.bits.13, expected.13)
        XCTAssertEqual(result1.bits.14, expected.14)
        XCTAssertEqual(result1.bits.15, expected.15)
        
        XCTAssertEqual(alu.ng, .low)
        XCTAssertEqual(alu.zr, .low)
    }

    func testALUMinusOne() throws {
        let alu = ALU.alu(x: testBit1, y: testBit2, zx: .high, nx: .high, zy: .high, ny: .low, f: .high, no: .low)
        let result1 = alu.out

        let expected = (Bit.high, Bit.high, Bit.high, Bit.high, Bit.high, Bit.high, Bit.high, Bit.high, Bit.high, Bit.high, Bit.high, Bit.high, Bit.high, Bit.high, Bit.high, Bit.high)
        XCTAssertEqual(result1.bits.0, expected.0)
        XCTAssertEqual(result1.bits.1, expected.1)
        XCTAssertEqual(result1.bits.2, expected.2)
        XCTAssertEqual(result1.bits.3, expected.3)
        XCTAssertEqual(result1.bits.4, expected.4)
        XCTAssertEqual(result1.bits.5, expected.5)
        XCTAssertEqual(result1.bits.6, expected.6)
        XCTAssertEqual(result1.bits.7, expected.7)
        XCTAssertEqual(result1.bits.8, expected.8)
        XCTAssertEqual(result1.bits.9, expected.9)
        XCTAssertEqual(result1.bits.10, expected.10)
        XCTAssertEqual(result1.bits.11, expected.11)
        XCTAssertEqual(result1.bits.12, expected.12)
        XCTAssertEqual(result1.bits.13, expected.13)
        XCTAssertEqual(result1.bits.14, expected.14)
        XCTAssertEqual(result1.bits.15, expected.15)
        
        XCTAssertEqual(alu.ng, .high)
        XCTAssertEqual(alu.zr, .low)
    }

    func testALUx() throws {
        let result1 = ALU.alu(x: testBit1, y: testBit2, zx: .low, nx: .low, zy: .high, ny: .high, f: .low, no: .low).out
        let expected = testBit1.bits
        XCTAssertEqual(result1.bits.0, expected.0)
        XCTAssertEqual(result1.bits.1, expected.1)
        XCTAssertEqual(result1.bits.2, expected.2)
        XCTAssertEqual(result1.bits.3, expected.3)
        XCTAssertEqual(result1.bits.4, expected.4)
        XCTAssertEqual(result1.bits.5, expected.5)
        XCTAssertEqual(result1.bits.6, expected.6)
        XCTAssertEqual(result1.bits.7, expected.7)
        XCTAssertEqual(result1.bits.8, expected.8)
        XCTAssertEqual(result1.bits.9, expected.9)
        XCTAssertEqual(result1.bits.10, expected.10)
        XCTAssertEqual(result1.bits.11, expected.11)
        XCTAssertEqual(result1.bits.12, expected.12)
        XCTAssertEqual(result1.bits.13, expected.13)
        XCTAssertEqual(result1.bits.14, expected.14)
        XCTAssertEqual(result1.bits.15, expected.15)
    }
    
    func testALUy() throws {
        let result1 = ALU.alu(x: testBit1, y: testBit2, zx: .high, nx: .high, zy: .low, ny: .low, f: .low, no: .low).out
        let expected = testBit2.bits
        XCTAssertEqual(result1.bits.0, expected.0)
        XCTAssertEqual(result1.bits.1, expected.1)
        XCTAssertEqual(result1.bits.2, expected.2)
        XCTAssertEqual(result1.bits.3, expected.3)
        XCTAssertEqual(result1.bits.4, expected.4)
        XCTAssertEqual(result1.bits.5, expected.5)
        XCTAssertEqual(result1.bits.6, expected.6)
        XCTAssertEqual(result1.bits.7, expected.7)
        XCTAssertEqual(result1.bits.8, expected.8)
        XCTAssertEqual(result1.bits.9, expected.9)
        XCTAssertEqual(result1.bits.10, expected.10)
        XCTAssertEqual(result1.bits.11, expected.11)
        XCTAssertEqual(result1.bits.12, expected.12)
        XCTAssertEqual(result1.bits.13, expected.13)
        XCTAssertEqual(result1.bits.14, expected.14)
        XCTAssertEqual(result1.bits.15, expected.15)
    }
    
    func testALUnotX() throws {
        let result1 = ALU.alu(x: testBit1, y: testBit2, zx: .low, nx: .low, zy: .high, ny: .high, f: .low, no: .high).out
        let expected = Bit16.not(x: testBit1).bits
        XCTAssertEqual(result1.bits.0, expected.0)
        XCTAssertEqual(result1.bits.1, expected.1)
        XCTAssertEqual(result1.bits.2, expected.2)
        XCTAssertEqual(result1.bits.3, expected.3)
        XCTAssertEqual(result1.bits.4, expected.4)
        XCTAssertEqual(result1.bits.5, expected.5)
        XCTAssertEqual(result1.bits.6, expected.6)
        XCTAssertEqual(result1.bits.7, expected.7)
        XCTAssertEqual(result1.bits.8, expected.8)
        XCTAssertEqual(result1.bits.9, expected.9)
        XCTAssertEqual(result1.bits.10, expected.10)
        XCTAssertEqual(result1.bits.11, expected.11)
        XCTAssertEqual(result1.bits.12, expected.12)
        XCTAssertEqual(result1.bits.13, expected.13)
        XCTAssertEqual(result1.bits.14, expected.14)
        XCTAssertEqual(result1.bits.15, expected.15)
    }

    func testALUnotY() throws {
        let result1 = ALU.alu(x: testBit1, y: testBit2, zx: .high, nx: .high, zy: .low, ny: .low, f: .low, no: .high).out
        let expected = Bit16.not(x: testBit2).bits
        XCTAssertEqual(result1.bits.0, expected.0)
        XCTAssertEqual(result1.bits.1, expected.1)
        XCTAssertEqual(result1.bits.2, expected.2)
        XCTAssertEqual(result1.bits.3, expected.3)
        XCTAssertEqual(result1.bits.4, expected.4)
        XCTAssertEqual(result1.bits.5, expected.5)
        XCTAssertEqual(result1.bits.6, expected.6)
        XCTAssertEqual(result1.bits.7, expected.7)
        XCTAssertEqual(result1.bits.8, expected.8)
        XCTAssertEqual(result1.bits.9, expected.9)
        XCTAssertEqual(result1.bits.10, expected.10)
        XCTAssertEqual(result1.bits.11, expected.11)
        XCTAssertEqual(result1.bits.12, expected.12)
        XCTAssertEqual(result1.bits.13, expected.13)
        XCTAssertEqual(result1.bits.14, expected.14)
        XCTAssertEqual(result1.bits.15, expected.15)
    }
    
    func testALUincrementX() throws {
        let result1 = ALU.alu(x: testBit1, y: testBit2, zx: .low, nx: .high, zy: .high, ny: .high, f: .high, no: .high).out
        let expected = Bit16.incrementor(x: testBit1).bits
        XCTAssertEqual(result1.bits.0, expected.0)
        XCTAssertEqual(result1.bits.1, expected.1)
        XCTAssertEqual(result1.bits.2, expected.2)
        XCTAssertEqual(result1.bits.3, expected.3)
        XCTAssertEqual(result1.bits.4, expected.4)
        XCTAssertEqual(result1.bits.5, expected.5)
        XCTAssertEqual(result1.bits.6, expected.6)
        XCTAssertEqual(result1.bits.7, expected.7)
        XCTAssertEqual(result1.bits.8, expected.8)
        XCTAssertEqual(result1.bits.9, expected.9)
        XCTAssertEqual(result1.bits.10, expected.10)
        XCTAssertEqual(result1.bits.11, expected.11)
        XCTAssertEqual(result1.bits.12, expected.12)
        XCTAssertEqual(result1.bits.13, expected.13)
        XCTAssertEqual(result1.bits.14, expected.14)
        XCTAssertEqual(result1.bits.15, expected.15)
    }
    
    func testALUOr() throws {
        let result1 = ALU.alu(x: testBit1, y: testBit2, zx: .low, nx: .high, zy: .low, ny: .high, f: .low, no: .high).out
        let expected = Bit16.or(x: testBit1, y: testBit2).bits
        XCTAssertEqual(result1.bits.0, expected.0)
        XCTAssertEqual(result1.bits.1, expected.1)
        XCTAssertEqual(result1.bits.2, expected.2)
        XCTAssertEqual(result1.bits.3, expected.3)
        XCTAssertEqual(result1.bits.4, expected.4)
        XCTAssertEqual(result1.bits.5, expected.5)
        XCTAssertEqual(result1.bits.6, expected.6)
        XCTAssertEqual(result1.bits.7, expected.7)
        XCTAssertEqual(result1.bits.8, expected.8)
        XCTAssertEqual(result1.bits.9, expected.9)
        XCTAssertEqual(result1.bits.10, expected.10)
        XCTAssertEqual(result1.bits.11, expected.11)
        XCTAssertEqual(result1.bits.12, expected.12)
        XCTAssertEqual(result1.bits.13, expected.13)
        XCTAssertEqual(result1.bits.14, expected.14)
        XCTAssertEqual(result1.bits.15, expected.15)
    }
    
    func testALUAnd() throws {
        let result1 = ALU.alu(x: testBit1, y: testBit2, zx: .low, nx: .low, zy: .low, ny: .low, f: .low, no: .low).out
        let expected = Bit16.and(x: testBit1, y: testBit2).bits
        XCTAssertEqual(result1.bits.0, expected.0)
        XCTAssertEqual(result1.bits.1, expected.1)
        XCTAssertEqual(result1.bits.2, expected.2)
        XCTAssertEqual(result1.bits.3, expected.3)
        XCTAssertEqual(result1.bits.4, expected.4)
        XCTAssertEqual(result1.bits.5, expected.5)
        XCTAssertEqual(result1.bits.6, expected.6)
        XCTAssertEqual(result1.bits.7, expected.7)
        XCTAssertEqual(result1.bits.8, expected.8)
        XCTAssertEqual(result1.bits.9, expected.9)
        XCTAssertEqual(result1.bits.10, expected.10)
        XCTAssertEqual(result1.bits.11, expected.11)
        XCTAssertEqual(result1.bits.12, expected.12)
        XCTAssertEqual(result1.bits.13, expected.13)
        XCTAssertEqual(result1.bits.14, expected.14)
        XCTAssertEqual(result1.bits.15, expected.15)
    }
    
    static var allTests = [
        ("testALUZero", testALUZero),
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
