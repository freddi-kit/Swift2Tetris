//
//  CPUTest.swift
//  Swift2TetrisTests
//
//  Created by 秋勇紀 on 2020/05/10.
//

import XCTest
@testable import Swift2TetrisKit

class CPUTest: XCTestCase {

    
    func testCPU() throws {
        var cpu = CPU()
        let result1 = cpu.out(inst: Bit16(bits: (.low, .low, .high, .high, .low, .low, .low, .low, .low, .low, .high, .high, .high, .low, .low, .high)), inM: .allLow, reset: .low)
        XCTAssertEqual(result1.writeM, .low)
        XCTAssertEqual(result1.pc, .allLow)
        XCTAssertEqual(result1.addressM, .allLow)
        XCTAssertEqual(result1.outM, .allLow)
        
        let result2 = cpu.out(inst: Bit16(bits: (.low, .low, .high, .high, .low, .low, .low, .low, .low, .low, .high, .high, .high, .low, .low, .high)), inM: .allLow, reset: .low)
        XCTAssertEqual(result2.writeM, .low)
        XCTAssertEqual(result2.pc, Bit15.incrementor(x: .allLow))
        XCTAssertEqual(result2.addressM, .allLow)
        XCTAssertEqual(result2.outM, .allLow)
        
        // 111 0 1100 00 10 0 000
        let result3 = cpu.out(inst: Bit16(bits: (.high, .high, .high, .low, .high, .high, .low, .low, .low, .low, .low, .high, .low, .low, .low, .low)), inM: .allLow, reset: .low)
        XCTAssertEqual(result3.writeM, .high)
        XCTAssertEqual(result3.pc, Bit15.incrementor(x: Bit15.incrementor(x:.allLow)))
        XCTAssertEqual(result3.addressM, .allLow)
        XCTAssertEqual(result3.outM, .allLow)
    }
}
