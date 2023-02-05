//
//  EvaluateReversePolishNotation.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 05.02.2023.
//

import Foundation

struct EvaluateReversePolishNotation {
    /// ✅ https://leetcode.com/problems/evaluate-reverse-polish-notation/description/
    func evalRPN(_ tokens: [String]) -> Int {
        var operands: [Int] = []
        func processOperation(_ operation: (Int, Int) -> Int) {
            let secondOperand: Int = operands.removeLast()
            let firstOperand: Int = operands.removeLast()
            operands.append(operation(firstOperand, secondOperand))
        }
        for token in tokens {
            switch token {
            case "+":
                processOperation { $0 + $1 }
            case "-":
                processOperation { $0 - $1 }
            case "*":
                processOperation { $0 * $1 }
            case "/":
                processOperation { $0 / $1 }
            default:
                operands.append(Int(token)!)
            }
        }
        return operands.first!
    }
    struct Case {
        let tokens: [String]
        let result: Int
    }
    func test() {
        let cases: [Case] = [
            .init(tokens: ["2","1","+","3","*"], result: 9),
            .init(tokens: ["4","13","5","/","+"], result: 6),
            .init(tokens: ["10","6","9","3","+","-11","*","/","*","17","+","5","+"], result: 22),
        ]
        for i in 0..<cases.count {
            let c: Case = cases[i]
            if evalRPN(c.tokens) != c.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
