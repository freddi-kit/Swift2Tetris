//
//  ProgramCoutnerTest.swift
//  Swift2Tetris
//
//  Created by 秋勇紀 on 2020/05/09.
//

import XCTest
@testable import Swift2TetrisHardwareKit

class ProgramCoutnerTest: XCTestCase {
    
    private let random = { () -> Bit in
        if Int.random(in: 0...1) == 1 {
            return .low
        }
        
        return .high
    }
    
    func testPC() throws {
        var pc = ProgramCounter<Bit16>()
        
        let input = (
            random(),
            random(),
            random(),
            random(),
            random(),
            random(),
            random(),
            random(),
            random(),
            random(),
            random(),
            random(),
            random(),
            random(),
            random(),
            random()
        )
        
        let result1 = pc.out(in: Bit16(bits: input), inc: .low, load: .low, reset: .low)
        
        XCTAssertEqual(result1, .allLow, "[Should Not written]: \(result1)")
        
        let result2 = pc.out(in: Bit16(bits: input), inc: .low, load: .high, reset: .low)
        
        XCTAssertEqual(result2, .allLow, "[Should Not written]: \(result2)")
        
        let result3 = pc.out(in: .allLow, inc: .low, load: .low, reset: .low)
        
        XCTAssertEqual(result3, Bit16(bits: input),
        """
        [Should written]
           expected result: \(input)
           actural  result: \(result3)
        """)
        
        let _ = pc.out(in: .allLow, inc: .high, load: .low, reset: .low)
        let incrementedInput = Bit16.incrementor(x: Bit16(bits: input)).bits
        
        let result4 = pc.out(in: .allLow, inc: .low, load: .low, reset: .low)
        
        XCTAssertEqual(result4, Bit16(bits: incrementedInput),
        """
        [Should written]
            incremented result: \(incrementedInput)
            actural result    : \(result4)
        """)
        
        let _ = pc.out(in: .allLow, inc: .high, load: .low, reset: .high)
        let result5 = pc.out(in: .allLow, inc: .low, load: .low, reset: .low)

        XCTAssertEqual(result5, .allLow, "[Should Not reset]: \(result5)")
        
        let _ = pc.out(in: Bit16(bits: input), inc: .high, load: .high, reset: .low)
        let result6 = pc.out(in: .allLow, inc: .low, load: .low, reset: .low)

        XCTAssertEqual(result6, Bit16(bits: input), "[Should Not increment]: \(result6)")
        
        let _ = pc.out(in: Bit16(bits: input), inc: .high, load: .high, reset: .high)
        let result7 = pc.out(in: .allLow, inc: .low, load: .low, reset: .low)

        XCTAssertEqual(result7, .allLow, "[Should Not increment]: \(result7)")
    }

    var allTests = [
        ("testPC", testPC)
    ]
}
