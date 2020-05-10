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
    
    // 0 0 0 a
    // 0 0 1 b
    // 0 1 0 c
    // 0 1 1 d
    // 1 0 0 e
    // 1 0 1 f
    // 1 1 0 g
    // 1 1 1 h
    static func deMultiPlexor8way(`in`: Bit, sel2: Bit, sel1: Bit, sel0: Bit) -> (a: Bit, b: Bit, c: Bit, d: Bit, e: Bit, f: Bit, g: Bit, h: Bit) {
        let root0 = deMultiPlexor4way(in: `in`, sel1: sel1, sel0: sel0)
        return (
            a: Bit.and(x: .not(x: sel2), y: root0.a),
            b: Bit.and(x: .not(x: sel2), y: root0.b),
            c: Bit.and(x: .not(x: sel2), y: root0.c),
            d: Bit.and(x: .not(x: sel2), y: root0.d),
            e: Bit.and(x: sel2, y: root0.a),
            f: Bit.and(x: sel2, y: root0.b),
            g: Bit.and(x: sel2, y: root0.c),
            h: Bit.and(x: sel2, y: root0.d)
        )
    }
}
