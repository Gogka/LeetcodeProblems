//
//  ContainsNearbyDuplicate.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 12.04.2024.
//

import Foundation
final class ContainsNearbyDuplicate {
    /// ✅ https://leetcode.com/problems/contains-duplicate-ii/description/
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var dic = [Int: Int]()
        for i in 0..<nums.count {
            let num = nums[i]
            if let index = dic[num] {
                if i - index <= k {
                    return true
                }
            }
            dic[num] = i
        }
        return false
    }
}
