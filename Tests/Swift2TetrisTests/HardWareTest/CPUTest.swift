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
        let result0 = cpu.out(inst: Bit16(bits: (.low, .low, .high, .high, .low, .low, .low, .low, .low, .low, .high, .high, .high, .low, .low, .high)), inM: .allLow, reset: .low)
        XCTAssertEqual(result0.writeM, .low)
        XCTAssertEqual(result0.pc, .allLow)
        XCTAssertEqual(result0.addressM, .allLow)
        
        let result1 = cpu.out(inst: Bit16(bits: (.high, .high, .high, .low, .high, .high, .low, .low, .low, .low, .low, .high, .low, .low, .low, .low)), inM: .allLow, reset: .low)
        XCTAssertEqual(result1.writeM, .low)
        XCTAssertEqual(result1.pc, Bit15.incrementor(x: .allLow))
        XCTAssertEqual(result1.addressM, Bit15(bits: (.low, .high, .high, .low, .low, .low, .low, .low, .low, .high, .high, .high, .low, .low, .high)))
        
        let result2 = cpu.out(inst: Bit16(bits: (.low, .high, .low, .high, .high, .low, .high, .high, .high, .low, .high, .low, .low, .low, .low, .low)), inM: .allLow, reset: .low)
        XCTAssertEqual(result2.writeM, .low)
        XCTAssertEqual(result2.pc, Bit15.incrementor(x: Bit15.incrementor(x:.allLow)))
        XCTAssertEqual(result2.addressM, Bit15(bits: (.low, .high, .high, .low, .low, .low, .low, .low, .low, .high, .high, .high, .low, .low, .high)))
        
        let result3 = cpu.out(inst: Bit16(bits: (.high, .high, .high, .low, .low, .low, .low, .high, .high, .high, .low, .high, .low, .low, .low, .low)), inM: .allLow, reset: .low)
        XCTAssertEqual(result3.writeM, .low)
        XCTAssertEqual(result3.pc, Bit15.incrementor(x: Bit15.incrementor(x: Bit15.incrementor(x:.allLow))))
        XCTAssertEqual(result3.addressM, Bit15(bits: (.high, .low, .high, .high, .low, .high, .high, .high, .low, .high, .low, .low, .low, .low, .low)))
        
        let result4 = cpu.out(inst: Bit16(bits: (.low, .low, .low, .low, .low, .low, .high, .high, .high, .high, .high, .low, .high, .low, .low, .low)), inM: .allLow, reset: .low)
        XCTAssertEqual(result4.writeM, .low)
        XCTAssertEqual(result4.pc, Bit15.incrementor(x: Bit15.incrementor(x: Bit15.incrementor(x: Bit15.incrementor(x:.allLow)))))
        XCTAssertEqual(result4.addressM, Bit15(bits: (.high, .low, .high, .high, .low, .high, .high, .high, .low, .high, .low, .low, .low, .low, .low)))

        let result5 = cpu.out(inst: Bit16(bits: (.high, .high, .high, .low, .low, .low, .high, .high, .low, .low, .low, .low, .high, .low, .low, .low)), inM: .allLow, reset: .low)
        XCTAssertEqual(result5.writeM, .high)
        XCTAssertEqual(result5.pc, Bit15.incrementor(x: Bit15.incrementor(x: Bit15.incrementor(x: Bit15.incrementor(x: Bit15.incrementor(x:.allLow))))))
        XCTAssertEqual(result5.addressM, Bit15(bits: (.low, .low, .low, .low, .low, .high, .high, .high, .high, .high, .low, .high, .low, .low, .low)))
        XCTAssertEqual(result5.outM, Bit16(bits: (.low, .low, .high, .low, .high, .low, .high, .high, .low, .high, .high, .low, .low, .high, .high, .high)))
        
        let result6 = cpu.out(inst: Bit16(bits: (.low, .low, .low, .low, .low, .low, .high, .high, .high, .high, .high, .low, .high, .low, .low, .high)), inM: .allLow, reset: .low)
        XCTAssertEqual(result6.writeM, .low)
        XCTAssertEqual(result6.pc, Bit15.incrementor(x: Bit15.incrementor(x: Bit15.incrementor(x: Bit15.incrementor(x: Bit15.incrementor(x: Bit15.incrementor(x:.allLow)))))))
        XCTAssertEqual(result6.addressM, Bit15(bits: (.low, .low, .low, .low, .low, .high, .high, .high, .high, .high, .low, .high, .low, .low, .low)))
        
        let result7 = cpu.out(inst: Bit16(bits: (.high, .high, .high, .low, .low, .low, .high, .high, .high, .low, .low, .high, .high, .low, .low, .low)), inM: .allLow, reset: .low)
        XCTAssertEqual(result7.writeM, .high)
        XCTAssertEqual(result7.pc, Bit15.incrementor(x: Bit15.incrementor(x: Bit15.incrementor(x: Bit15.incrementor(x: Bit15.incrementor(x: Bit15.incrementor(x: Bit15.incrementor(x:.allLow))))))))
        XCTAssertEqual(result7.addressM, Bit15(bits: (.low, .low, .low, .low, .low, .high, .high, .high, .high, .high, .low, .high, .low, .low, .high)))
        XCTAssertEqual(result7.outM, Bit16(bits: (.low, .low, .high, .low, .high, .low, .high, .high, .low, .high, .high, .low, .low, .high, .high, .low)))
        
        let result8 = cpu.out(inst: Bit16(bits: (.low, .low, .low, .low, .low, .low, .high, .high, .high, .high, .high, .low, .high, .low, .low, .low)), inM: .allLow, reset: .low)
        XCTAssertEqual(result8.writeM, .low)
        XCTAssertEqual(result8.pc, Bit15.incrementor(x: Bit15.incrementor(x: Bit15.incrementor(x: Bit15.incrementor(x: Bit15.incrementor(x: Bit15.incrementor(x: Bit15.incrementor(x: Bit15.incrementor(x:.allLow)))))))))
        XCTAssertEqual(result8.addressM, Bit15(bits: (.low, .low, .low, .low, .low, .high, .high, .high, .high, .high, .low, .high, .low, .low, .high)))
    }
}
