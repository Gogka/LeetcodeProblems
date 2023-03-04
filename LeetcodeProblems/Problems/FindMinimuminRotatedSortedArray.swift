//
//  FindMinimuminRotatedSortedArray.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 04.03.2023.
//

import Foundation
struct FindMinimuminRotatedSortedArray {
    /// ✅ https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/description/
    func findMin(_ nums: [Int]) -> Int {
        var left: Int = 0
        var right: Int = nums.count - 1
        while left < right - 1 {
            let mid: Int = (left + right) / 2
            if nums[left] < nums[mid], nums[left] > nums[right], nums[mid] > nums[right] {
                left = mid
            } else {
                right = mid
            }
        }
        return min(nums[left], nums[right])
    }
    struct TestCase {
        let nums: [Int]
        let result: Int
    }
    func test() {
        let cases: [TestCase] = [
            .init(nums: [3,4,5,1,2], result: 1),
            .init(nums: [4,5,6,7,0,1,2], result: 0),
            .init(nums: [11,13,15,17], result: 11),
            .init(nums: [2,1], result: 1),
        ]
        for (i, tcase) in cases.enumerated() {
            if findMin(tcase.nums) != tcase.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
