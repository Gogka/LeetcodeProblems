//
//  LongestCommonSubsequence.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 19.03.2023.
//

import Foundation

final class LongestCommonSubsequence {
    /// ✅ https://leetcode.com/problems/longest-common-subsequence/description/
    /// Bottom up
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let t1: [Character] = .init(text1)
        let t2: [Character] = .init(text2)
        var dp: [[Int]] = .init(repeating: .init(repeating: 0, count: text2.count + 1), count: text1.count + 1)
        for c1 in (0..<text1.count).reversed() {
            for c2 in (0..<text2.count).reversed() {
                if t1[c1] == t2[c2] {
                    dp[c1][c2] = 1 + dp[c1 + 1][c2 + 1]
                } else {
                    dp[c1][c2] = max(dp[c1 + 1][c2], dp[c1][c2 + 1])
                }
            }
        }
        return dp[0][0]
    }
    /// Top down
    private struct Index: Hashable {
        let i1: Int
        let i2: Int
    }
    private var memo: [Index: Int] = [:]
//    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
//        longestCommonSubsequence(Array(text1), Array(text2), i1: 0, i2: 0)
//    }
    func longestCommonSubsequence(_ text1: [Character], _ text2: [Character], i1: Int, i2: Int) -> Int {
        if i1 == text1.count || i2 == text2.count { return 0 }
        let index: Index = .init(i1: i1, i2: i2)
        if let val: Int = memo[index] { return val }
        let val: Int
        if text1[i1] == text2[i2] {
            val = 1 + longestCommonSubsequence(text1, text2, i1: i1 + 1, i2: i2 + 1)
        } else {
            val = max(
                longestCommonSubsequence(text1, text2, i1: i1 + 1, i2: i2),
                longestCommonSubsequence(text1, text2, i1: i1, i2: i2 + 1)
            )
        }
        memo[index] = val
        return val
    }
    struct TestCase {
        let text1: String
        let text2: String
        let result: Int
    }
    func test() {
        let cases: [TestCase] = [
            .init(text1: "bsbininm", text2: "jmjkbkjkv", result: 1),
            .init(text1: "abcde", text2: "ace", result: 3),
            .init(text1: "abc", text2: "abc", result: 3),
            .init(text1: "abc", text2: "def", result: 0)
        ]
        for (i, tCase) in cases.enumerated() {
            memo.removeAll()
            if longestCommonSubsequence(tCase.text1, tCase.text2) != tCase.result {
                print("Error in:", i)
                return
            }
        }
    }
}
