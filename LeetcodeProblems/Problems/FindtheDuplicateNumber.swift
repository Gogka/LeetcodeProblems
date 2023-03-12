//
//  FindtheDuplicateNumber.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 05.03.2023.
//

import Foundation

struct FindtheDuplicateNumber {
    /// ✅ https://leetcode.com/problems/find-the-duplicate-number/description/
    func findDuplicate(_ nums: [Int]) -> Int {
        var left: Int = 1
        var right: Int = nums.count - 1
        while left <= right {
            let mid: Int = (left + right) / 2
            var less: Int = 0
            for i in 0..<nums.count {
                if nums[i] <= mid {
                    less += 1
                }
            }
            if less > mid {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return left
    }
    struct TestCase {
        let nums: [Int]
        let result: Int
    }
    func test() {
        let cases: [TestCase] = [
            .init(nums: [2,1,1,4,3], result: 3),
            .init(nums: [3,1,3,4,2], result: 3),
            .init(nums: [1,3,4,2,2], result: 2),
            .init(nums: [2,2,2,2,2], result: 2),
        ]
        for (i, tcase) in cases.enumerated() {
            if findDuplicate(tcase.nums) != tcase.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
