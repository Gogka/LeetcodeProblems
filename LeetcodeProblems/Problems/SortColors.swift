//
//  SortColors.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 08.01.2023.
//

import Foundation
struct SortColors {
    /// ✅ https://leetcode.com/problems/sort-colors/description/
//    func sortColors(_ nums: inout [Int]) {
//        if nums.count <= 1 { return }
//        var zeroIndex: Int = 0
//        var twoIndex: Int = nums.count - 1
//        var val: Int = 0
//        var i: Int = 0
//        while i <= twoIndex {
//            val = nums[i]
//            if val == 0 {
//                (nums[zeroIndex], nums[i]) = (nums[i], nums[zeroIndex])
//                zeroIndex += 1
//                i += 1
//            } else if val == 2 {
//                (nums[twoIndex], nums[i]) = (nums[i], nums[twoIndex])
//                twoIndex -= 1
//            } else {
//                i += 1
//            }
//        }
//    }
    /// Count sort
    func sortColors(_ nums: inout [Int]) {
        if nums.count <= 1 { return }
        /// 2 because max value of the nums could be 2
        var counts: [Int] = .init(repeating: 0, count: 2 + 1)
        for i in 0..<nums.count {
            counts[nums[i]] += 1
        }
        var sum: Int = counts[0]
        counts[0] = 0
        for i in 1..<counts.count {
            sum += counts[i - 1]
            counts[i] = sum
        }
        var sortedArr: [Int] = .init(repeating: 0, count: nums.count)
        for i in 0..<nums.count {
            let index: Int = counts[nums[i]]
            counts[nums[i]] += 1
            sortedArr[index] = nums[i]
        }
        nums = sortedArr
    }
    private final class Example {
        var nums: [Int]
        let res: [Int]
        init(nums: [Int], res: [Int]) {
            self.nums = nums
            self.res = res
        }
    }
    func test() {
        let examples: [Example] = [
            .init(nums: [2,0,2,1,1,0], res: [0,0,1,1,2,2]),
            .init(nums: [2,0,1], res: [0,1,2]),
            .init(nums: [1,2,0], res: [0,1,2])
        ]
        for (i, ex) in examples.enumerated() {
            sortColors(&ex.nums)
            if ex.nums != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
