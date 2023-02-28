//
//  BinarySearch.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 28.02.2023.
//

import Foundation

struct BinarySearch {
    /// ✅ https://leetcode.com/problems/binary-search/description/
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left: Int = 0
        var right: Int = nums.count - 1
        while left <= right {
            let mid: Int = (right + left) / 2
            if nums[mid] == target {
                return mid
            } else if nums[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return -1
    }
    struct TestCase {
        let nums: [Int]
        let target: Int
        let result: Int
    }
    func test() {
        let cases: [TestCase] = [
            .init(nums: [0], target: 0, result: 0),
            .init(nums: [0], target: 1, result: -1),
            .init(nums: [0,2], target: 1, result: -1),
            .init(nums: [-1,0,3,5,9,12], target: 9, result: 4),
            .init(nums: [-1,0,3,5,9,12], target: 2, result: -1),
            .init(nums: [-1,0,3,5,9,12], target: 13, result: -1)
        ]
        for (i, tcase) in cases.enumerated() {
            if search(tcase.nums, tcase.target) != tcase.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
