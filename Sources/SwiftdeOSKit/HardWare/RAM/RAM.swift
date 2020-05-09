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
        
        
        
        return Plexor.multiPlexor8way(a: ram8.0.out(in: `in`, load: loadReg.a, address: (address.3, address.4, address.5)),
                                      b: ram8.1.out(in: `in`, load: loadReg.b, address: (address.3, address.4, address.5)),
                                      c: ram8.2.out(in: `in`, load: loadReg.c, address: (address.3, address.4, address.5)),
                                      d: ram8.3.out(in: `in`, load: loadReg.d, address: (address.3, address.4, address.5)),
                                      e: ram8.4.out(in: `in`, load: loadReg.e, address: (address.3, address.4, address.5)),
                                      f: ram8.5.out(in: `in`, load: loadReg.f, address: (address.3, address.4, address.5)),
                                      g: ram8.6.out(in: `in`, load: loadReg.g, address: (address.3, address.4, address.5)),
                                      h: ram8.7.out(in: `in`, load: loadReg.h, address: (address.3, address.4, address.5)),
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
        RAM4096(),
        RAM4096(),
        RAM4096(),
        RAM4096(),
        RAM4096()
    )
    
    func out(in: Bit16, load: Bit, address: (Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit)) -> Bit16 {
        let loadReg = Plexor.deMultiPlexor8way(in: load,
                                               sel2: address.0,
                                               sel1: address.1,
                                               sel0: address.2)
        
        
        let address = (address.3, address.4, address.5, address.6, address.7, address.8, address.9, address.10, address.11, address.12, address.13, address.14)
        
        return Plexor.multiPlexor8way(a: ram4096.0.out(in: `in`, load: loadReg.a, address: address),
                                      b: ram4096.1.out(in: `in`, load: loadReg.b, address: address),
                                      c: ram4096.2.out(in: `in`, load: loadReg.c, address: address),
                                      d: ram4096.3.out(in: `in`, load: loadReg.d, address: address),
                                      e: ram4096.4.out(in: `in`, load: loadReg.e, address: address),
                                      f: ram4096.5.out(in: `in`, load: loadReg.f, address: address),
                                      g: ram4096.6.out(in: `in`, load: loadReg.g, address: address),
                                      h: ram4096.7.out(in: `in`, load: loadReg.h, address: address),
                                      sel2: address.0,
                                      sel1: address.1,
                                      sel0: address.2)
    }
}


class RAM32k {

    private var ram16k = (
        RAM16384(),
        RAM16384(),
        RAM16384(),
        RAM16384(),
        RAM16384(),
        RAM16384(),
        RAM16384(),
        RAM16384()
    )
    
    func out(in: Bit16, load: Bit, address: (Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit)) -> Bit16 {
        let loadReg = Plexor.deMultiPlexor8way(in: load,
                                               sel2: address.0,
                                               sel1: address.1,
                                               sel0: address.2)
        
        
        let address = (address.3, address.4, address.5, address.6, address.7, address.8, address.9, address.10, address.11, address.12, address.13, address.14, address.15, address.16, address.17)
        
        return Plexor.multiPlexor8way(a: ram16k.0.out(in: `in`, load: loadReg.a, address: address),
                                      b: ram16k.1.out(in: `in`, load: loadReg.b, address: address),
                                      c: ram16k.2.out(in: `in`, load: loadReg.c, address: address),
                                      d: ram16k.3.out(in: `in`, load: loadReg.d, address: address),
                                      e: ram16k.4.out(in: `in`, load: loadReg.e, address: address),
                                      f: ram16k.5.out(in: `in`, load: loadReg.f, address: address),
                                      g: ram16k.6.out(in: `in`, load: loadReg.g, address: address),
                                      h: ram16k.7.out(in: `in`, load: loadReg.h, address: address),
                                      sel2: address.0,
                                      sel1: address.1,
                                      sel0: address.2)
    }
}

