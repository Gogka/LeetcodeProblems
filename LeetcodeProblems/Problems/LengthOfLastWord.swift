//
//  LengthOfLastWord.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 01.04.2024.
//

import Foundation

final class LengthOfLastWord {
    /// ✅ https://leetcode.com/problems/length-of-last-word/
    func lengthOfLastWord(_ s: String) -> Int {
        var length = 0
        for i in 0..<s.count {
            if s[s.index(s.endIndex, offsetBy: -i - 1)] == " " {
                if length > 0 {
                    return length
                } else {
                    continue
                }
            }
            length += 1
        }
        return length
    }
}
