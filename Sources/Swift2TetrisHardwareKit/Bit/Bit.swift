//
//  Bit.swift
//  
//
//  Created by 秋勇紀 on 2020/05/05.
//

import Foundation

public protocol BitCalculatable where Self: Equatable {
    static var allLow: Self { get }
    static var allHigh: Self { get }
    
    static func nand(x: Self, y: Self) -> Self
    static func or(x: Self, y: Self) -> Self
    static func and(x: Self, y: Self) -> Self
    static func not(x: Self) -> Self
    static func xor(x: Self, y: Self) -> Self
    static func incrementor(x: Self) -> Self
}

public enum Bit: BitCalculatable {
    
    public static let allLow: Bit = .low
    public static let allHigh: Bit = .high
    
    case low
    case high
    
    public static func nand(x: Self, y: Self) -> Self {
        switch (x, y) {
        case (.high, .high):
            return .low
        default:
            return .high
        }
    }
    
    public static func or(x: Bit, y: Bit) -> Bit { nand(x: not(x: x), y: not(x: y)) }
    public static func and(x: Bit, y: Bit) -> Bit { Self.not(x: Self.nand(x: x, y: y)) }
    public static func not(x: Bit) -> Bit { nand(x: x, y: x) }
    public static func xor(x: Bit, y: Bit) -> Bit { and(x: nand(x: and(x: x, y: y), y: or(x: x, y: y)), y: or(x: x, y: y)) }
    public static func incrementor(x: Bit) -> Bit { xor(x: x, y: x) }
}
