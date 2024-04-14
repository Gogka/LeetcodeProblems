//
//  MajorityElement.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 12.04.2024.
//

import Foundation

enum MajorityElement {
    /// ✅ https://leetcode.com/problems/majority-element/
    static func majorityElement(_ nums: [Int]) -> Int {
        var dic = [Int: Int]()
        var i = 0
        let halfCount = nums.count / 2
        while i < nums.count {
            let count = (dic[nums[i]] ?? 0) + 1
            if count > halfCount {
                return nums[i]
            } else {
                dic[nums[i]] = count
            }
            i += 1
        }
        return 0
    }
}
