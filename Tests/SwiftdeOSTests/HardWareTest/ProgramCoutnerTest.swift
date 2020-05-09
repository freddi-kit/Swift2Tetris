//
//  ProgramCoutnerTest.swift
//  SwiftdeOS
//
//  Created by 秋勇紀 on 2020/05/09.
//

import XCTest
@testable import SwiftdeOSKit

class ProgramCoutnerTest: XCTestCase {
    
    private let random = { () -> Bit in
        if Int.random(in: 0...1) == 1 {
            return .low
        }
        
        return .high
    }
    
    func testPC() throws {
        var pc = ProgramCounter()
        
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
        
        XCTAssertEqual(result1.bits.0, .low, "[Should Not written]: \(result1)")
        XCTAssertEqual(result1.bits.1, .low)
        XCTAssertEqual(result1.bits.2, .low)
        XCTAssertEqual(result1.bits.3, .low)
        XCTAssertEqual(result1.bits.4, .low)
        XCTAssertEqual(result1.bits.5, .low)
        XCTAssertEqual(result1.bits.6, .low)
        XCTAssertEqual(result1.bits.7, .low)
        XCTAssertEqual(result1.bits.8, .low)
        XCTAssertEqual(result1.bits.9, .low)
        XCTAssertEqual(result1.bits.10, .low)
        XCTAssertEqual(result1.bits.11, .low)
        XCTAssertEqual(result1.bits.12, .low)
        XCTAssertEqual(result1.bits.13, .low)
        XCTAssertEqual(result1.bits.14, .low)
        XCTAssertEqual(result1.bits.15, .low)
        
        let result2 = pc.out(in: Bit16(bits: input), inc: .low, load: .high, reset: .low)
        
        XCTAssertEqual(result2.bits.0, .low, "[Should Not written]: \(result2)")
        XCTAssertEqual(result2.bits.1, .low)
        XCTAssertEqual(result2.bits.2, .low)
        XCTAssertEqual(result2.bits.3, .low)
        XCTAssertEqual(result2.bits.4, .low)
        XCTAssertEqual(result2.bits.5, .low)
        XCTAssertEqual(result2.bits.6, .low)
        XCTAssertEqual(result2.bits.7, .low)
        XCTAssertEqual(result2.bits.8, .low)
        XCTAssertEqual(result2.bits.9, .low)
        XCTAssertEqual(result2.bits.10, .low)
        XCTAssertEqual(result2.bits.11, .low)
        XCTAssertEqual(result2.bits.12, .low)
        XCTAssertEqual(result2.bits.13, .low)
        XCTAssertEqual(result2.bits.14, .low)
        XCTAssertEqual(result2.bits.15, .low)
        
        let result3 = pc.out(in: .allLow, inc: .low, load: .low, reset: .low)
        
        XCTAssertEqual(result3.bits.0, input.0,
        """
        [Should written]
            expected result: \(input)
            actural  result: \(result3)
        """)
        XCTAssertEqual(result3.bits.1, input.1)
        XCTAssertEqual(result3.bits.2, input.2)
        XCTAssertEqual(result3.bits.3, input.3)
        XCTAssertEqual(result3.bits.4, input.4)
        XCTAssertEqual(result3.bits.5, input.5)
        XCTAssertEqual(result3.bits.6, input.6)
        XCTAssertEqual(result3.bits.7, input.7)
        XCTAssertEqual(result3.bits.8, input.8)
        XCTAssertEqual(result3.bits.9, input.9)
        XCTAssertEqual(result3.bits.10, input.10)
        XCTAssertEqual(result3.bits.11, input.11)
        XCTAssertEqual(result3.bits.12, input.12)
        XCTAssertEqual(result3.bits.13, input.13)
        XCTAssertEqual(result3.bits.14, input.14)
        XCTAssertEqual(result3.bits.15, input.15)
        
        let _ = pc.out(in: .allLow, inc: .high, load: .low, reset: .low)
        let incrementedInput = Incrementor.incrementor64(x: Bit16(bits: input)).bits
        
        let result4 = pc.out(in: .allLow, inc: .low, load: .low, reset: .low)
        
        XCTAssertEqual(result4.bits.0, incrementedInput.0,
        """
        [Should written]
            incremented result: \(incrementedInput)
            actural result    : \(result4)
        """)
        XCTAssertEqual(result4.bits.1, incrementedInput.1)
        XCTAssertEqual(result4.bits.2, incrementedInput.2)
        XCTAssertEqual(result4.bits.3, incrementedInput.3)
        XCTAssertEqual(result4.bits.4, incrementedInput.4)
        XCTAssertEqual(result4.bits.5, incrementedInput.5)
        XCTAssertEqual(result4.bits.6, incrementedInput.6)
        XCTAssertEqual(result4.bits.7, incrementedInput.7)
        XCTAssertEqual(result4.bits.8, incrementedInput.8)
        XCTAssertEqual(result4.bits.9, incrementedInput.9)
        XCTAssertEqual(result4.bits.10, incrementedInput.10)
        XCTAssertEqual(result4.bits.11, incrementedInput.11)
        XCTAssertEqual(result4.bits.12, incrementedInput.12)
        XCTAssertEqual(result4.bits.13, incrementedInput.13)
        XCTAssertEqual(result4.bits.14, incrementedInput.14)
        XCTAssertEqual(result4.bits.15, incrementedInput.15)
        
        let _ = pc.out(in: .allLow, inc: .high, load: .low, reset: .high)
        let result5 = pc.out(in: .allLow, inc: .low, load: .low, reset: .low)

        XCTAssertEqual(result5.bits.0, .low, "[Should Not reset]: \(result5)")
        XCTAssertEqual(result5.bits.1, .low)
        XCTAssertEqual(result5.bits.2, .low)
        XCTAssertEqual(result5.bits.3, .low)
        XCTAssertEqual(result5.bits.4, .low)
        XCTAssertEqual(result5.bits.5, .low)
        XCTAssertEqual(result5.bits.6, .low)
        XCTAssertEqual(result5.bits.7, .low)
        XCTAssertEqual(result5.bits.8, .low)
        XCTAssertEqual(result5.bits.9, .low)
        XCTAssertEqual(result5.bits.10, .low)
        XCTAssertEqual(result5.bits.11, .low)
        XCTAssertEqual(result5.bits.12, .low)
        XCTAssertEqual(result5.bits.13, .low)
        XCTAssertEqual(result5.bits.14, .low)
        XCTAssertEqual(result5.bits.15, .low)
    }

    var allTests = [
        ("testPC", testPC)
    ]
}
