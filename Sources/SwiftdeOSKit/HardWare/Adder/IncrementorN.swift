//
//  IncrementorN.swift
//  
//
//  Created by 秋勇紀 on 2020/05/05.
//

import Foundation

// TODO: make as template
enum Incrementor {
    static func incrementor64(x: Bit16) -> Bit16 {
        Adder.Add16(a: x,
                    b: Bit16(bits: (
                        .high,
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
                        .low)))
    }
}
