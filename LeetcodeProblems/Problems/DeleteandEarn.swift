//
//  DeleteandEarn.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 19.03.2023.
//

import Foundation

final class DeleteandEarn {
    /// ✅ https://leetcode.com/problems/delete-and-earn/description/
    func deleteAndEarn(_ nums: [Int]) -> Int {
        if nums.count < 3 {
            if nums.count == 1 { return nums.first! }
            if abs(nums[0] - nums[1]) == 1 {
                return max(nums[0], nums[1])
            } else {
                return nums[0] + nums[1]
            }
        }
        var count: [Int: Int] = [:]
        for num in nums {
            count[num] = count[num, default: 0] + 1
        }
        let sorted: [Int] = count.keys.sorted()
        let firstSortCount: Int = sorted[0] * count[sorted[0]]!
        if sorted.count == 1 {
            return firstSortCount
        }
        let lastSortCount: Int = sorted[1] * count[sorted[1]]!
        if sorted.count == 2 {
            if sorted[0] + 1 == sorted[1] {
                return max(firstSortCount, lastSortCount)
            } else {
                return lastSortCount + firstSortCount
            }
        }
        var resultPrevPrev: Int = firstSortCount
        var resultPrev: Int = sorted[0] + 1 == sorted[1] ? max(firstSortCount, lastSortCount) : firstSortCount + lastSortCount
        for i in 2..<sorted.count {
            let cur: Int = sorted[i] * count[sorted[i]]!
            let res: Int
            if sorted[i] - 1 == sorted[i - 1] {
                res = max(resultPrevPrev + cur, resultPrev)
            } else {
                res = resultPrev + cur
            }
            resultPrevPrev = resultPrev
            resultPrev = res
        }
        return max(resultPrev, resultPrevPrev)
    }
    struct TestCase {
        let nums: [Int]
        let result: Int
    }
    func test() {
        let cases: [TestCase] = [
            .init(nums: [3,4,2], result: 6),
            .init(nums: [2,2,3,3,3,4], result: 9),
            .init(nums: [1,6,3,3,8,4,8,10,1,3], result: 43)
        ]
        for (i, tCase) in cases.enumerated() {
            if deleteAndEarn(tCase.nums) != tCase.result {
                print("Error in:", i)
                return
            }
        }
    }
}
