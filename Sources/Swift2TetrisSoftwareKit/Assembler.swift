//
//  Assembler.swift
//  Swift2Tetris
//
//  Created by 秋勇紀 on 2020/05/10.
//

import Foundation

public class Assembler {
    
    public init() {}
    
    // TABLE FOR VARIABLE
    private var varibleTable: [String] = []
    // TABLE FOR LABEL
    private var labelTable: [String: Int] = [:]
    
    // CONTERT NUMBER => BINARY NUM
    private func convertBinary(from num: Int) -> String {
        var num = num
        var answer = [Int].init(unsafeUninitializedCapacity: 15) { (array, count) in
            for index in 0..<15 {
                array[index] = 0
            }
            count = 15
        }
        
        var startIndex = 14
        while num > 0 {
            answer[startIndex] = num % 2
            num /= 2
            startIndex -= 1
        }
        
        var result = "0"
        for index in 0..<15 {
            result += String(answer[index])
        }
        
        return result
    }
    
    private func parseAsInitialInstruction(text: String) -> String {
        if let num = Int(text) {
            return convertBinary(from: num)
        } else if text[text.startIndex] == "R", let num = Int(String(text[text.index(after: text.startIndex)...])) {
            // REGISTER
            assert(num >= 0 && num <= 15, "R\(num) is not avaliable")
            return convertBinary(from: num)
        } else if text == "SP" || text == "LCL" || text == "ARG" || text == "THIS" {
            // RESERVED
            switch text {
            case "SP": return convertBinary(from: 0)
            case "LCL": return convertBinary(from: 1)
            case "ARG": return convertBinary(from: 2)
            case "THIS": return convertBinary(from: 3)
            default: fatalError()
            }
        } else {
            // SYMBOL
            if let index = varibleTable.firstIndex(of: text) {
                return convertBinary(from: index + 16)
            } else if let index = labelTable[text] {
                // LABEL
                return convertBinary(from: index)
            } else {
                // NEW SYMBOL
                varibleTable.append(text)
                return convertBinary(from: varibleTable.count - 1 + 16)
            }
        }
    }
    
    private func parseDistination(distinationPart: String) -> String {
        return (distinationPart.contains("A") ? "1" : "0") + (distinationPart.contains("D") ? "1" : "0") + (distinationPart.contains("M") ? "1" : "0")
    }
    
    private func parseCmpPart(cmpPart: String) -> String {
        let cmp: String
        switch cmpPart.trimmingCharacters(in: .whitespacesAndNewlines) {
        case "0" :
            cmp = "101010"
        case "1" :
            cmp = "111111"
        case "-1" :
            cmp = "111010"
        case "D" :
            cmp = "001100"
        case "A", "M" :
            cmp = "110000"
        case "!D" :
            cmp = "001101"
        case "!A", "!M" :
            cmp = "110001"
        case "-D" :
            cmp = "001111"
        case "-A", "-M" :
            cmp = "110011"
        case "D+1" :
            cmp = "011111"
        case "A+1", "M+1" :
            cmp = "011111"
        case "D-1" :
            cmp = "001110"
        case "A-1", "M-1" :
            cmp = "110010"
        case "D+A", "D+M" :
            cmp = "000010"
        case "D-A", "D-M" :
            cmp = "010011"
        case "A-D", "M-D" :
            cmp = "000111"
        case "D&A", "D&M" :
            cmp = "000000"
        case "D|A", "D|M" :
            cmp = "010101"
        default:
            fatalError("Cannot Parse :\"\(cmpPart)\"")
        }
        return (cmpPart.contains("M") ? "1" : "0") + cmp
    }
    
    private func parseJmpPart(jmpPart: String) -> String {
        let jmp: String
        switch jmpPart.trimmingCharacters(in: .whitespacesAndNewlines) {
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
        if text[text.startIndex] == "@" {
            let afterAtMarkIndex = text.index(after: text.startIndex)
            return parseAsInitialInstruction(text: String(text[afterAtMarkIndex...]))
        } else if text.contains("=") {
            let equarlIndex = text.firstIndex(of: "=")!
            let distinationPart = parseDistination(distinationPart: String(text[text.startIndex ..< equarlIndex]))
            let afterEqualIndex = text.index(after: equarlIndex)
            return "111" + parseCmpPart(cmpPart: String(text[afterEqualIndex...])) + distinationPart + "000"
        } else if text.contains(";") {
            let semiCoronIndex = text.firstIndex(of: ";")!
            let afterSemiCoronIndex = text.index(after: semiCoronIndex)
            return "111" + parseCmpPart(cmpPart: String(text[..<semiCoronIndex])) + "000" + parseJmpPart(jmpPart: String(text[afterSemiCoronIndex...]))
        }
        
        fatalError("Cannot parse \(text)")
    }
    
    private func handleAsLabel(label: String, line: Int) {
        guard labelTable[label] == nil, varibleTable.firstIndex(of: label) == nil else {
            fatalError("Duplicated label \(label)")
        }
        labelTable[label] = line
    }
    
    public func parse(text: String) -> [String] {
        let instructions = text.components(separatedBy: "\n")
        var assemble: [String] = []
        
        
        // LOOK UP LABEL
        var line = 0
        for instruction in instructions {
            let instruction = instruction.trimmingCharacters(in: .whitespacesAndNewlines)
            if instruction.count == 0 { continue }
            if instruction[instruction.startIndex] == "(" {
                guard let closeBracketIndex = instruction.firstIndex(of: ")") else {
                    fatalError("Please close bracket by )")
                }
                let label = String(instruction[instruction.index(after: instruction.startIndex)..<closeBracketIndex])
                handleAsLabel(label: label, line: line)
                continue
            }
            line += 1
        }
        
        // PARSE INSTUCTION ITSELF
        for instruction in instructions {
            var instruction = instruction.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // COMMENT OUT CHECK
            if instruction.contains("//") {
                instruction = String(text[..<text.firstIndex(of: "/")!])
            }
            if instruction.count == 0 { continue }
            
            if instruction[instruction.startIndex] == "(" {
                continue
            } else {
                let parseResult = parseOneline(text: instruction)
                assert(parseResult.count == 16, "parsed as not 16bit")
                assemble.append(parseResult)
            }
        }
        
        return assemble
    }
}
