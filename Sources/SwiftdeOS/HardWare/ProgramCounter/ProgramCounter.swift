//
//  ProgramCounter.swift
//  
//
//  Created by 秋勇紀 on 2020/05/06.
//

import Foundation

struct ProgramCounter {
    private var reg = Register<Bit16>()
    private var reset: Bit = .low
    
    // TODO: should fix it because calling reg.out twice
    mutating func out(in: Bit16, inc: Bit, load: Bit, reset: Bit) -> Bit16 {
        let out = Plexor.multiPlexor(a: `in`, b: Incrementor.incrementor64(x: reg.out(in: .allLow, load: .low)), sel: inc)
        return reg.out(in: Plexor.multiPlexor(a: out, b: .allLow, sel: reset), load: .or(x: inc, y: .or(x: reset, y: load)))
    }
}
