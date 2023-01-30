//
//  RemoveDuplicatesfromSortedArray.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 03.01.2023.
//

import Foundation

struct RemoveDuplicatesfromSortedArray {
    /// ✅ https://leetcode.com/problems/remove-duplicates-from-sorted-array/description/
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        let count = nums.count
        if count == 1 { return 1 }
        var i = 1
        var repeatedWindowStart = 1
        var repeatedWindowEnd = 0
        var unrepeatsCount = 1
        while i < count {
            if nums[i - 1] == nums[i] {
                if repeatedWindowStart > repeatedWindowEnd {
                    repeatedWindowStart = i
                    repeatedWindowEnd = i
                } else {
                    repeatedWindowEnd += 1
                }
            } else {
                unrepeatsCount += 1
                if repeatedWindowStart <= repeatedWindowEnd {
                    nums[repeatedWindowStart] = nums[i]
                    repeatedWindowStart += 1
                    repeatedWindowEnd = i
                }
            }
            i += 1
        }
        return unrepeatsCount
    }
    func test() {
        /// # 1
//        var nums: [Int] = [0,0,1,1,2,2,3,3,3]
        /// # 2
//        var nums: [Int] = [0,0, 0, 0,1,1,1,2,2,3,3,3]
        /// # 3
        var nums: [Int] = [1,1,2]
        ///
        print(removeDuplicates(&nums))
        print(nums)
    }
}
