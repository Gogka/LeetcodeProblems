//
//  MoveZeroes.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 04.01.2023.
//

import Foundation
struct MoveZeroes {
    /// ✅ https://leetcode.com/problems/move-zeroes/description/
    func moveZeroes(_ nums: inout [Int]) {
        var j = 0
        var i = 0
        let count = nums.count
        while i < count {
            if nums[i] != 0 {
                nums[j] = nums[i]
                if i != j {
                    nums[i] = 0
                }
                j += 1
            }
            i += 1
        }
    }
    func test() {
        /// # 1
//        var nums = [1,0,0,2]
        /// # 2
//        var nums = [0,0,0,2]
        /// # 3
//        var nums = [0,0,1,2]
        /// # 4
//        var nums = [0,0,0,0,1,0,0,2,3,3]
        /// # 5
        var nums = [0,0,1,1,0,0,1,1,0,0,0,0,0,0,2,3,3]
        ///
        moveZeroes(&nums)
        print(nums)
    }
}
