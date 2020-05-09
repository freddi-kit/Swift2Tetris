//
//  PlexorTest.swift
//  SwiftdeOSTests
//
//  Created by 秋勇紀 on 2020/05/08.
//

import XCTest
@testable import SwiftdeOSKit

class PlexorTest: XCTestCase {

    func testMultiPlexor() throws {
        XCTAssertEqual(Plexor.multiPlexor(a: Bit.low, b: Bit.low, sel: .low), .low)
        XCTAssertEqual(Plexor.multiPlexor(a: Bit.low, b: Bit.high, sel: .low), .low)
        XCTAssertEqual(Plexor.multiPlexor(a: Bit.high, b: Bit.low, sel: .low), .high)
        XCTAssertEqual(Plexor.multiPlexor(a: Bit.high, b: Bit.high, sel: .low), .high)
        XCTAssertEqual(Plexor.multiPlexor(a: Bit.low, b: Bit.low, sel: .high), .low)
        XCTAssertEqual(Plexor.multiPlexor(a: Bit.low, b: Bit.high, sel: .high), .high)
        XCTAssertEqual(Plexor.multiPlexor(a: Bit.high, b: Bit.low, sel: .high), .low)
        XCTAssertEqual(Plexor.multiPlexor(a: Bit.high, b: Bit.high, sel: .high), .high)
    }
    
    func testMultiPlexor4Way() throws {
        
        let testBitResultBit = [

            
            ((Bit.high, Bit.high, Bit.high, Bit.high, Bit.low, Bit.low), (Bit.high)),
            ((Bit.high, Bit.high, Bit.high, Bit.high, Bit.low, Bit.high), (Bit.high)),
            ((Bit.high, Bit.high, Bit.high, Bit.high, Bit.high, Bit.low), (Bit.high)),
            ((Bit.high, Bit.high, Bit.high, Bit.high, Bit.high, Bit.high), (Bit.high)),
        ]
        
        for (input, expectResult) in testBitResultBit {
            let result = Plexor.multiPlexor4way(a: input.0, b: input.1, c: input.2, d: input.3, sel1: input.4, sel0: input.5)
            XCTAssertTrue(
                (result.0 == expectResult.0) && (result.1 == expectResult.1) && (result.2 == expectResult.2) && (result.3 == expectResult.3)
            , """
            Input        : \(input)
            Expect Result: \(expectResult)
            Actual Result: \(result)
            """)
        }
        
    }
    
    
    func testDeMultiPlexor() throws {
        let lowlow1 = Plexor.deMultiPlexor(in: Bit.low, sel: Bit.low)
        XCTAssertEqual(lowlow1.a, .low)
        XCTAssertEqual(lowlow1.b, .low)

        let lowlow2 = Plexor.deMultiPlexor(in: Bit.low, sel: Bit.high)
        XCTAssertEqual(lowlow2.a, .low)
        XCTAssertEqual(lowlow2.b, .low)
        
        let highlow = Plexor.deMultiPlexor(in: Bit.high, sel: Bit.low)
        XCTAssertEqual(highlow.a, .high)
        XCTAssertEqual(highlow.b, .low)
        
        let lowhigh = Plexor.deMultiPlexor(in: Bit.high, sel: Bit.high)
        XCTAssertEqual(lowhigh.a, .low)
        XCTAssertEqual(lowhigh.b, .high)
    }
    
    func testDeMultiPlexor4way() throws {

        let testBitResultBit = [
            ((Bit.low, Bit.low, Bit.low), (Bit.low, Bit.low, Bit.low, Bit.low)),
            ((Bit.low, Bit.low, Bit.high), (Bit.low, Bit.low, Bit.low, Bit.low)),
            ((Bit.low, Bit.high, Bit.low), (Bit.low, Bit.low, Bit.low, Bit.low)),
            ((Bit.low, Bit.high, Bit.high), (Bit.low, Bit.low, Bit.low, Bit.low)),
            ((Bit.high, Bit.low, Bit.low), (Bit.high, Bit.low, Bit.low, Bit.low)),
            ((Bit.high, Bit.low, Bit.high), (Bit.low, Bit.high, Bit.low, Bit.low)),
            ((Bit.high, Bit.high, Bit.low), (Bit.low, Bit.low, Bit.high, Bit.low)),
            ((Bit.high, Bit.high, Bit.high), (Bit.low, Bit.low, Bit.low, Bit.high)),
        ]

        for (input, expectResult) in testBitResultBit {
            let result = Plexor.deMultiPlexor4way(in: input.0, sel1: input.1, sel0: input.2)
            XCTAssertTrue(
                (result.0 == expectResult.0) && (result.1 == expectResult.1) && (result.2 == expectResult.2) && (result.3 == expectResult.3)
            , """
            Input        : \(input)
            Expect Result: \(expectResult)
            Actual Result: \(result)
            """)
        }
    }
    
    func testDeMultiPlexor8way() throws {

        let testBitResultBit = [
            ((Bit.low, Bit.low, Bit.low, Bit.low), (Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low)),
            ((Bit.low, Bit.low, Bit.low, Bit.high), (Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low)),
            ((Bit.low, Bit.low, Bit.high, Bit.low), (Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low)),
            ((Bit.low, Bit.low, Bit.high, Bit.high), (Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low)),
            ((Bit.low, Bit.high, Bit.low, Bit.low), (Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low)),
            ((Bit.low, Bit.high, Bit.low, Bit.high), (Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low)),
            ((Bit.low, Bit.high, Bit.high, Bit.low), (Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low)),
            ((Bit.low, Bit.high, Bit.high, Bit.high), (Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low)),
            ((Bit.high, Bit.low, Bit.low, Bit.low), (Bit.high, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low)),
            ((Bit.high, Bit.low, Bit.low, Bit.high), (Bit.low, Bit.high, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low)),
            ((Bit.high, Bit.low, Bit.high, Bit.low), (Bit.low, Bit.low, Bit.high, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low)),
            ((Bit.high, Bit.low, Bit.high, Bit.high), (Bit.low, Bit.low, Bit.low, Bit.high, Bit.low, Bit.low, Bit.low, Bit.low)),
            ((Bit.high, Bit.high, Bit.low, Bit.low), (Bit.low, Bit.low, Bit.low, Bit.low, Bit.high, Bit.low, Bit.low, Bit.low)),
            ((Bit.high, Bit.high, Bit.low, Bit.high), (Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.high, Bit.low, Bit.low)),
            ((Bit.high, Bit.high, Bit.high, Bit.low), (Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.high, Bit.low)),
            ((Bit.high, Bit.high, Bit.high, Bit.high), (Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.low, Bit.high)),
        ]

        for (input, expectResult) in testBitResultBit {
            let result = Plexor.deMultiPlexor8way(in: input.0, sel2: input.1, sel1: input.2, sel0: input.3)
            XCTAssertTrue(
                (result.0 == expectResult.0) && (result.1 == expectResult.1) && (result.2 == expectResult.2) && (result.3 == expectResult.3) && (result.4 == expectResult.4)
            , """
            Input        : \(input)
            Expect Result: \(expectResult)
            Actual Result: \(result)
            """)
        }
    }
    
    
    
    static var allTests = [
        ("testMultiPlexor", testMultiPlexor),
        ("testDeMultiPlexor", testDeMultiPlexor),
        ("testDeMultiPlexor4way", testDeMultiPlexor4way),
        ("testDeMultiPlexor4way", testDeMultiPlexor8way)
    ]
}
