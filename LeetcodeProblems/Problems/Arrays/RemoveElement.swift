//
//  RemoveElement.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 03.01.2023.
//

import Foundation

struct RemoveElement {
    /// ✅ https://leetcode.com/problems/remove-element/description/
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0
        var j = nums.count - 1
        while i <= j {
            if nums[i] == val {
                repeat {
                    if nums[j] != val {
                        nums[i] = nums[j]
                        j -= 1
                        break
                    }
                    j -= 1
                } while j > i
                if nums[i] == val {
                    return i
                }
            }
            i += 1
        }
        return i
    }
    func test() {
        /// # 1
//        var nums: [Int] = [3,2,2,3]
//        let val = 3
        /// # 2
        var nums: [Int] = [0,1,2,2,3,0,4,2]
        let val = 2
        /// # 3
//        var nums: [Int] = [1]
//        let val = 1
        ///
        print(removeElement(&nums, val))
        print(nums)
    }
}
