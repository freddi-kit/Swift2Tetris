//
//  MultiPlexor.swift
//  
//
//  Created by 秋勇紀 on 2020/05/05.
//

import Foundation

extension Plexor {
    static func multiPlexor<X: BitCalculatable>(a: X, b: X, sel: Bit) -> X {
        let selNBit: X
        
        switch sel {
        case .low:
            selNBit = .allLow
        case .high:
            selNBit = .allHigh
        }
        
        return X.or(x:
            X.and(x: a, y: X.and(x: X.not(x: b), y: X.not(x: selNBit))), y:
            X.or(x:
                X.and(x: a, y: X.and(x: b, y: X.not(x: selNBit))), y:
                X.or(x:
                    X.and(x: X.not(x: a), y: X.and(x: b, y: selNBit)), y:
                    X.and(x: a, y: X.and(x: b, y: selNBit)))))
    }
    
    // 0 0 a
    // 0 1 b
    // 1 0 c
    // 1 1 d
    static func multiPlexor4way<X: BitCalculatable>(a: X, b: X, c: X, d: X, sel1: Bit, sel0: Bit) -> X {
        multiPlexor(a: multiPlexor(a: a, b: b, sel: sel0), b: multiPlexor(a: c, b: d, sel: sel0), sel: sel1)
    }

    // 0 0 0 a
    // 0 0 1 b
    // 0 1 0 c
    // 0 1 1 d
    // 1 0 0 e
    // 1 0 1 f
    // 1 1 0 g
    // 1 1 1 h
    static func multiPlexor8way<X: BitCalculatable>(a: X, b: X, c: X, d: X, e: X, f: X, g: X, h: X, sel2: Bit, sel1: Bit, sel0: Bit) -> X {
        multiPlexor(a: multiPlexor4way(a: a, b: b, c: c, d: d, sel1: sel1, sel0: sel0),
                    b: multiPlexor4way(a: e, b: f, c: c, d: d, sel1: sel1, sel0: sel0), sel: sel2)
    }
    
}
