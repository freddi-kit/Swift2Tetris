//
//  GateTest.swift
//  
//
//  Created by 秋勇紀 on 2020/05/05.
//

import XCTest
// @testable import SwiftdeOS
    
final class GateTest: XCTestCase {
    func testNotGate() throws {
        //XCTAssertEqual(Not.in(x: false), true)
        //XCTAssertEqual(Not.in(x: true), false)
    }
    
    static var allTests = [
        ("testGate", testNotGate),
    ]
}
