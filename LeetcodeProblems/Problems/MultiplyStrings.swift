//
//  MultiplyStrings.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 19.02.2023.
//

import Foundation

struct MultiplyStrings {
    func multiply(_ num1: String, _ num2: String) -> String {
        let num1Chars: [Character] = .init(num1)
        let num2Chars: [Character] = .init(num2)
        var results: [[Character]] = []
        func writeResults(top: [Character], bottom: [Character]) {
            let length: Int = top.count + 1 + bottom.count
            var bottomIndex: Int = bottom.count - 1
            var topIndex: Int = top.count - 1
            while bottomIndex >= 0 {
                let bottomDigit: Int = Int(String(bottom[bottomIndex]))!
                var result: [Character] = .init(repeating: "0", count: length)
                var resultIndex: Int = result.count - 1 - (bottom.count - bottomIndex - 1)
                var extra: Int = 0
                while topIndex >= 0 {
                    let topDigit: Int = Int(String(top[topIndex]))!
                    let unitResult: Int = topDigit * bottomDigit + extra
                    result[resultIndex] = "\(unitResult % 10)".first!
                    extra = unitResult / 10
                    resultIndex -= 1
                    topIndex -= 1
                }
                result[resultIndex] = "\(extra % 10)".first!
                results.append(result)
                topIndex = top.count - 1
                bottomIndex -= 1
            }
        }
        if num1.count > num2.count {
            writeResults(top: num1Chars, bottom: num2Chars)
        } else {
            writeResults(top: num2Chars, bottom: num1Chars)
        }
        var result: [Character] = .init(repeating: "0", count: results.first!.count)
        var index: Int = result.count - 1
        var extra: Int = 0
        while index >= 0 {
            var sum: Int = 0
            for res in results {
                sum += Int(String(res[index]))!
            }
            sum += extra
            result[index] = "\(sum % 10)".first!
            extra = sum / 10
            index -= 1
        }
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
