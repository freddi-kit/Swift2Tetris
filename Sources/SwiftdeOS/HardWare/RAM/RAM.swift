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
    
    mutating func out(in: Bit16, load: Bit, address: (Bit, Bit, Bit)) -> Bit16 {
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
struct RAM64 {

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
    
    mutating func out(in: Bit16, load: Bit, address: (Bit, Bit, Bit, Bit, Bit, Bit)) -> Bit16 {
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

struct RAM256 {

    private var ram64 = (
        RAM64(),
        RAM64(),
        RAM64(),
        RAM64()
    )
    
    mutating func out(in: Bit16, load: Bit, address: (Bit, Bit, Bit, Bit, Bit, Bit, Bit, Bit)) -> Bit16 {
       fatalError("Not Implemented")
    }
}

//
//struct RAM512 {
//
//    private var reg = (
//        RAM64(),
//        RAM64(),
//        RAM64(),
//        RAM64(),
//        RAM64(),
//        RAM64(),
//        RAM64(),
//        RAM64()
//    )
//}
//
//struct RAM4096 {
//
//    private var reg = (
//        RAM512(),
//        RAM512(),
//        RAM512(),
//        RAM512(),
//        RAM512(),
//        RAM512(),
//        RAM512(),
//        RAM512()
//    )
//}
//
//struct RAM16384 {
//
//    private var reg = (
//        RAM4096(),
//        RAM4096(),
//        RAM4096(),
//        RAM4096(),
//        RAM4096(),
//        RAM4096(),
//        RAM4096(),
//        RAM4096()
//    )
//}
//
