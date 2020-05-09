//
//  AddN.swift
//  
//
//  Created by 秋勇紀 on 2020/05/05.
//

import Foundation

// TODO: make as template
extension Adder {
    
    static func Add16(a: Bit16, b: Bit16) -> Bit16 {
        let b15 = halfAdder(a: a.bits.15, b: b.bits.15)
        let b14 = fullAdder(a: a.bits.14, b: b.bits.14, c: b15.carry)
        let b13 = fullAdder(a: a.bits.13, b: b.bits.13, c: b14.carry)
        let b12 = fullAdder(a: a.bits.12, b: b.bits.12, c: b13.carry)
        let b11 = fullAdder(a: a.bits.11, b: b.bits.11, c: b12.carry)
        let b10 = fullAdder(a: a.bits.10, b: b.bits.10, c: b11.carry)
        let b9 = fullAdder(a: a.bits.9, b: b.bits.9, c: b10.carry)
        let b8 = fullAdder(a: a.bits.8, b: b.bits.8, c: b9.carry)
        let b7 = fullAdder(a: a.bits.7, b: b.bits.7, c: b8.carry)
        let b6 = fullAdder(a: a.bits.6, b: b.bits.6, c: b7.carry)
        let b5 = fullAdder(a: a.bits.5, b: b.bits.5, c: b6.carry)
        let b4 = fullAdder(a: a.bits.4, b: b.bits.4, c: b5.carry)
        let b3 = fullAdder(a: a.bits.3, b: b.bits.3, c: b4.carry)
        let b2 = fullAdder(a: a.bits.2, b: b.bits.2, c: b3.carry)
        let b1 = fullAdder(a: a.bits.1, b: b.bits.1, c: b2.carry)
        let b0 = fullAdder(a: a.bits.0, b: b.bits.0, c: b1.carry)
        return Bit16(bits: (
            b0.sum,
            b1.sum,
            b2.sum,
            b3.sum,
            b4.sum,
            b5.sum,
            b6.sum,
            b7.sum,
            b8.sum,
            b9.sum,
            b10.sum,
            b11.sum,
            b12.sum,
            b13.sum,
            b14.sum,
            b15.sum
        ))
    }
}
