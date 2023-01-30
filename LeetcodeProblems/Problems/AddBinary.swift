//
//  AddBinary.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 07.01.2023.
//

import Foundation
struct AddBinary {
    /// ✅ https://leetcode.com/problems/add-binary/description/
    func addBinary(_ a: String, _ b: String) -> String {
        let aCount: Int = a.count
        let bCount: Int = b.count
        let aChars: [Character] = .init(a)
        let bChars: [Character] = .init(b)
        let max: Int = max(aCount, bCount)
        var result: [Character] = .init(repeating: Character("0"), count: max)
        var remainder: Int = 0
        for i in 0..<max {
            let aIndex: Int = aCount - 1 - i
            let bIndex: Int = bCount - 1 - i
            var oneCount: Int = 0
            if aCount > aIndex, aIndex >= 0, aChars[aIndex] == "1" {
                oneCount += 1
            }
            if bCount > bIndex, bIndex >= 0, bChars[bIndex] == "1" {
                oneCount += 1
            }
            oneCount += remainder
            result[max - i - 1] = Character("\(oneCount % 2)")
            remainder = oneCount / 2
        }
        if remainder > 0 {
            result.insert(Character("1"), at: 0)
        }
        return String(result)
    }
    private struct Example {
        let a: String
        let b: String
        let res: String
    }
    func test() {
        let examples: [Example] = [
            .init(a: "11", b: "1", res: "100"),
            .init(a: "1010", b: "1011", res: "10101"),
        ]
        for (i, ex) in examples.enumerated() {
            if addBinary(ex.a, ex.b) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
