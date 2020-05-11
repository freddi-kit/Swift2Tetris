import Swift2TetrisHardwareKit
import Swift2TetrisSoftwareKit

let ram = RAM32k()
let program = Assembler().parse(text:
"""
@i
M=1
@sum
M=1
(LOOP)
@i
D=M
@100
D=D-A
@END
D;JGT
@i
D=M
@sum
M=D+M
@i
M=M+1
@LOOP
0;JMP
(END)
@END
0;JMP
""")
ProgramWriter.programWriter(program: program, to: ram)

/*
 - 0 : "0000000000010000"
 - 1 : "1110111111001000"
 - 2 : "0000000000010001"
 - 3 : "1110111111001000"
 - 4 : "0000000000010000"
 - 5 : "1111110000010000"
 - 6 : "0000000001100100"
 - 7 : "1110010011010000"
 - 8 : "0000000000010010"
 - 9 : "1110001100000001"
 - 10 : "0000000000010000"
 - 11 : "1111 110000 010000"
 - 12 : "0000000000010001"
 - 13 : "1111000010001000"
 - 14 : "0000000000010000"
 - 15 : "1111110111001000"
 - 16 : "0000000000000100"
 - 17 : "1110101010000111"
 - 18 : "0000000000010010"
 - 19 : "1110101010000111"
 */
var computer = Computer(instructionRAM: ram)
var i = -1

while true {
    print("\(i)!!!")
    i += 1
    computer.oneClock(reset: .low)
    // _ = readLine()
}


"""
@i
M=1
@sum
M=1
@i 4
D=M
@100
D=D-A
@END
D;JGT
@i 10
D=M 11
@sum 12
M=D+M
@i
M=M+1
@LOOP
0;JMP
@END
0;JMP  19
"""
