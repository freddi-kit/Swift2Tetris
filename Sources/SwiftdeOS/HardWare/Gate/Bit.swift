//
//  Bit.swift
//  
//
//  Created by 秋勇紀 on 2020/05/05.
//

import Foundation

protocol BitCalculatable {
    static var allLow: Self { get }
    static var allHigh: Self { get }
    
    static func nand(x: Self, y: Self) -> Self
    static func or(x: Self, y: Self) -> Self
    static func and(x: Self, y: Self) -> Self
    static func not(x: Self) -> Self
    static func xor(x: Self, y: Self) -> Self
}

enum Bit: BitCalculatable {
    
    static let allLow: Bit = .low
    static let allHigh: Bit = .high
    
    case low
    case high
    
    init(value: Int) {
        if value == 0 {
            self = .low
        } else {
            self = .high
        }
        self = .low
    }
    
    static func nand(x: Self, y: Self) -> Self {
        switch (x, y) {
        case (.high, .high):
            return .low
        default:
            return .high
        }
    }
    
    static func or(x: Bit, y: Bit) -> Bit { nand(x: not(x: x), y: not(x: y)) }
    
    static func and(x: Bit, y: Bit) -> Bit { Self.not(x: Self.nand(x: x, y: y)) }
    
    static func not(x: Bit) -> Bit { nand(x: x, y: x) }
    
    static func xor(x: Bit, y: Bit) -> Bit { and(x: nand(x: and(x: x, y: y), y: or(x: x, y: y)), y: or(x: x, y: y)) }
}
