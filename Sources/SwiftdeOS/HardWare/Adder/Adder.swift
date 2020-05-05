//
//  File.swift
//  
//
//  Created by 秋勇紀 on 2020/05/05.
//

import Foundation

enum Adder {
    static func halfAdder(a: Bit, b: Bit) -> (sum: Bit, carry: Bit) {
        (sum: .xor(x: a, y: b), carry: .and(x: a, y: b))
    }
    
    static func fullAdder(a: Bit, b: Bit, c: Bit) -> (sum: Bit, carry: Bit) {
        let ab = halfAdder(a: a, b: b)
        let abc = halfAdder(a: ab.sum, b: c)
        return (abc.sum, .or(x: ab.carry, y: abc.carry))
    }
}
