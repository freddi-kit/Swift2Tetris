//
//  CPUTest.swift
//  SwiftdeOSTests
//
//  Created by 秋勇紀 on 2020/05/10.
//

import XCTest
@testable import SwiftdeOSKit

class CPUTest: XCTestCase {

    
    func testCPU() throws {
        var cpu = CPU()
        _ = cpu.out(inst: .init(bits: (.low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .high)),
                          inM: .init(bits: (.low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low)), reset: .low)
        
        

    }
}