//
//  LongestCommonPrefix.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 07.01.2023.
//

import Foundation

struct LongestCommonPrefix {
    /// ✅ https://leetcode.com/problems/longest-common-prefix/description/
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard !strs.isEmpty else { return "" }
        var shortest: String = strs.min()!
        for str in strs {
            while !str.hasPrefix(shortest) {
                shortest.removeLast()
            }
            if shortest.isEmpty { return shortest }
        }
        return shortest
    }
    private struct Example {
        let strs: [String]
        let res: String
    }
    func test() {
        let examples: [Example] = [
            .init(strs: ["flower", "flight", "flow"], res: "fl"),
            .init(strs: ["dog","racecar","car"], res: "")
        ]
        for (i, ex) in examples.enumerated() {
            if longestCommonPrefix(ex.strs) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
