//
//  RAM.swift
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
        defer { self.load = load; self.out = out }
        let out = Plexor.multiPlexor(a: self.out, b: dff.out(in: `in`), sel: self.load)
        return out
    }
}

class RAM8 {
    
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
    
    func out(in: Bit16, load: Bit, address: (Bit, Bit, Bit)) -> Bit16 {
        let loadReg = Plexor.deMultiPlexor8way(in: load,
                                               sel2: address.0,
                                               sel1: address.1,
                                               sel0: address.2)

        return Plexor.multiPlexor8way(a: reg.0.out(in: `in`, load: loadReg.a),
                                      b: reg.1.out(in: `in`, load: loadReg.b),
                                      c: reg.2.out(in: `in`, load: loadReg.c),
                                      d: reg.3.out(in: `in`, load: loadReg.d),
                                      e: reg.4.out(in: `in`, load: loadReg.e),
                                      f: reg.5.out(in: `in`, load: loadReg.f),
                                      g: reg.6.out(in: `in`, load: loadReg.g),
                                      h: reg.7.out(in: `in`, load: loadReg.h),
                                      sel2: address.0,
                                      sel1: address.1,
                                      sel0: address.2)
    }
}

// TODO: Make as template
class RAM64 {

    private var ram8 = (
        RAM8(),
        RAM8(),
        RAM8(),
        RAM8(),
        RAM8(),
        RAM8(),
        RAM8(),
        RAM8()
    )
    
    func out(in: Bit16, load: Bit, address: (Bit, Bit, Bit, Bit, Bit, Bit)) -> Bit16 {
        let loadReg = Plexor.deMultiPlexor8way(in: load,
                                               sel2: address.0,
                                               sel1: address.1,
                                               sel0: address.2)
        
        
        let address = (address.3, address.4, address.5)
        return Plexor.multiPlexor8way(a: ram8.0.out(in: `in`, load: loadReg.a, address: address),
                                      b: ram8.1.out(in: `in`, load: loadReg.b, address: address),
                                      c: ram8.2.out(in: `in`, load: loadReg.c, address: address),
                                      d: ram8.3.out(in: `in`, load: loadReg.d, address: address),
                                      e: ram8.4.out(in: `in`, load: loadReg.e, address: address),
                                      f: ram8.5.out(in: `in`, load: loadReg.f, address: address),
                                      g: ram8.6.out(in: `in`, load: loadReg.g, address: address),
                                      h: ram8.7.out(in: `in`, load: loadReg.h, address: address),
                                      sel2: address.0,
                                      sel1: address.1,
                                      sel0: address.2)
    }
}

class RAM512 {

    private var ram64 = (
        RAM64(),
        RAM64(),
        RAM64(),
        RAM64(),
        RAM64(),
        RAM64(),
        RAM64(),
        RAM64()
    )
    
    func out(in: Bit16, load: Bit, address: (Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit)) -> Bit16 {
        let loadReg = Plexor.deMultiPlexor8way(in: load,
                                               sel2: address.0,
                                               sel1: address.1,
                                               sel0: address.2)
        
        
        let address = (address.3, address.4, address.5, address.6, address.7, address.8)
        return Plexor.multiPlexor8way(a: ram64.0.out(in: `in`, load: loadReg.a, address: address),
                                      b: ram64.1.out(in: `in`, load: loadReg.b, address: address),
                                      c: ram64.2.out(in: `in`, load: loadReg.c, address: address),
                                      d: ram64.3.out(in: `in`, load: loadReg.d, address: address),
                                      e: ram64.4.out(in: `in`, load: loadReg.e, address: address),
                                      f: ram64.5.out(in: `in`, load: loadReg.f, address: address),
                                      g: ram64.6.out(in: `in`, load: loadReg.g, address: address),
                                      h: ram64.7.out(in: `in`, load: loadReg.h, address: address),
                                      sel2: address.0,
                                      sel1: address.1,
                                      sel0: address.2)
    }
}

class RAM4096 {

    private var ram512 = (
        RAM512(),
        RAM512(),
        RAM512(),
        RAM512(),
        RAM512(),
        RAM512(),
        RAM512(),
        RAM512()
    )
    
    func out(in: Bit16, load: Bit, address: (Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit)) -> Bit16 {
        let loadReg = Plexor.deMultiPlexor8way(in: load,
                                               sel2: address.0,
                                               sel1: address.1,
                                               sel0: address.2)
        
        
        let address = (address.3, address.4, address.5, address.6, address.7, address.8, address.9, address.10, address.11)
        
        return Plexor.multiPlexor8way(a: ram512.0.out(in: `in`, load: loadReg.a, address: address),
                                      b: ram512.1.out(in: `in`, load: loadReg.b, address: address),
                                      c: ram512.2.out(in: `in`, load: loadReg.c, address: address),
                                      d: ram512.3.out(in: `in`, load: loadReg.d, address: address),
                                      e: ram512.4.out(in: `in`, load: loadReg.e, address: address),
                                      f: ram512.5.out(in: `in`, load: loadReg.f, address: address),
                                      g: ram512.6.out(in: `in`, load: loadReg.g, address: address),
                                      h: ram512.7.out(in: `in`, load: loadReg.h, address: address),
                                      sel2: address.0,
                                      sel1: address.1,
                                      sel0: address.2)
    }
}

class RAM16384 {

    private var ram4096 = (
        RAM4096(),
        RAM4096(),
        RAM4096(),
        RAM4096()
    )
    
    func out(in: Bit16, load: Bit, address: (Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit)) -> Bit16 {
        let loadReg = Plexor.deMultiPlexor4way(in: load,
                                               sel1: address.0,
                                               sel0: address.1)
        
        
        let address = (address.2, address.3, address.4, address.5, address.6, address.7, address.8, address.9, address.10, address.11, address.12, address.13)
        
        return Plexor.multiPlexor4way(a: ram4096.0.out(in: `in`, load: loadReg.a, address: address),
                                      b: ram4096.1.out(in: `in`, load: loadReg.b, address: address),
                                      c: ram4096.2.out(in: `in`, load: loadReg.c, address: address),
                                      d: ram4096.3.out(in: `in`, load: loadReg.d, address: address),
                                      sel1: address.0,
                                      sel0: address.1)
    }
}


class RAM32k {

    private var ram16k = (
        RAM16384(),
        RAM16384()
    )
    
    func out(in: Bit16, load: Bit, address: (Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit)) -> Bit16 {
        let loadReg = Plexor.deMultiPlexor(in: load,
                                           sel: address.0)
        
        
        let address = (address.1, address.2, address.3, address.4, address.5, address.6, address.7, address.8, address.9, address.10, address.11, address.12, address.13, address.14)
        
        return Plexor.multiPlexor(a: ram16k.0.out(in: `in`, load: loadReg.a, address: address),
                                  b: ram16k.0.out(in: `in`, load: loadReg.b, address: address),
                                  sel: address.0)
    }
}

