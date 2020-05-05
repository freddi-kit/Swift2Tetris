//
//  FlipFlop.swift
//  
//
//  Created by 秋勇紀 on 2020/05/05.
//

import Foundation

struct DFF<B: BitCalculatable> {
    private var `in`: B = .allLow
    
    mutating func out(in: B) -> B {
        defer { self.`in` = `in` }
        return self.`in`
    }
}

struct Register<B: BitCalculatable> {
    private var dff = DFF<B>()
    private var load: Bit = .allLow
    private var out: B = .allLow
    
    mutating func out(in: B, load: Bit) -> B {
        let out = Plexor.multiPlexor(a: self.out, b: dff.out(in: `in`), sel: self.load)
        defer { self.load = load; self.out = out }
        return out
    }
}

struct RAM8 {
    
    private var reg = (
        Register<Bit16>(),
        Register<Bit16>(),
        Register<Bit16>(),
        Register<Bit16>(),
        Register<Bit16>(),
        Register<Bit16>(),
        Register<Bit16>(),
        Register<Bit16>()
    )
    
    private var load: Bit = .low
    private var `in`: Bit16 = .allLow
    private var address: (Bit, Bit, Bit) = (.low, .low, .low)
    
    mutating func out(in: Bit16, load: Bit, address: (Bit, Bit, Bit)) -> Bit16 {
        defer { self.load = load; self.in = `in`; self.address = address}
        
        let loadReg = Plexor.deMultiPlexor8way(in: self.load,
                                               sel2: self.address.2,
                                               sel1: self.address.1,
                                               sel0: self.address.0)

        return Plexor.multiPlexor8way(a: reg.0.out(in: self.`in`, load: loadReg.a),
                                      b: reg.1.out(in: self.`in`, load: loadReg.b),
                                      c: reg.2.out(in: self.`in`, load: loadReg.c),
                                      d: reg.3.out(in: self.`in`, load: loadReg.d),
                                      e: reg.4.out(in: self.`in`, load: loadReg.e),
                                      f: reg.5.out(in: self.`in`, load: loadReg.f),
                                      g: reg.6.out(in: self.`in`, load: loadReg.g),
                                      h: reg.7.out(in: self.`in`, load: loadReg.h),
                                      sel2: address.0,
                                      sel1: address.1,
                                      sel0: address.2)
    }
}
