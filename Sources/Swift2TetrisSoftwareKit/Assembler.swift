//
//  Assembler.swift
//  Swift2Tetris
//
//  Created by 秋勇紀 on 2020/05/10.
//

import Foundation

public struct Assembler {
    
    private func parseAsInitialInstruction(text: String) -> String {
        if var int = Int(text) {
            var answer = [Int].init(unsafeUninitializedCapacity: 15) { (array, count) in
                for index in 0..<15 {
                    array[index] = 0
                }
                count = 15
            }
            
            var startIndex = 14
            while int > 0 {
                answer[startIndex] = int % 2
                int /= 2
                startIndex -= 1
            }
            
            var result = "0"
            for index in 0..<15 {
                result += String(answer[index])
            }
            
            return result
        } else {
            
        }
        fatalError()
    }
    
    private func parseDistination(distinationPart: String) -> String {
        return (distinationPart.contains("A") ? "1" : "0") + (distinationPart.contains("D") ? "1" : "0") + (distinationPart.contains("M") ? "1" : "0")
    }
    
    private func parseCompPart(compPart: String) -> String {
        let comp: String
        switch compPart {
        case "0" :
            comp = "101010"
        case "-1" :
            comp = "111010"
        case "D" :
            comp = "001100"
        case "A", "M" :
            comp = "110000"
        case "!D" :
            comp = "001101"
        case "!A", "!M" :
            comp = "110001"
        case "-D" :
            comp = "001111"
        case "-A", "-M" :
            comp = "110011"
        case "D+1" :
            comp = "011111"
        case "A+1", "M+1" :
            comp = "011111"
        case "D-1" :
            comp = "001110"
        case "A-1", "M-1" :
            comp = "110010"
        case "D+A", "D+M" :
            comp = "000010"
        case "D-A", "D-M" :
            comp = "010011"
        case "A-D", "M-D" :
            comp = "000111"
        case "D&A", "M&A" :
            comp = "000000"
        case "D|A", "D|M" :
            comp = "010101"
        default:
            fatalError("Cannot Parse \(compPart)")
        }
        return (compPart.contains("M") ? "1" : "0") + comp
    }
    
    private func parseJmpPart(jmpPart: String) -> String {
        let jmp: String
        switch jmpPart {
        case "null" :
            jmp = "000"
        case "JGT" :
            jmp = "001"
        case "JEQ" :
            jmp = "010"
        case "JGE" :
            jmp = "011"
        case "JLT" :
            jmp = "100"
        case "JNE" :
            jmp = "101"
        case "JLE" :
            jmp = "110"
        case "JMP" :
            jmp = "110"
        default:
            fatalError("Cannot Parse \(jmpPart)")
        }
        return jmp
    }
    
    private func parseOneline(text: String) -> String {
        var currentIndex = text.startIndex
        if text[currentIndex] == "@" {
            currentIndex = text.index(after: currentIndex)
            return parseAsInitialInstruction(text: String(text[currentIndex...]))
        } else if text.contains("=") {
            let equarlIndex = text.firstIndex(of: "=")!
            let distinationPart = parseDistination(distinationPart: String(text[currentIndex ..< equarlIndex]))
            currentIndex = text.index(after: equarlIndex)
            return "111" + parseCompPart(compPart: String(text[currentIndex...])) + distinationPart + "000"
        } else if text.contains(";") {
           let semiCoronIndex = text.firstIndex(of: ";")!
            return "111" + parseCompPart(compPart: String(text[..<semiCoronIndex])) + "000" + parseJmpPart(jmpPart: String(text[text.index(after: semiCoronIndex)...]))
        }
        
        fatalError("Cannot parse \(text)")
    }
    
    public func parse(text: String) -> [String] {
        let instructions = text.components(separatedBy: "\n")
        var assemble: [String] = []
        for instruction in instructions {
            assemble.append(parseOneline(text: instruction))
        }
        
        return assemble
    }
}
