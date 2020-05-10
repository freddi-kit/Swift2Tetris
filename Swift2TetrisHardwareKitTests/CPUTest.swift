//
//  CPUTest.swift
//  Swift2TetrisTests
//
//  Created by 秋勇紀 on 2020/05/10.
//

import XCTest
@testable import Swift2TetrisHardwareKit

/// Copy  from `CPU.cmp`
class CPUTest: XCTestCase {
    
    private let bit1000ByBit15 = Bit15(bits: (.low, .low, .low, .low, .low, .high, .high, .high, .high, .high, .low, .high, .low, .low, .low))
    private let inMFrom9 = Bit16(bits: (.low, .low, .high, .low, .high, .low, .high, .high, .low, .high, .high, .low, .low, .high, .high, .high))

    
    func testCPU() throws {
        var cpu = CPU()
        let result0 = cpu.out(inst: Bit16(bits: (.low, .low, .high, .high, .low, .low, .low, .low, .low, .low, .high, .high, .high, .low, .low, .high)), inM: .allLow, reset: .low)
        XCTAssertEqual(result0.writeM, .low)
        XCTAssertEqual(result0.pc, .allLow)
        XCTAssertEqual(result0.addressM, .allLow)
        
        let result1 = cpu.out(inst: Bit16(bits: (.high, .high, .high, .low, .high, .high, .low, .low, .low, .low, .low, .high, .low, .low, .low, .low)), inM: .allLow, reset: .low)
        XCTAssertEqual(result1.writeM, .low)
        XCTAssertEqual(result1.pc, .incrementor(x: .allLow))
        XCTAssertEqual(result1.addressM, Bit15(bits: (.low, .high, .high, .low, .low, .low, .low, .low, .low, .high, .high, .high, .low, .low, .high)))
        
        let result2 = cpu.out(inst: Bit16(bits: (.low, .high, .low, .high, .high, .low, .high, .high, .high, .low, .high, .low, .low, .low, .low, .low)), inM: .allLow, reset: .low)
        XCTAssertEqual(result2.writeM, .low)
        XCTAssertEqual(result2.pc, .incrementor(x: .incrementor(x:.allLow)))
        XCTAssertEqual(result2.addressM, Bit15(bits: (.low, .high, .high, .low, .low, .low, .low, .low, .low, .high, .high, .high, .low, .low, .high)))
        
        let result3 = cpu.out(inst: Bit16(bits: (.high, .high, .high, .low, .low, .low, .low, .high, .high, .high, .low, .high, .low, .low, .low, .low)), inM: .allLow, reset: .low)
        XCTAssertEqual(result3.writeM, .low)
        XCTAssertEqual(result3.pc, .incrementor(x: .incrementor(x: .incrementor(x:.allLow))))
        XCTAssertEqual(result3.addressM, Bit15(bits: (.high, .low, .high, .high, .low, .high, .high, .high, .low, .high, .low, .low, .low, .low, .low)))
        
        let result4 = cpu.out(inst: Bit16(bits: (.low, .low, .low, .low, .low, .low, .high, .high, .high, .high, .high, .low, .high, .low, .low, .low)), inM: .allLow, reset: .low)
        XCTAssertEqual(result4.writeM, .low)
        XCTAssertEqual(result4.pc, .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x:.allLow)))))
        XCTAssertEqual(result4.addressM, Bit15(bits: (.high, .low, .high, .high, .low, .high, .high, .high, .low, .high, .low, .low, .low, .low, .low)))

        let result5 = cpu.out(inst: Bit16(bits: (.high, .high, .high, .low, .low, .low, .high, .high, .low, .low, .low, .low, .high, .low, .low, .low)), inM: .allLow, reset: .low)
        XCTAssertEqual(result5.writeM, .high)
        XCTAssertEqual(result5.pc, .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x:.allLow))))))
        XCTAssertEqual(result5.addressM, bit1000ByBit15)
        XCTAssertEqual(result5.outM, Bit16(bits: (.low, .low, .high, .low, .high, .low, .high, .high, .low, .high, .high, .low, .low, .high, .high, .high)))
        
        let result6 = cpu.out(inst: Bit16(bits: (.low, .low, .low, .low, .low, .low, .high, .high, .high, .high, .high, .low, .high, .low, .low, .high)), inM: .allLow, reset: .low)
        XCTAssertEqual(result6.writeM, .low)
        XCTAssertEqual(result6.pc, .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x:.allLow)))))))
        XCTAssertEqual(result6.addressM, bit1000ByBit15)
        
        let result7 = cpu.out(inst: Bit16(bits: (.high, .high, .high, .low, .low, .low, .high, .high, .high, .low, .low, .high, .high, .low, .low, .low)), inM: .allLow, reset: .low)
        XCTAssertEqual(result7.writeM, .high)
        XCTAssertEqual(result7.pc, .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x:.allLow))))))))
        XCTAssertEqual(result7.addressM, Bit15(bits: (.low, .low, .low, .low, .low, .high, .high, .high, .high, .high, .low, .high, .low, .low, .high)))
        XCTAssertEqual(result7.outM, Bit16(bits: (.low, .low, .high, .low, .high, .low, .high, .high, .low, .high, .high, .low, .low, .high, .high, .low)))
        
        let result8 = cpu.out(inst: Bit16(bits: (.low, .low, .low, .low, .low, .low, .high, .high, .high, .high, .high, .low, .high, .low, .low, .low)), inM: .allLow, reset: .low)
        XCTAssertEqual(result8.writeM, .low)
        XCTAssertEqual(result8.pc, .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x:.allLow)))))))))
        XCTAssertEqual(result8.addressM, Bit15(bits: (.low, .low, .low, .low, .low, .high, .high, .high, .high, .high, .low, .high, .low, .low, .high)))

        let result9 = cpu.out(inst: Bit16(bits: (.high, .high, .high, .high, .low, .high, .low, .low, .high, .high, .low, .high, .low, .low, .low, .low)), inM: inMFrom9, reset: .low)
        XCTAssertEqual(result9.writeM, .low)
        XCTAssertEqual(result9.pc, .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x:.allLow))))))))))
        XCTAssertEqual(result9.addressM, bit1000ByBit15)
        
        let result10 = cpu.out(inst: Bit16(bits: (.low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .high, .high, .high, .low)), inM: inMFrom9, reset: .low)
        XCTAssertEqual(result10.writeM, .low)
        XCTAssertEqual(result10.pc, .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x:.allLow)))))))))))
        XCTAssertEqual(result10.addressM, bit1000ByBit15)
        
        let result11 = cpu.out(inst: Bit16(bits: (.high, .high, .high, .low, .low, .low, .high, .high, .low, .low, .low, .low, .low, .high, .low, .low)), inM:  inMFrom9, reset: .low)
        XCTAssertEqual(result11.writeM, .low)
        XCTAssertEqual(result11.pc, .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x:.allLow))))))))))))
        XCTAssertEqual(result11.addressM, Bit15(bits: (.low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .high, .high, .high, .low)))
        
        let result12 = cpu.out(inst: Bit16(bits: (.low, .low, .low, .low, .low, .low, .high, .high, .high, .high, .high, .low, .low, .high, .high, .high)), inM:  inMFrom9, reset: .low)
        XCTAssertEqual(result12.writeM, .low)
        XCTAssertEqual(result12.pc, Bit15(bits: (.low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .high, .high, .high, .low)))
        XCTAssertEqual(result12.addressM, Bit15(bits: (.low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .high, .high, .high, .low)))
        
        let result13 = cpu.out(inst: Bit16(bits: (.high, .high, .high, .low, .high, .high, .low, .high, .high, .high, .high, .low, .low, .low, .low, .low)), inM:  inMFrom9, reset: .low)
        XCTAssertEqual(result13.writeM, .low)
        XCTAssertEqual(result13.pc, .incrementor(x: Bit15(bits: (.low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .high, .high, .high, .low))))
        XCTAssertEqual(result13.addressM, Bit15(bits: (.low, .low, .low, .low, .low, .high, .high, .high, .high, .high, .low, .low, .high, .high, .high)))

        let result14 = cpu.out(inst: Bit16(bits: (.high, .high, .high, .low, .low, .low, .high, .high, .low, .low, .low, .low, .high, .low, .low, .low)), inM: inMFrom9, reset: .low)
        XCTAssertEqual(result14.writeM, .high)
        XCTAssertEqual(result14.pc, .incrementor(x: .incrementor(x: Bit15(bits: (.low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .high, .high, .high, .low)))))
        XCTAssertEqual(result14.addressM, bit1000ByBit15)
        XCTAssertEqual(result14.outM, .allHigh)
        
        let result15 = cpu.out(inst: Bit16(bits: (.low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .high, .low, .high, .low, .high)), inM: inMFrom9, reset: .low)
        XCTAssertEqual(result15.writeM, .low)
        XCTAssertEqual(result15.pc, .incrementor(x: .incrementor(x: .incrementor(x: Bit15(bits: (.low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .high, .high, .high, .low))))))
        XCTAssertEqual(result15.addressM, bit1000ByBit15)
        
        let result16 = cpu.out(inst: Bit16(bits: (.high, .high, .high, .low, .low, .high, .high, .high, .high, .high, .low, .low, .low, .low, .high, .low)), inM: inMFrom9, reset: .low)
        XCTAssertEqual(result16.writeM, .low)
        XCTAssertEqual(result16.pc, .incrementor(x: .incrementor(x: .incrementor(x: .incrementor(x: Bit15(bits: (.low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .high, .high, .high, .low)))))))
        XCTAssertEqual(result16.addressM, Bit15(bits: (.low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .high, .low, .high, .low, .high)))
        
        let result17 = cpu.out(inst: Bit16(bits: (.low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .high, .low)), inM: inMFrom9, reset: .low)
        XCTAssertEqual(result17.writeM, .low)
        XCTAssertEqual(result17.pc, Bit15(bits: (.low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .high, .low, .high, .low, .high)))
        XCTAssertEqual(result17.addressM, Bit15(bits: (.low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .high, .low, .high, .low, .high)))
        
        let result18 = cpu.out(inst: Bit16(bits: (.high, .high, .high, .low, .low, .low, .low, .low, .high, .low, .low, .high, .low, .low, .low, .low)), inM: inMFrom9, reset: .low)
        XCTAssertEqual(result18.writeM, .low)
        XCTAssertEqual(result18.pc, .incrementor(x: Bit15(bits: (.low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .high, .low, .high, .low, .high))))
        XCTAssertEqual(result18.addressM, Bit15(bits: (.low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .high, .low)))
        
        let result19 = cpu.out(inst: Bit16(bits: (.low, .low, .low, .low, .low, .low, .high, .high, .high, .high, .high, .low, .high, .low, .low, .low)), inM: inMFrom9, reset: .low)
        XCTAssertEqual(result19.writeM, .low)
        XCTAssertEqual(result19.pc, .incrementor(x: .incrementor(x: Bit15(bits: (.low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .high, .low, .high, .low, .high)))))
        XCTAssertEqual(result19.addressM, Bit15(bits: (.low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .high, .low)))
        
        let result20 = cpu.out(inst: Bit16(bits: (.high, .high, .high, .low, .high, .high, .high, .low, .high, .low, .low, .high, .low, .low, .low, .low)), inM: inMFrom9, reset: .low)
        XCTAssertEqual(result20.writeM, .low)
        XCTAssertEqual(result20.pc, .incrementor(x: .incrementor(x: .incrementor(x: Bit15(bits: (.low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .high, .low, .high, .low, .high))))))
        XCTAssertEqual(result20.addressM, bit1000ByBit15)
        
        var inst21to27 =  Bit16(bits: (.high, .high, .high, .low, .low, .low, .high, .high, .low, .low, .low, .low, .low, .low, .low, .high))
        var pc21to24 = Bit15.incrementor(x:.incrementor(x: .incrementor(x: .incrementor(x: Bit15(bits: (.low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .high, .low, .high, .low, .high))))))
        let result21 = cpu.out(inst: inst21to27, inM: inMFrom9, reset: .low)
        XCTAssertEqual(result21.writeM, .low)
        XCTAssertEqual(result21.pc, pc21to24)
        XCTAssertEqual(result21.addressM, bit1000ByBit15)
        
        inst21to27 = .incrementor(x: inst21to27)
        pc21to24 = .incrementor(x: pc21to24)
        
        let result22 = cpu.out(inst: inst21to27, inM: inMFrom9, reset: .low)
        XCTAssertEqual(result22.writeM, .low)
        XCTAssertEqual(result22.pc, pc21to24)
        XCTAssertEqual(result22.addressM, bit1000ByBit15)
        
        inst21to27 = .incrementor(x: inst21to27)
        pc21to24 = .incrementor(x: pc21to24)
        
        let result23 = cpu.out(inst: inst21to27, inM: inMFrom9, reset: .low)
        XCTAssertEqual(result23.writeM, .low)
        XCTAssertEqual(result23.pc, pc21to24)
        XCTAssertEqual(result23.addressM, bit1000ByBit15)
        
        inst21to27 = .incrementor(x: inst21to27)
        pc21to24 = .incrementor(x: pc21to24)

        let result24 = cpu.out(inst: inst21to27, inM: inMFrom9, reset: .low)
        XCTAssertEqual(result24.writeM, .low)
        XCTAssertEqual(result24.pc, pc21to24)
        XCTAssertEqual(result24.addressM, bit1000ByBit15)
        
        inst21to27 = .incrementor(x: inst21to27)
        
        let result25 = cpu.out(inst: inst21to27, inM: inMFrom9, reset: .low)
        XCTAssertEqual(result25.writeM, .low)
        XCTAssertEqual(result25.pc, bit1000ByBit15)
        XCTAssertEqual(result25.addressM, bit1000ByBit15)
        
        inst21to27 = .incrementor(x: inst21to27)
        
        let result26 = cpu.out(inst: inst21to27, inM: inMFrom9, reset: .low)
        XCTAssertEqual(result26.writeM, .low)
        XCTAssertEqual(result26.pc, bit1000ByBit15)
        XCTAssertEqual(result26.addressM, bit1000ByBit15)
        
        inst21to27 = .incrementor(x: inst21to27)
        
        let result27 = cpu.out(inst: inst21to27, inM: inMFrom9, reset: .low)
        XCTAssertEqual(result27.writeM, .low)
        XCTAssertEqual(result27.pc, bit1000ByBit15)
        XCTAssertEqual(result27.addressM, bit1000ByBit15)
        
        let result28 = cpu.out(inst: Bit16(bits: (.high, .high, .high, .low, .high, .low, .high, .low, .high, .low, .low, .high, .low, .low, .low, .low)), inM: inMFrom9, reset: .low)
        XCTAssertEqual(result28.writeM, .low)
        XCTAssertEqual(result28.pc, bit1000ByBit15)
        XCTAssertEqual(result28.addressM, bit1000ByBit15)
        
        var inst29to35 = Bit16(bits: (.high, .high, .high, .low, .low, .low, .high, .high, .low, .low, .low, .low, .low, .low, .low, .high))
        let result29 = cpu.out(inst: inst29to35, inM: inMFrom9, reset: .low)
        XCTAssertEqual(result29.writeM, .low)
        XCTAssertEqual(result29.pc, .incrementor(x: bit1000ByBit15))
        XCTAssertEqual(result29.addressM, bit1000ByBit15)
        
        inst29to35 = .incrementor(x: inst29to35)

        let result30 = cpu.out(inst: inst29to35, inM: inMFrom9, reset: .low)
        XCTAssertEqual(result30.writeM, .low)
        XCTAssertEqual(result30.pc, .incrementor(x: .incrementor(x: bit1000ByBit15)))
        XCTAssertEqual(result30.addressM, bit1000ByBit15)
        
        inst29to35 = .incrementor(x: inst29to35)

        let result31 = cpu.out(inst: inst29to35, inM: inMFrom9, reset: .low)
        XCTAssertEqual(result31.writeM, .low)
        XCTAssertEqual(result31.pc, bit1000ByBit15)
        XCTAssertEqual(result31.addressM, bit1000ByBit15)
        
        inst29to35 = .incrementor(x: inst29to35)
        
        let result32 = cpu.out(inst: inst29to35, inM: inMFrom9, reset: .low)
        XCTAssertEqual(result32.writeM, .low)
        XCTAssertEqual(result32.pc, bit1000ByBit15)
        XCTAssertEqual(result32.addressM, bit1000ByBit15)
        
        inst29to35 = .incrementor(x: inst29to35)
        
        let result33 = cpu.out(inst: inst29to35, inM: inMFrom9, reset: .low)
        XCTAssertEqual(result33.writeM, .low)
        XCTAssertEqual(result33.pc, .incrementor(x: bit1000ByBit15))
        XCTAssertEqual(result33.addressM, bit1000ByBit15)
        
        inst29to35 = .incrementor(x: inst29to35)

        let result34 = cpu.out(inst: inst29to35, inM: inMFrom9, reset: .low)
        XCTAssertEqual(result34.writeM, .low)
        XCTAssertEqual(result34.pc, .incrementor(x: .incrementor(x: bit1000ByBit15)))
        XCTAssertEqual(result34.addressM, bit1000ByBit15)
        
        inst29to35 = .incrementor(x: inst29to35)
  
        let result35 = cpu.out(inst: inst29to35, inM: inMFrom9, reset: .low)
        XCTAssertEqual(result35.writeM, .low)
        XCTAssertEqual(result35.pc, bit1000ByBit15)
        XCTAssertEqual(result35.addressM, bit1000ByBit15)
                
        let result36 = cpu.out(inst: Bit16(bits: (.high, .high, .high, .low, .high, .high, .high, .high, .high, .high, .low, .high, .low, .low, .low, .low)), inM: inMFrom9, reset: .low)
        XCTAssertEqual(result36.writeM, .low)
        XCTAssertEqual(result36.pc, bit1000ByBit15)
        XCTAssertEqual(result36.addressM, bit1000ByBit15)
        
        var inst37to43 = Bit16(bits: (.high, .high, .high, .low, .low, .low, .high, .high, .low, .low, .low, .low, .low, .low, .low, .high))

        let result37 = cpu.out(inst: inst37to43, inM: inMFrom9, reset: .low)
        XCTAssertEqual(result37.writeM, .low)
        XCTAssertEqual(result37.pc, .incrementor(x: bit1000ByBit15))
        XCTAssertEqual(result37.addressM, bit1000ByBit15)
        
        inst37to43 = .incrementor(x: inst37to43)
        
        let result38 = cpu.out(inst: inst37to43, inM: inMFrom9, reset: .low)
        XCTAssertEqual(result38.writeM, .low)
        XCTAssertEqual(result38.pc, bit1000ByBit15)
        XCTAssertEqual(result38.addressM, bit1000ByBit15)
        
        inst37to43 = .incrementor(x: inst37to43)
        
        let result39 = cpu.out(inst: inst37to43, inM: inMFrom9, reset: .low)
        XCTAssertEqual(result39.writeM, .low)
        XCTAssertEqual(result39.pc, .incrementor(x: bit1000ByBit15))
        XCTAssertEqual(result39.addressM, bit1000ByBit15)
        
        inst37to43 = .incrementor(x: inst37to43)
        
        let result40 = cpu.out(inst: inst37to43, inM: inMFrom9, reset: .low)
        XCTAssertEqual(result40.writeM, .low)
        XCTAssertEqual(result40.pc, bit1000ByBit15)
        XCTAssertEqual(result40.addressM, bit1000ByBit15)
        
        inst37to43 = .incrementor(x: inst37to43)
        
        let result41 = cpu.out(inst: inst37to43, inM: inMFrom9, reset: .low)
        XCTAssertEqual(result41.writeM, .low)
        XCTAssertEqual(result41.pc, .incrementor(x: bit1000ByBit15))
        XCTAssertEqual(result41.addressM, bit1000ByBit15)
        
        inst37to43 = .incrementor(x: inst37to43)
        
        let result42 = cpu.out(inst: inst37to43, inM: inMFrom9, reset: .low)
        XCTAssertEqual(result42.writeM, .low)
        XCTAssertEqual(result42.pc, bit1000ByBit15)
        XCTAssertEqual(result42.addressM, bit1000ByBit15)
        
        inst37to43 = .incrementor(x: inst37to43)
        
        let result43 = cpu.out(inst: inst37to43, inM: inMFrom9, reset: .low)
        XCTAssertEqual(result43.writeM, .low)
        XCTAssertEqual(result43.pc, .incrementor(x: bit1000ByBit15))
        XCTAssertEqual(result43.addressM, bit1000ByBit15)
        
        let result44 = cpu.out(inst: inst37to43, inM: inMFrom9, reset: .high)
        XCTAssertEqual(result44.writeM, .low)
        XCTAssertEqual(result44.pc, bit1000ByBit15)
        XCTAssertEqual(result44.addressM, bit1000ByBit15)
        
        let result45 = cpu.out(inst: inst37to43, inM: inMFrom9, reset: .high)
        XCTAssertEqual(result45.writeM, .low)
        XCTAssertEqual(result45.pc, .allLow)
        XCTAssertEqual(result45.addressM, bit1000ByBit15)
    }

    var allTests = [
        ("testCPU", testCPU)
    ]
}
