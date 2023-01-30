//
//  SearchInsertPosition.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 08.01.2023.
//

import Foundation

struct SearchInsertPosition {
    /// ✅ https://leetcode.com/problems/search-insert-position/description/
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var left: Int = 0
        var right: Int = nums.count - 1
        var midVal: Int = 0
        var midIndex: Int = 0
        var result: Int = 0
        while left <= right {
            midIndex = (right + left) / 2
            midVal = nums[midIndex]
            if midVal == target {
                return midIndex
            } else if midVal > target {
                right = midIndex - 1
                result = midIndex
            } else {
                left = midIndex + 1
                result = midIndex + 1
            }
        }
        return result
    }
    private struct Example {
        let nums: [Int]
        let target: Int
        let res: Int
    }
    func test() {
        let examples: [Example] = [
            .init(nums: [1,3,5,6], target: 5, res: 2),
            .init(nums: [1,3,5,6], target: 0, res: 0),
            .init(nums: [1,3,5,6], target: 2, res: 1),
            .init(nums: [1,3,5,6], target: 7, res: 4),
        ]
        for (i, ex) in examples.enumerated() {
            if searchInsert(ex.nums, ex.target) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
