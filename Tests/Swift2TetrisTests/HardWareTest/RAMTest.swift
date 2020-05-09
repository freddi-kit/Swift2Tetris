//
//  RAMTest.swift
//  Swift2TetrisTests
//
//  Created by 秋勇紀 on 2020/05/08.
//

import XCTest
@testable import Swift2TetrisKit

class RAMTest: XCTestCase {
    
    private let random = { () -> Bit in
        if Int.random(in: 0...1) == 1 {
            return .low
        }
        
        return .high
    }

    func testDFF() throws {
        var dff = DFF<Bit>()
        XCTAssertEqual(dff.out(in: .high), .low)
        XCTAssertEqual(dff.out(in: .low), .high)
        XCTAssertEqual(dff.out(in: .high), .low)
        XCTAssertEqual(dff.out(in: .high), .high)
        XCTAssertEqual(dff.out(in: .low), .high)
    }
    
    func testRegister() throws {
        var dff = Register<Bit>()
        XCTAssertEqual(dff.out(in: .low, load: .low), .low)
        XCTAssertEqual(dff.out(in: .high, load: .high), .low)
        XCTAssertEqual(dff.out(in: .low, load: .high), .high)
        XCTAssertEqual(dff.out(in: .low, load: .high), .low)
        XCTAssertEqual(dff.out(in: .low, load: .low), .low)
    }
    
    func testRAM64() throws {
        let addAddressList = [
            (Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low),
            (Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.high),
            (Bit.low, Bit.low, Bit.low, Bit.low, Bit.high, Bit.low),
            (Bit.low, Bit.low, Bit.low, Bit.low, Bit.high, Bit.high),
            (Bit.low, Bit.low, Bit.low, Bit.high, Bit.low, Bit.low),
            (Bit.low, Bit.low, Bit.low, Bit.high, Bit.low, Bit.high),
            (Bit.low, Bit.low, Bit.low, Bit.high, Bit.high, Bit.low),
            (Bit.low, Bit.low, Bit.low, Bit.high, Bit.high, Bit.high),
            (Bit.low, Bit.low, Bit.high, Bit.low, Bit.low, Bit.low),
            (Bit.low, Bit.low, Bit.high, Bit.low, Bit.low, Bit.high),
            (Bit.low, Bit.low, Bit.high, Bit.low, Bit.high, Bit.low),
            (Bit.low, Bit.low, Bit.high, Bit.low, Bit.high, Bit.high),
            (Bit.low, Bit.low, Bit.high, Bit.high, Bit.low, Bit.low),
            (Bit.low, Bit.low, Bit.high, Bit.high, Bit.low, Bit.high),
            (Bit.low, Bit.low, Bit.high, Bit.high, Bit.high, Bit.low),
            (Bit.low, Bit.low, Bit.high, Bit.high, Bit.high, Bit.high),
            (Bit.low, Bit.high, Bit.low, Bit.low, Bit.low, Bit.low),
            (Bit.low, Bit.high, Bit.low, Bit.low, Bit.low, Bit.high),
            (Bit.low, Bit.high, Bit.low, Bit.low, Bit.high, Bit.low),
            (Bit.low, Bit.high, Bit.low, Bit.low, Bit.high, Bit.high),
            (Bit.low, Bit.high, Bit.low, Bit.high, Bit.low, Bit.low),
            (Bit.low, Bit.high, Bit.low, Bit.high, Bit.low, Bit.high),
            (Bit.low, Bit.high, Bit.low, Bit.high, Bit.high, Bit.low),
            (Bit.low, Bit.high, Bit.low, Bit.high, Bit.high, Bit.high),
            (Bit.low, Bit.high, Bit.high, Bit.low, Bit.low, Bit.low),
            (Bit.low, Bit.high, Bit.high, Bit.low, Bit.low, Bit.high),
            (Bit.low, Bit.high, Bit.high, Bit.low, Bit.high, Bit.low),
            (Bit.low, Bit.high, Bit.high, Bit.low, Bit.high, Bit.high),
            (Bit.low, Bit.high, Bit.high, Bit.high, Bit.low, Bit.low),
            (Bit.low, Bit.high, Bit.high, Bit.high, Bit.low, Bit.high),
            (Bit.low, Bit.high, Bit.high, Bit.high, Bit.high, Bit.low),
            (Bit.low, Bit.high, Bit.high, Bit.high, Bit.high, Bit.high),
            (Bit.high, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low),
            (Bit.high, Bit.low, Bit.low, Bit.low, Bit.low, Bit.high),
            (Bit.high, Bit.low, Bit.low, Bit.low, Bit.high, Bit.low),
            (Bit.high, Bit.low, Bit.low, Bit.low, Bit.high, Bit.high),
            (Bit.high, Bit.low, Bit.low, Bit.high, Bit.low, Bit.low),
            (Bit.high, Bit.low, Bit.low, Bit.high, Bit.low, Bit.high),
            (Bit.high, Bit.low, Bit.low, Bit.high, Bit.high, Bit.low),
            (Bit.high, Bit.low, Bit.low, Bit.high, Bit.high, Bit.high),
            (Bit.high, Bit.low, Bit.high, Bit.low, Bit.low, Bit.low),
            (Bit.high, Bit.low, Bit.high, Bit.low, Bit.low, Bit.high),
            (Bit.high, Bit.low, Bit.high, Bit.low, Bit.high, Bit.low),
            (Bit.high, Bit.low, Bit.high, Bit.low, Bit.high, Bit.high),
            (Bit.high, Bit.low, Bit.high, Bit.high, Bit.low, Bit.low),
            (Bit.high, Bit.low, Bit.high, Bit.high, Bit.low, Bit.high),
            (Bit.high, Bit.low, Bit.high, Bit.high, Bit.high, Bit.low),
            (Bit.high, Bit.low, Bit.high, Bit.high, Bit.high, Bit.high),
            (Bit.high, Bit.high, Bit.low, Bit.low, Bit.low, Bit.low),
            (Bit.high, Bit.high, Bit.low, Bit.low, Bit.low, Bit.high),
            (Bit.high, Bit.high, Bit.low, Bit.low, Bit.high, Bit.low),
            (Bit.high, Bit.high, Bit.low, Bit.low, Bit.high, Bit.high),
            (Bit.high, Bit.high, Bit.low, Bit.high, Bit.low, Bit.low),
            (Bit.high, Bit.high, Bit.low, Bit.high, Bit.low, Bit.high),
            (Bit.high, Bit.high, Bit.low, Bit.high, Bit.high, Bit.low),
            (Bit.high, Bit.high, Bit.low, Bit.high, Bit.high, Bit.high),
            (Bit.high, Bit.high, Bit.high, Bit.low, Bit.low, Bit.low),
            (Bit.high, Bit.high, Bit.high, Bit.low, Bit.low, Bit.high),
            (Bit.high, Bit.high, Bit.high, Bit.low, Bit.high, Bit.low),
            (Bit.high, Bit.high, Bit.high, Bit.low, Bit.high, Bit.high),
            (Bit.high, Bit.high, Bit.high, Bit.high, Bit.low, Bit.low),
            (Bit.high, Bit.high, Bit.high, Bit.high, Bit.low, Bit.high),
            (Bit.high, Bit.high, Bit.high, Bit.high, Bit.high, Bit.low),
            (Bit.high, Bit.high, Bit.high, Bit.high, Bit.high, Bit.high),
        ]
        
        for writeAddress in addAddressList {
            let ram8 = RAM64()
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
            
            let result = ram8.out(in: Bit16(bits: input), load: .high, address: writeAddress)

            XCTAssertEqual(result, .allLow, "[Not written] writeAddress is: \(writeAddress)")

            let result2 = ram8.out(in: .allHigh, load: .low, address: writeAddress)
            
            XCTAssertEqual(result2, Bit16(bits: input), "writeAddress is: \(writeAddress)")
            
            var excludedAddressList = addAddressList
            excludedAddressList.remove(at: excludedAddressList.firstIndex { (value) -> Bool in
                value == writeAddress
            }!)
            
            for readAddress in excludedAddressList {
                let result = ram8.out(in: .allHigh, load: .low, address: readAddress)
                
                XCTAssertEqual(result, .allLow, "\nwriteAddress is: \(writeAddress), \nreadAddress is: \(readAddress)\nAlso, \n\nwrite()\(writeAddress) is :\n\(ram8.out(in: .allHigh, load: .low, address: writeAddress))\n\nread()\(readAddress) is :\n\(ram8.out(in: .allHigh, load: .low, address: writeAddress))")
            }
        }
    }

    var allTests = [
        ("testDFF", testDFF),
        ("testRegister", testRegister),
        ("testRAM64", testRAM64),
    ]
}
