//
//  ValidAnagram.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 12.04.2024.
//

import Foundation

final class ValidAnagram {
    /// ✅ https://leetcode.com/problems/valid-anagram/description/
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        let sChars = Array(s)
        let tChars = Array(t)
        var sDict = [Character: Int]()
        var tDict = [Character: Int]()
        for i in 0..<s.count {
            sDict[sChars[i]] = (sDict[sChars[i]] ?? 0) + 1
            tDict[tChars[i]] = (tDict[tChars[i]] ?? 0) + 1
        }
        if tDict.count != sDict.count { return false }
        for (key, value) in tDict {
            if sDict[key] != value {
                return false
            }
        }
        return true
    }
}
