//
//  File.swift
//
//
//  Created by 秋勇紀 on 2020/05/05.
//

import Foundation

struct CPU {
    private var registerA = Register<Bit16>()
    private var registerD = Register<Bit16>()
    private var programCounter = ProgramCounter<Bit15>()
    
    mutating func out(inst: Bit16, inM: Bit16, reset: Bit) -> (outM: Bit16, writeM: Bit, addressM: Bit15, pc: Bit15) {
        let writeM: Bit
        let outM: Bit16
        let addressM: Bit15
        let pc: Bit15
        
        let resultRegisterA = registerA.out(in: inst, load: Bit.not(x: inst.bits.0))
        let resultRegisterD = registerD.out(in: inst, load: .low)
        
        let inputALUx = Plexor.multiPlexor(a: resultRegisterA, b: inM, sel: inst.bits.3)

        let resultALU = ALU.alu(x: resultRegisterD,
                                y: inputALUx,
                                zx: inst.bits.4,
                                nx: inst.bits.5,
                                zy: inst.bits.6,
                                ny: inst.bits.7,
                                f: inst.bits.7,
                                no: inst.bits.8)
                
        _ = registerA.out(in: resultALU.out, load: Bit.and(x: inst.bits.10, y: Bit.not(x: inst.bits.0)))
        writeM = Bit.and(x: inst.bits.11, y: Bit.not(x: inst.bits.0))
        _ = registerD.out(in: resultALU.out, load: Bit.and(x: inst.bits.12, y: Bit.not(x: inst.bits.0)))
        
        addressM = Bit15(bits: (resultRegisterA.bits.1,
                                resultRegisterA.bits.2,
                                resultRegisterA.bits.3,
                                resultRegisterA.bits.4,
                                resultRegisterA.bits.5,
                                resultRegisterA.bits.6,
                                resultRegisterA.bits.7,
                                resultRegisterA.bits.8,
                                resultRegisterA.bits.9,
                                resultRegisterA.bits.10,
                                resultRegisterA.bits.11,
                                resultRegisterA.bits.12,
                                resultRegisterA.bits.13,
                                resultRegisterA.bits.14,
                                resultRegisterA.bits.15))
        
        let load: Bit = Bit.and(x: /*Implement it*/ .high,
                                y: Bit.not(x: inst.bits.0))
        pc = programCounter.out(in: addressM, inc: .high, load: load, reset: reset)

        outM = resultALU.out
        
        // fatalError()
        
        return (outM: outM, writeM: writeM, addressM: addressM, pc: pc)
    }
}
