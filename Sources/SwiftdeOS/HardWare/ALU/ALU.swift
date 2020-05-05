//
//  ALU.swift
//  
//
//  Created by 秋勇紀 on 2020/05/05.
//

import Foundation

enum ALU {
    // TODO: implement zr and ng
    func alu(x: Bit16, y: Bit16, zx: Bit, nx: Bit, zy: Bit, ny: Bit, f: Bit, no: Bit) -> Bit16 {
        
        var x = Plexor.multiPlexor(a: x, b: .allLow, sel: zx)
        x = Plexor.multiPlexor(a: x, b: .not(x: x), sel: nx)
        
        var y = Plexor.multiPlexor(a: y, b: .allLow, sel: zy)
        y = Plexor.multiPlexor(a: y, b: .not(x: y), sel: ny)
        
        var out = Plexor.multiPlexor(a: Adder.Add16(a: x, b: y), b: .and(x: x, y: y), sel: f)
        out = Plexor.multiPlexor(a: out, b: .not(x: out), sel: no)
        
        return out
    }
}
