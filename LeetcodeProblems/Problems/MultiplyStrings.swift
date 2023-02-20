//
//  MultiplyStrings.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 19.02.2023.
//

import Foundation

struct MultiplyStrings {
    /// ✅ https://leetcode.com/problems/multiply-strings/description/
    func multiply(_ num1: String, _ num2: String) -> String {
        let num1Chars: [Character] = .init(num1)
        let num2Chars: [Character] = .init(num2)
        func writeResult(top: [Character], bottom: [Character]) -> [Character] {
            let length: Int
            if top.count > bottom.count {
                length = top.count + 1 + bottom.count
            } else {
                length = bottom.count + 1 + top.count
            }
            var result: [Character] = .init(repeating: "0", count: length)
            var bottomIndex: Int = bottom.count - 1
            var topIndex: Int = top.count - 1
            while bottomIndex >= 0 {
                let bottomDigit: Int = Int(String(bottom[bottomIndex]))!
                var iterationResult: [Character] = .init(repeating: "0", count: length)
                var resultIndex: Int = length - (bottom.count - bottomIndex)
                var extra: Int = 0
                while topIndex >= 0 {
                    let topDigit: Int = Int(String(top[topIndex]))!
                    let unitResult: Int = topDigit * bottomDigit + extra
                    iterationResult[resultIndex] = "\(unitResult % 10)".first!
                    extra = unitResult / 10
                    resultIndex -= 1
                    topIndex -= 1
                }
                iterationResult[resultIndex] = "\(extra % 10)".first!
                extra = 0
                var sumIndex: Int = length - 1
                while sumIndex > 0 && sumIndex >= resultIndex {
                    let sum: Int = Int(String(iterationResult[sumIndex]))! + Int(String(result[sumIndex]))! + extra
                    result[sumIndex] = "\(sum % 10)".first!
                    extra = sum / 10
                    sumIndex -= 1
                }
                result[sumIndex] = "\(Int(String(result[sumIndex]))! + extra)".first!
                topIndex = top.count - 1
                bottomIndex -= 1
            }
            return result
        }
        let result: [Character] = writeResult(top: num1Chars, bottom: num2Chars)
        var zeroIndex: Int = 0
        while zeroIndex < result.count - 1 && result[zeroIndex] == "0" {
            zeroIndex += 1
        }
        return String(result[zeroIndex..<result.count])
    }
    struct TestCase {
        let num1: String
        let num2: String
        let result: String
    }
    func test() {
        let cases: [TestCase] = [
            .init(num1: "2", num2: "3", result: "6"),
            .init(num1: "456", num2: "123", result: "56088"),
            .init(num1: "0", num2: "0", result: "0"),
        ]
        for (i, testCase) in cases.enumerated() {
            if multiply(testCase.num1, testCase.num2) != testCase.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
