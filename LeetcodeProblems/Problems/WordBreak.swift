//
//  WordBreak.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 25.03.2023.
//

import Foundation
final class WordBreak {
    /// ✅ https://leetcode.com/problems/word-break/description/
    /// Bottom up
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var dp: [Bool] = .init(repeating: false, count: s.count)
        let sChar: [Character] = .init(s)
        let words: [[Character]] = wordDict.map { .init($0) }
        for i in 0..<s.count {
            for j in 0..<words.count {
                if i - words[j].count + 1 < 0 { continue }
                var isValid: Bool = true
                for c in 0..<words[j].count {
                    isValid = isValid && words[j][c] == sChar[i - words[j].count + c + 1]
                    if !isValid { break }
                }
                if !isValid { continue }
                if i - words[j].count >= 0 {
                    dp[i] = dp[i - words[j].count]
                } else {
                    dp[i] = true
                }
                if dp[i] { break }
            }
        }
        return dp[s.count - 1]
    }
//    /// Bottom up
//    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
//        let maxWordLength: Int = wordDict.max(by: { $0.count <= $1.count })!.count
//        /// dp[i][j][k] - result for i's 's' index, j's word in 'wordDict' for k's index of character in the word
//        let sChars: [Character] = .init(s)
//        let words: [[Character]] = wordDict.map { .init($0) }
//        var dp: [[[Bool]]] = .init(
//            repeating: .init(
//                repeating: .init(
//                    repeating: false,
//                    count: maxWordLength),
//                count: wordDict.count),
//            count: s.count)
//        for j in 0..<words.count {
//            let char: Character = words[j][words[j].count - 1]
//            dp[s.count - 1][j][words[j].count - 1] = char == sChars.last
//        }
//        for i in (0..<sChars.count - 1).reversed() {
//            var endedSuccessfully: Bool = false
//            for j in 0..<words.count {
//                if dp[i + 1][j][0] {
//                    endedSuccessfully = true
//                    break
//                }
//            }
//            for j in 0..<words.count {
//                for k in (0..<words[j].count).reversed() {
//                    if words[j][k] != sChars[i] {
//                        dp[i][j][k] = false
//                        continue
//                    }
//                    if k + 1 == words[j].count {
//                        dp[i][j][k] = endedSuccessfully
//                    } else {
//                        dp[i][j][k] = dp[i + 1][j][k + 1]
//                    }
//                }
//            }
//        }
//        return dp[0].first(where: { $0[0] }) != nil
//    }
    /// Top down
//    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
//        memo = [:]
//        return wordBreak(.init(s),
//                         wordDict.map { .init($0) }.sorted(by: { $0.count > $1.count }),
//                         sIndex: 0,
//                         currentWordIndex: nil,
//                         currentWordCharacterIndex: nil)
//    }
    var memo: [Index: Bool] = [:]
    struct Index: Hashable {
        let sIndex: Int
        let currentWordIndex: Int?
        let currentWordCharacterIndex: Int?
    }
    func wordBreak(_ s: [Character],
                   _ wordDict: [[Character]],
                   sIndex: Int,
                   currentWordIndex: Int?,
                   currentWordCharacterIndex: Int?) -> Bool {
        let index: Index = .init(sIndex: sIndex, currentWordIndex: currentWordIndex, currentWordCharacterIndex: currentWordCharacterIndex)
        if let value = memo[index] { return value }
        if sIndex == s.count {
            memo[index] = currentWordIndex == nil
            return memo[index]!
        }
        let currentWord: [Character]? = currentWordIndex.map { wordDict[$0] }
        if let currentWord = currentWord, let currentWordCharacterIndex = currentWordCharacterIndex {
            if currentWord[currentWordCharacterIndex] == s[sIndex] {
                if currentWord.count == currentWordCharacterIndex + 1 {
                    memo[index] = wordBreak(s, wordDict, sIndex: sIndex + 1, currentWordIndex: nil, currentWordCharacterIndex: nil)
                    return memo[index]!
                } else {
                    memo[index] = wordBreak(s, wordDict, sIndex: sIndex + 1, currentWordIndex: currentWordIndex!, currentWordCharacterIndex: currentWordCharacterIndex + 1)
                    return memo[index]!
                }
            }
        } else {
            for i in 0..<wordDict.count {
                if wordDict[i][0] == s[sIndex] {
                    if wordDict[i].count != 1 {
                        memo[index] = wordBreak(s, wordDict, sIndex: sIndex + 1, currentWordIndex: i, currentWordCharacterIndex: 1)
                        if memo[index]! {
                            return true
                        }
                    } else {
                        memo[index] = wordBreak(s, wordDict, sIndex: sIndex + 1, currentWordIndex: nil, currentWordCharacterIndex: nil)
                        if memo[index]! {
                            return true
                        }
                    }
                }
            }
        }
        memo[index] = false
        return memo[index]!
    }
    struct TestCase {
        let s: String
        let wordDict: [String]
        let result: Bool
    }
    func test() {
        let cases: [TestCase] = [
//            .init(s: "abcd", wordDict: ["a","abc","b","cd"], result: true),
            .init(s: "cbca", wordDict: ["bc", "ca"], result: false),
            .init(s: "leetcode", wordDict: ["leet", "code"], result: true),
            .init(s: "applepenapple", wordDict: ["apple", "pen"], result: true),
            .init(s: "catsandog", wordDict: ["cats","dog","sand","and","cat"], result: false),
        ]
        for tCase in cases.enumerated() {
            if wordBreak(tCase.element.s, tCase.element.wordDict) != tCase.element.result {
                print("Error in \(tCase.offset)")
                return
            }
        }
    }
}
