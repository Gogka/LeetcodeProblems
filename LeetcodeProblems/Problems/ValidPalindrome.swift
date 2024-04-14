//
//  ValidPalindrome.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 10.04.2024.
//

import Foundation

enum ValidPalindrome {
    /// ✅ https://leetcode.com/problems/valid-palindrome/
    static func isPalindrome(_ s: String) -> Bool {
        var left = 0
        var right = s.count - 1
        var chars = [Character](s)
        while left < right {
            let leftElement = chars[left]
            if !(leftElement.isLetter || leftElement.isNumber) {
                left += 1
                continue
            }
            let rightElement = chars[right]
            if !(rightElement.isLetter || rightElement.isNumber) {
                right -= 1
                continue
            }
            if leftElement.uppercased() != rightElement.uppercased() {
                return false
            } else {
                left += 1
                right -= 1
            }
        }
        return true
    }
}
