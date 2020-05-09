//
//  ALU.swift
//  
//
//  Created by 秋勇紀 on 2020/05/05.
//

import Foundation

enum ALU {
    // TODO: implement zr and ng
    static func alu(x: Bit16, y: Bit16, zx: Bit, nx: Bit, zy: Bit, ny: Bit, f: Bit, no: Bit) -> (out: Bit16, zr: Bit, ng: Bit) {
        
        var x = Plexor.multiPlexor(a: x, b: .allLow, sel: zx)
        x = Plexor.multiPlexor(a: x, b: .not(x: x), sel: nx)
        
        var y = Plexor.multiPlexor(a: y, b: .allLow, sel: zy)
        y = Plexor.multiPlexor(a: y, b: .not(x: y), sel: ny)
        
        var out = Plexor.multiPlexor(a: .and(x: x, y: y), b: Adder.Add16(a: x, b: y), sel: f)
        out = Plexor.multiPlexor(a: out, b: .not(x: out), sel: no)
        
        return (out: out, zr: Bit.not(x:Bit.or(x: out.bits.0,
                                     y: Bit.or(x: out.bits.1,
                                               y: Bit.or(x: out.bits.2,
                                                         y: Bit.or(x: out.bits.3,
                                                                   y: Bit.or(x: out.bits.4,
                                                                             y: Bit.or(x: out.bits.5,
                                                                                       y: Bit.or(x: out.bits.6,
                                                                                                 y: Bit.or(x: out.bits.7,
                                                                                                           y: Bit.or(x: out.bits.8,
                                                                                                                     y: Bit.or(x: out.bits.9,
                                                                                                                               y: Bit.or(x: out.bits.10,
                                                                                                                                         y: Bit.or(x: out.bits.11,
                                                                                                                                                   y: Bit.or(x: out.bits.12,
                                                                                                                                                             y: Bit.or(x: out.bits.13,
                                                                                                                                                                       y: Bit.or(x: out.bits.14,
                                                                                                                                                                                 y: out.bits.15)))))))))))))))),
                ng: out.bits.0)
    }
}
