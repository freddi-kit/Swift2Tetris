//
//  RAMTest.swift
//  SwiftdeOSTests
//
//  Created by 秋勇紀 on 2020/05/08.
//

import XCTest
@testable import SwiftdeOSKit

class RAMTest: XCTestCase {

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
    
    func testRAM8() throws {

        let addAddressList = [
            (Bit.low, Bit.low, Bit.low),
            (Bit.low, Bit.low, Bit.high),
            (Bit.low, Bit.high, Bit.low),
            (Bit.low, Bit.high, Bit.high),
            (Bit.high, Bit.low, Bit.low),
            (Bit.high, Bit.low, Bit.high),
            (Bit.high, Bit.high, Bit.low),
            (Bit.high, Bit.high, Bit.high)]
        
        for address in addAddressList {
            var ram8 = RAM8()
            let result = ram8.out(in: .allHigh, load: .high, address: address)

            XCTAssertEqual(result.bits.0, .low, "[Not written] Address1 is: \(address)")
            XCTAssertEqual(result.bits.1, .low)
            XCTAssertEqual(result.bits.2, .low)
            XCTAssertEqual(result.bits.3, .low)
            XCTAssertEqual(result.bits.4, .low)
            XCTAssertEqual(result.bits.5, .low)
            XCTAssertEqual(result.bits.6, .low)
            XCTAssertEqual(result.bits.7, .low)
            XCTAssertEqual(result.bits.8, .low)
            XCTAssertEqual(result.bits.9, .low)
            XCTAssertEqual(result.bits.10, .low)
            XCTAssertEqual(result.bits.11, .low)
            XCTAssertEqual(result.bits.12, .low)
            XCTAssertEqual(result.bits.13, .low)
            XCTAssertEqual(result.bits.14, .low)
            XCTAssertEqual(result.bits.15, .low)
                    
            let result2 = ram8.out(in: .allHigh, load: .low, address: address)
            
            XCTAssertEqual(result2.bits.0, .high, "Address1 is: \(address)")
            XCTAssertEqual(result2.bits.1, .high)
            XCTAssertEqual(result2.bits.2, .high)
            XCTAssertEqual(result2.bits.3, .high)
            XCTAssertEqual(result2.bits.4, .high)
            XCTAssertEqual(result2.bits.5, .high)
            XCTAssertEqual(result2.bits.6, .high)
            XCTAssertEqual(result2.bits.7, .high)
            XCTAssertEqual(result2.bits.8, .high)
            XCTAssertEqual(result2.bits.9, .high)
            XCTAssertEqual(result2.bits.10, .high)
            XCTAssertEqual(result2.bits.11, .high)
            XCTAssertEqual(result2.bits.12, .high)
            XCTAssertEqual(result2.bits.13, .high)
            XCTAssertEqual(result2.bits.14, .high)
            XCTAssertEqual(result2.bits.15, .high)
            
            
            var excludedAddressList = addAddressList
            excludedAddressList.remove(at: excludedAddressList.firstIndex { (value) -> Bool in
                value == address
            }!)
            
            for address2 in excludedAddressList {
                let result = ram8.out(in: .allHigh, load: .low, address: address2)
                
                XCTAssertEqual(result.bits.0, .low, "\nAddress1 is: \(address), \nAddress2 is: \(address2)")
                XCTAssertEqual(result.bits.1, .low)
                XCTAssertEqual(result.bits.2, .low)
                XCTAssertEqual(result.bits.3, .low)
                XCTAssertEqual(result.bits.4, .low)
                XCTAssertEqual(result.bits.5, .low)
                XCTAssertEqual(result.bits.6, .low)
                XCTAssertEqual(result.bits.7, .low)
                XCTAssertEqual(result.bits.8, .low)
                XCTAssertEqual(result.bits.9, .low)
                XCTAssertEqual(result.bits.10, .low)
                XCTAssertEqual(result.bits.11, .low)
                XCTAssertEqual(result.bits.12, .low)
                XCTAssertEqual(result.bits.13, .low)
                XCTAssertEqual(result.bits.14, .low)
                XCTAssertEqual(result.bits.15, .low)
            }
        }
    }
    
    func testRAM64() throws {
    }
    
    
}
