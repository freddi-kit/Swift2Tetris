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
    private var pc = ProgramCounter<Bit15>()
    
    mutating func out(inst: Bit16, inM: Bit16, reset: Bit) -> (outM: Bit16, writeM: Bit, addressM: Bit15, pc: Bit15) {
        let writeM: Bit
        let outM: Bit16
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
        
        _ = registerA.out(in: resultALU, load: Bit.and(x: inst.bits.10, y: inst.bits.0))
        writeM = Bit.and(x: inst.bits.11, y: inst.bits.0)
        _ = registerD.out(in: resultALU, load: Bit.and(x: inst.bits.12, y: inst.bits.0))

        outM = resultALU
        
        fatalError()
    }
}
