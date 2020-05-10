//
//  ProgramWriter.swift
//  Swift2Tetris
//
//  Created by 秋勇紀 on 2020/05/10.
//

import Foundation
import Swift2TetrisHardwareKit

public enum ProgramWriter {
    
    private static func validateProgram(program: [String]) {
        for inst in program {
            assert(inst.count == 16, "Program Should Be 16bit")
        }
    }
    
    private static func convertInstToBit16(inst: String) -> Bit16 {
        func sToB(_ s: Character)-> Bit {
            return s == "0" ? .low : .high
        }
        let inst = Array(inst)
        
        return Bit16(bits: (sToB(inst[0]),
                            sToB(inst[1]),
                            sToB(inst[2]),
                            sToB(inst[3]),
                            sToB(inst[4]),
                            sToB(inst[5]),
                            sToB(inst[6]),
                            sToB(inst[7]),
                            sToB(inst[8]),
                            sToB(inst[9]),
                            sToB(inst[10]),
                            sToB(inst[11]),
                            sToB(inst[12]),
                            sToB(inst[13]),
                            sToB(inst[14]),
                            sToB(inst[15])
        ))
    }
    
    public static func programWriter(program: [String], to ram: RAM32k) {
        validateProgram(program: program)
        var currentAddress = Bit15.allLow
        for inst in program {
            _ = ram.out(in: convertInstToBit16(inst: inst), load: .high, address: currentAddress.bits)
            currentAddress = .incrementor(x: currentAddress)
        }
    }
}
