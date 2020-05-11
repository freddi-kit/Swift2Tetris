//
//  Computer.swift
//  Swift2Tetris
//
//  Created by 秋勇紀 on 2020/05/10.
//

import Foundation

public struct Computer {
    private var cpu = CPU()
    private var nextInstAdress: Bit15 = .allLow
    private var nextInM: Bit16 = .allLow

    public var memory = RAM32k()

    private let instructionRAM: RAM32k
    
    public init(instructionRAM: RAM32k) {
        self.instructionRAM = instructionRAM
    }
    
    public mutating func oneClock(reset: Bit) {
        print("[Computer] one clock")
        let nextInstruction = instructionRAM.out(in: .allLow, load: .low, address: nextInstAdress.bits)
        print(nextInstAdress.bits)
        print(nextInstruction.bits)

        let out = cpu.out(inst: nextInstruction, inM: nextInM, reset: reset)
        nextInstAdress = out.pc
        nextInM = memory.out(in: out.outM, load: out.writeM, address: out.addressM.bits)
    }
}
