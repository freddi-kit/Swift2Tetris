//
//  DeMultiPlexor.swift
//  
//
//  Created by 秋勇紀 on 2020/05/05.
//

import Foundation

extension Plexor {

    static func deMultiPlexor(`in`: Bit, sel: Bit) -> (a: Bit, b: Bit) {
        (
            a: Bit.and(x: `in`, y: Bit.not(x: sel)),
            b: Bit.and(x: `in`, y: sel)
        )
    }
    
    // 0 0
    // 0 1
    // 1 0
    // 1 1
    static func deMultiPlexor4way(`in`: Bit, sel1: Bit, sel0: Bit) -> (a: Bit, b: Bit, c: Bit, d: Bit) {
        (
            a: Bit.and(x: Bit.and(x: Bit.not(x: sel1), y: Bit.not(x: sel0)), y: `in`),
            b: Bit.and(x: Bit.and(x: Bit.not(x: sel1), y: sel0), y: `in`),
            c: Bit.and(x: Bit.and(x: sel1, y: Bit.not(x: sel0)), y: `in`),
            d: Bit.and(x: Bit.and(x: sel1, y: sel0), y: `in`)
        )
    }
}
