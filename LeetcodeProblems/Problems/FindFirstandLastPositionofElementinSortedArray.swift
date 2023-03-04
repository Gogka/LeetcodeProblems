//
//  FindFirstandLastPositionofElementinSortedArray.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 04.03.2023.
//

import Foundation

struct FindFirstandLastPositionofElementinSortedArray {
    /// ✅ https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/description/
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.isEmpty { return [-1, -1] }
        var left: Int = 0
        var right: Int = nums.count
        while left < right - 1 {
            let mid: Int = (left + right) / 2
            if nums[mid] == target {
                if mid == 0 || nums[mid - 1] != target {
                    left = mid
                } else {
                    right = mid - 1
                }
            } else if nums[mid] < target {
                left = mid
            } else {
                right = mid - 1
            }
        }
        let rangeStart: Int = nums[left] == target ? left : right
        if rangeStart == nums.count || nums[rangeStart] != target { return [-1, -1] }
        right = nums.count
        while left < right - 1 {
            let mid: Int = (left + right) / 2
            if nums[mid] == target {
                if mid == nums.count - 1 || nums[mid + 1] != target {
                    right = mid
                    break
                } else {
                    left = mid
                }
            } else {
                right = mid - 1
            }
        }
        if right != nums.count, nums[right] == target {
            return [rangeStart, right]
        } else if nums[left] == target {
            return [rangeStart, left]
        } else {
            return [rangeStart, rangeStart]
        }
    }
    struct TestCase {
        let nums: [Int]
        let target: Int
        let result: [Int]
    }
    func test() {
        let cases: [TestCase] = [
            .init(nums: [5,7,7,8,8,10], target: 8, result: [3,4]),
            .init(nums: [5,7,7,8,8,10], target: 6, result: [-1, -1]),
            .init(nums: [], target: 0, result: [-1, -1]),
            .init(nums: [2,2], target: 2, result: [0, 1]),
            .init(nums: [3,3,3], target: 3, result: [0,2]),
            .init(nums: [1], target: 1, result: [0,0]),
            .init(nums: [1,2,2,3,4,4,4], target: 4, result: [4,6])
        ]
        for (i, tcase) in cases.enumerated() {
            if searchRange(tcase.nums, tcase.target) != tcase.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
