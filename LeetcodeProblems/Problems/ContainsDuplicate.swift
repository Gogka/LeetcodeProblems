//
//  Contains Duplicate.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 12.04.2024.
//

import Foundation

final class ContainsDuplicate {
    /// ✅ https://leetcode.com/problems/contains-duplicate/description/
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var set = Set<Int>()
        for num in nums {
            if set.contains(num) { return true }
            set.insert(num)
        }
        return false
    }
}
