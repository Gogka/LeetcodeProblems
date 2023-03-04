//
//  FindPeakElement.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 02.03.2023.
//

import Foundation

struct FindPeakElement {
    /// ✅ https://leetcode.com/problems/find-peak-element/description/
    func findPeakElement(_ nums: [Int]) -> Int {
        if nums.count == 1 { return 0 }
        var left: Int = 0
        var right: Int = nums.count
        while left < right - 1 {
            let mid: Int = (left + right) / 2
            if mid == 0 || nums[mid] < nums[mid - 1] {
                right = mid
            } else {
                left = mid
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
            .init(nums: [1,2,3,1], result: 2),
            .init(nums: [1,2,1,3,5,6,4], result: 5),
            .init(nums: [1,2,3,4], result: 3)
        ]
        for (i, tcase) in cases.enumerated() {
            if findPeakElement(tcase.nums) != tcase.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
