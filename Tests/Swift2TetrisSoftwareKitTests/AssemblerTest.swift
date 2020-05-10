//
//  AssemblerTest.swift
//  Swift2TetrisHardwareKitTests
//
//  Created by 秋勇紀 on 2020/05/10.
//

import XCTest
@testable import Swift2TetrisSoftwareKit

class AssemblerTest: XCTestCase {
    
//    func testTemplate() throws {
//        let assem = Assembler()
//        let result = assem.parse(text: "asm here")
//        let expected = ["hack here"]
//
//        XCTAssertEqual(result.count, expected.count);
//        var line = 0
//        for (i, j) in zip(result, expected) {
//            XCTAssertEqual(i, j, "line\(line) is not same")
//            line += 1
//        }
//    }
    func testRect() throws {
         let assem = Assembler()
         let result = assem.parse(text: """
            @0
            D=M
            @INFINITE_LOOP
            D;JLE
            @counter
            M=D
            @SCREEN
            D=A
            @address
            M=D
         (LOOP)
            @address
            A=M
            M=-1
            @address
            D=M
            @32
            D=D+A
            @address
            M=D
            @counter
            MD=M-1
            @LOOP
            D;JGT
         (INFINITE_LOOP)
            @INFINITE_LOOP
            0;JMP
         """)
         let expected = [
             "0000000000000000",
             "1111110000010000",
             "0000000000010111",
             "1110001100000110",
             "0000000000010000",
             "1110001100001000",
             "0100000000000000",
             "1110110000010000",
             "0000000000010001",
             "1110001100001000",
             "0000000000010001",
             "1111110000100000",
             "1110111010001000",
             "0000000000010001",
             "1111110000010000",
             "0000000000100000",
             "1110000010010000",
             "0000000000010001",
             "1110001100001000",
             "0000000000010000",
             "1111110010011000",
             "0000000000001010",
             "1110001100000001",
             "0000000000010111",
             "1110101010000111",
         ]

         XCTAssertEqual(result.count, expected.count);
         var line = 0
         for (i, j) in zip(result, expected) {
             XCTAssertEqual(i, j, "line\(line) is not same")
             line += 1
         }
    }
    
    func testRectL() throws {
        let assem = Assembler()
        let result = assem.parse(text: """
        @0
        D=M
        @23
        D;JLE
        @16
        M=D
        @16384
        D=A
        @17
        M=D
        @17
        A=M
        M=-1
        @17
        D=M
        @32
        D=D+A
        @17
        M=D
        @16
        MD=M-1
        @10
        D;JGT
        @23
        0;JMP
        """)
        let expected = [
            "0000000000000000",
            "1111110000010000",
            "0000000000010111",
            "1110001100000110",
            "0000000000010000",
            "1110001100001000",
            "0100000000000000",
            "1110110000010000",
            "0000000000010001",
            "1110001100001000",
            "0000000000010001",
            "1111110000100000",
            "1110111010001000",
            "0000000000010001",
            "1111110000010000",
            "0000000000100000",
            "1110000010010000",
            "0000000000010001",
            "1110001100001000",
            "0000000000010000",
            "1111110010011000",
            "0000000000001010",
            "1110001100000001",
            "0000000000010111",
            "1110101010000111",
        ]
        
        XCTAssertEqual(result.count, expected.count);
        var line = 0
        for (i, j) in zip(result, expected) {
            XCTAssertEqual(i, j, "line\(line) is not same")
            line += 1
        }
    }
    
    var allTests = [
        ("testRect", testRect),
        ("testRectL", testRectL)
    ]
}
