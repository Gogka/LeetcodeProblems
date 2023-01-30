//
//  TwoSumIIInputarrayissorted.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 08.01.2023.
//

import Foundation

struct TwoSumIIInputarrayissorted {
    /// ✅ https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/description/
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var i: Int = 0
        var j: Int = numbers.count - 1
        var sum: Int = 0
        while true {
            sum = numbers[i] + numbers[j]
            if sum == target {
                return [i + 1, j + 1]
            } else if sum > target {
                j -= 1
            } else {
                i += 1
            }
        }
    }
    private struct Example {
        let nums: [Int]
        let target: Int
        let res: [Int]
    }
    func test() {
        let examples: [Example] = [
            .init(nums: [2,7,11,15], target: 9, res: [1,2]),
            .init(nums: [2,3,4], target: 6, res: [1,3]),
            .init(nums: [-1,0], target: -1, res: [1,2]),
            .init(nums: [3,24,50,79,88,150,345], target: 200, res: [3, 6]),
            .init(nums: [12,13,23,28,43,44,59,60,61,68,70,86,88,92,124,125,136,168,173,173,180,199,212,221,227,230,277,282,306,314,316,321,325,328,336,337,363,365,368,370,370,371,375,384,387,394,400,404,414,422,422,427,430,435,457,493,506,527,531,538,541,546,568,583,585,587,650,652,677,691,730,737,740,751,755,764,778,783,785,789,794,803,809,815,847,858,863,863,874,887,896,916,920,926,927,930,933,957,981,997], target: 542, res: [24,32])
        ]
        for (i, ex) in examples.enumerated() {
            if twoSum(ex.nums, ex.target) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
