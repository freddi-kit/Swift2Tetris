//
//  BitN.swift
//  
//
//  Created by 秋勇紀 on 2020/05/05.
//

import Foundation

// TODO: make as template
struct Bit15: BitCalculatable {
    
    static let allLow: Bit15 = Bit15(bits: (.low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low))
    static let allHigh: Bit15 = Bit15(bits: (.high, .high, .high, .high, .high, .high, .high, .high, .high, .high, .high, .high, .high, .high, .high))
    
    var bits: (Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit)
    
    static func nand(x: Bit15, y: Bit15) -> Bit15 {
        Bit15(bits:(
            Bit.nand(x: x.bits.0, y: y.bits.0),
            Bit.nand(x: x.bits.1, y: y.bits.1),
            Bit.nand(x: x.bits.2, y: y.bits.2),
            Bit.nand(x: x.bits.3, y: y.bits.3),
            Bit.nand(x: x.bits.4, y: y.bits.4),
            Bit.nand(x: x.bits.5, y: y.bits.5),
            Bit.nand(x: x.bits.6, y: y.bits.6),
            Bit.nand(x: x.bits.7, y: y.bits.7),
            Bit.nand(x: x.bits.8, y: y.bits.8),
            Bit.nand(x: x.bits.9, y: y.bits.9),
            Bit.nand(x: x.bits.10, y: y.bits.10),
            Bit.nand(x: x.bits.11, y: y.bits.11),
            Bit.nand(x: x.bits.12, y: y.bits.12),
            Bit.nand(x: x.bits.13, y: y.bits.13),
            Bit.nand(x: x.bits.14, y: y.bits.14)
            )
        )
    }
    
    static func or(x: Bit15, y: Bit15) -> Bit15 {
        Bit15(bits:(
            Bit.or(x: x.bits.0, y: y.bits.0),
            Bit.or(x: x.bits.1, y: y.bits.1),
            Bit.or(x: x.bits.2, y: y.bits.2),
            Bit.or(x: x.bits.3, y: y.bits.3),
            Bit.or(x: x.bits.4, y: y.bits.4),
            Bit.or(x: x.bits.5, y: y.bits.5),
            Bit.or(x: x.bits.6, y: y.bits.6),
            Bit.or(x: x.bits.7, y: y.bits.7),
            Bit.or(x: x.bits.8, y: y.bits.8),
            Bit.or(x: x.bits.9, y: y.bits.9),
            Bit.or(x: x.bits.10, y: y.bits.10),
            Bit.or(x: x.bits.11, y: y.bits.11),
            Bit.or(x: x.bits.12, y: y.bits.12),
            Bit.or(x: x.bits.13, y: y.bits.13),
            Bit.or(x: x.bits.14, y: y.bits.14)
            )
        )
    }
    
    static func and(x: Bit15, y: Bit15) -> Bit15 {
        Bit15(bits:(
            Bit.and(x: x.bits.0, y: y.bits.0),
            Bit.and(x: x.bits.1, y: y.bits.1),
            Bit.and(x: x.bits.2, y: y.bits.2),
            Bit.and(x: x.bits.3, y: y.bits.3),
            Bit.and(x: x.bits.4, y: y.bits.4),
            Bit.and(x: x.bits.5, y: y.bits.5),
            Bit.and(x: x.bits.6, y: y.bits.6),
            Bit.and(x: x.bits.7, y: y.bits.7),
            Bit.and(x: x.bits.8, y: y.bits.8),
            Bit.and(x: x.bits.9, y: y.bits.9),
            Bit.and(x: x.bits.10, y: y.bits.10),
            Bit.and(x: x.bits.11, y: y.bits.11),
            Bit.and(x: x.bits.12, y: y.bits.12),
            Bit.and(x: x.bits.13, y: y.bits.13),
            Bit.and(x: x.bits.14, y: y.bits.14)
            )
        )
    }
    
    static func not(x: Bit15) -> Bit15 {
        Bit15(bits:(
            Bit.not(x: x.bits.0),
            Bit.not(x: x.bits.1),
            Bit.not(x: x.bits.2),
            Bit.not(x: x.bits.3),
            Bit.not(x: x.bits.4),
            Bit.not(x: x.bits.5),
            Bit.not(x: x.bits.6),
            Bit.not(x: x.bits.7),
            Bit.not(x: x.bits.8),
            Bit.not(x: x.bits.9),
            Bit.not(x: x.bits.10),
            Bit.not(x: x.bits.11),
            Bit.not(x: x.bits.12),
            Bit.not(x: x.bits.13),
            Bit.not(x: x.bits.14)
            )
        )
    }
    
    static func xor(x: Bit15, y: Bit15) -> Bit15 {
        Bit15(bits:(
            Bit.xor(x: x.bits.0, y: y.bits.0),
            Bit.xor(x: x.bits.1, y: y.bits.1),
            Bit.xor(x: x.bits.2, y: y.bits.2),
            Bit.xor(x: x.bits.3, y: y.bits.3),
            Bit.xor(x: x.bits.4, y: y.bits.4),
            Bit.xor(x: x.bits.5, y: y.bits.5),
            Bit.xor(x: x.bits.6, y: y.bits.6),
            Bit.xor(x: x.bits.7, y: y.bits.7),
            Bit.xor(x: x.bits.8, y: y.bits.8),
            Bit.xor(x: x.bits.9, y: y.bits.9),
            Bit.xor(x: x.bits.10, y: y.bits.10),
            Bit.xor(x: x.bits.11, y: y.bits.11),
            Bit.xor(x: x.bits.12, y: y.bits.12),
            Bit.xor(x: x.bits.13, y: y.bits.13),
            Bit.xor(x: x.bits.14, y: y.bits.14)
            )
        )
    }
    
    static func incrementor(x: Bit15) -> Bit15 {
         Adder.Add15(a: x,
                     b: Bit15(bits: (
                         .low,
                         .low,
                         .low,
                         .low,
                         .low,
                         .low,
                         .low,
                         .low,
                         .low,
                         .low,
                         .low,
                         .low,
                         .low,
                         .low,
                         .high)))
    }
    
    
    // Can be used only test
    static func == (lhs: Bit15, rhs: Bit15) -> Bool {
        lhs.bits.0 == rhs.bits.0
            && lhs.bits.1 == rhs.bits.1
            && lhs.bits.2 == rhs.bits.2
            && lhs.bits.3 == rhs.bits.3
            && lhs.bits.4 == rhs.bits.4
            && lhs.bits.5 == rhs.bits.5
            && lhs.bits.6 == rhs.bits.6
            && lhs.bits.7 == rhs.bits.7
            && lhs.bits.8 == rhs.bits.8
            && lhs.bits.9 == rhs.bits.9
            && lhs.bits.10 == rhs.bits.10
            && lhs.bits.11 == rhs.bits.11
            && lhs.bits.12 == rhs.bits.12
            && lhs.bits.13 == rhs.bits.13
            && lhs.bits.14 == rhs.bits.14
    }
}


public struct Bit16: BitCalculatable {
    
    public static let allLow: Bit16 = Bit16(bits: (.low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low, .low))
    public static let allHigh: Bit16 = Bit16(bits: (.high, .high, .high, .high, .high, .high, .high, .high, .high, .high, .high, .high, .high, .high, .high, .high))
    
    public var bits: (Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit)
    
    public static func nand(x: Bit16, y: Bit16) -> Bit16 {
        Bit16(bits:(
            Bit.nand(x: x.bits.0, y: y.bits.0),
            Bit.nand(x: x.bits.1, y: y.bits.1),
            Bit.nand(x: x.bits.2, y: y.bits.2),
            Bit.nand(x: x.bits.3, y: y.bits.3),
            Bit.nand(x: x.bits.4, y: y.bits.4),
            Bit.nand(x: x.bits.5, y: y.bits.5),
            Bit.nand(x: x.bits.6, y: y.bits.6),
            Bit.nand(x: x.bits.7, y: y.bits.7),
            Bit.nand(x: x.bits.8, y: y.bits.8),
            Bit.nand(x: x.bits.9, y: y.bits.9),
            Bit.nand(x: x.bits.10, y: y.bits.10),
            Bit.nand(x: x.bits.11, y: y.bits.11),
            Bit.nand(x: x.bits.12, y: y.bits.12),
            Bit.nand(x: x.bits.13, y: y.bits.13),
            Bit.nand(x: x.bits.14, y: y.bits.14),
            Bit.nand(x: x.bits.15, y: y.bits.15)
            )
        )
    }
    
    public static func or(x: Bit16, y: Bit16) -> Bit16 {
        Bit16(bits:(
            Bit.or(x: x.bits.0, y: y.bits.0),
            Bit.or(x: x.bits.1, y: y.bits.1),
            Bit.or(x: x.bits.2, y: y.bits.2),
            Bit.or(x: x.bits.3, y: y.bits.3),
            Bit.or(x: x.bits.4, y: y.bits.4),
            Bit.or(x: x.bits.5, y: y.bits.5),
            Bit.or(x: x.bits.6, y: y.bits.6),
            Bit.or(x: x.bits.7, y: y.bits.7),
            Bit.or(x: x.bits.8, y: y.bits.8),
            Bit.or(x: x.bits.9, y: y.bits.9),
            Bit.or(x: x.bits.10, y: y.bits.10),
            Bit.or(x: x.bits.11, y: y.bits.11),
            Bit.or(x: x.bits.12, y: y.bits.12),
            Bit.or(x: x.bits.13, y: y.bits.13),
            Bit.or(x: x.bits.14, y: y.bits.14),
            Bit.or(x: x.bits.15, y: y.bits.15)
            )
        )
    }
    
    public static func and(x: Bit16, y: Bit16) -> Bit16 {
        Bit16(bits:(
            Bit.and(x: x.bits.0, y: y.bits.0),
            Bit.and(x: x.bits.1, y: y.bits.1),
            Bit.and(x: x.bits.2, y: y.bits.2),
            Bit.and(x: x.bits.3, y: y.bits.3),
            Bit.and(x: x.bits.4, y: y.bits.4),
            Bit.and(x: x.bits.5, y: y.bits.5),
            Bit.and(x: x.bits.6, y: y.bits.6),
            Bit.and(x: x.bits.7, y: y.bits.7),
            Bit.and(x: x.bits.8, y: y.bits.8),
            Bit.and(x: x.bits.9, y: y.bits.9),
            Bit.and(x: x.bits.10, y: y.bits.10),
            Bit.and(x: x.bits.11, y: y.bits.11),
            Bit.and(x: x.bits.12, y: y.bits.12),
            Bit.and(x: x.bits.13, y: y.bits.13),
            Bit.and(x: x.bits.14, y: y.bits.14),
            Bit.and(x: x.bits.15, y: y.bits.15)
            )
        )
    }
    
    public static func not(x: Bit16) -> Bit16 {
        Bit16(bits:(
            Bit.not(x: x.bits.0),
            Bit.not(x: x.bits.1),
            Bit.not(x: x.bits.2),
            Bit.not(x: x.bits.3),
            Bit.not(x: x.bits.4),
            Bit.not(x: x.bits.5),
            Bit.not(x: x.bits.6),
            Bit.not(x: x.bits.7),
            Bit.not(x: x.bits.8),
            Bit.not(x: x.bits.9),
            Bit.not(x: x.bits.10),
            Bit.not(x: x.bits.11),
            Bit.not(x: x.bits.12),
            Bit.not(x: x.bits.13),
            Bit.not(x: x.bits.14),
            Bit.not(x: x.bits.15)
            )
        )
    }
    
    public static func xor(x: Bit16, y: Bit16) -> Bit16 {
        Bit16(bits:(
            Bit.xor(x: x.bits.0, y: y.bits.0),
            Bit.xor(x: x.bits.1, y: y.bits.1),
            Bit.xor(x: x.bits.2, y: y.bits.2),
            Bit.xor(x: x.bits.3, y: y.bits.3),
            Bit.xor(x: x.bits.4, y: y.bits.4),
            Bit.xor(x: x.bits.5, y: y.bits.5),
            Bit.xor(x: x.bits.6, y: y.bits.6),
            Bit.xor(x: x.bits.7, y: y.bits.7),
            Bit.xor(x: x.bits.8, y: y.bits.8),
            Bit.xor(x: x.bits.9, y: y.bits.9),
            Bit.xor(x: x.bits.10, y: y.bits.10),
            Bit.xor(x: x.bits.11, y: y.bits.11),
            Bit.xor(x: x.bits.12, y: y.bits.12),
            Bit.xor(x: x.bits.13, y: y.bits.13),
            Bit.xor(x: x.bits.14, y: y.bits.14),
            Bit.xor(x: x.bits.15, y: y.bits.15)
            )
        )
    }
    
    public static func incrementor(x: Bit16) -> Bit16 {
         Adder.Add16(a: x,
                     b: Bit16(bits: (
                         .low,
                         .low,
                         .low,
                         .low,
                         .low,
                         .low,
                         .low,
                         .low,
                         .low,
                         .low,
                         .low,
                         .low,
                         .low,
                         .low,
                         .low,
                         .high)))
    }
    
    
    // Can be used only test
    public static func == (lhs: Bit16, rhs: Bit16) -> Bool {
        lhs.bits.0 == rhs.bits.0
            && lhs.bits.1 == rhs.bits.1
            && lhs.bits.2 == rhs.bits.2
            && lhs.bits.3 == rhs.bits.3
            && lhs.bits.4 == rhs.bits.4
            && lhs.bits.5 == rhs.bits.5
            && lhs.bits.6 == rhs.bits.6
            && lhs.bits.7 == rhs.bits.7
            && lhs.bits.8 == rhs.bits.8
            && lhs.bits.9 == rhs.bits.9
            && lhs.bits.10 == rhs.bits.10
            && lhs.bits.11 == rhs.bits.11
            && lhs.bits.12 == rhs.bits.12
            && lhs.bits.13 == rhs.bits.13
            && lhs.bits.14 == rhs.bits.14
            && lhs.bits.15 == rhs.bits.15
    }
}
