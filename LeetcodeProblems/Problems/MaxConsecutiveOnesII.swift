//
//  MaxConsecutiveOnesII.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 04.02.2023.
//

import Foundation

struct MaxConsecutiveOnesII {
    /// ✅ https://leetcode.com/problems/max-consecutive-ones-ii/description/
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var maxOne: Int = 0
        var zeroIndex: Int = -1
        var oneIndex: Int = 0
        for i in 0..<nums.count {
            let num: Int = nums[i]
            if num == 1 { continue }
            if zeroIndex == -1 {
                oneIndex = zeroIndex + 1
                zeroIndex = i
                continue
            }
            maxOne = max(maxOne, i - oneIndex)
            oneIndex = zeroIndex + 1
            zeroIndex = i
        }
        maxOne = max(maxOne, nums.count - oneIndex)
        return maxOne
    }
    struct Case {
        let nums: [Int]
        let result: Int
    }
    func test() {
        let cases: [Case] = [
            .init(nums: [1,0,1,1,0], result: 4),
            .init(nums: [1,0,1,1,0,1], result: 4),
            .init(nums: [1,0,1,1,0,1,1,0,0,1,1,1,1,0,0,1,0,1], result: 5),
            .init(nums: [1,1,0,1], result: 4)
        ]
        for i in 0..<cases.count {
            let c: Case = cases[i]
            if findMaxConsecutiveOnes(c.nums) != c.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
