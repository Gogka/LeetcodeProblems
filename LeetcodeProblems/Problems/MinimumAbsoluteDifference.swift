//
//  MinimumAbsoluteDifference.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 10.01.2023.
//

import Foundation

struct MinimumAbsoluteDifference {
    /// ✅ https://leetcode.com/problems/minimum-absolute-difference/description/
    func minimumAbsDifference(_ arr: [Int]) -> [[Int]] {
        let sorted: [Int] = arr.sorted(by: <)
        var diff: Int = sorted.last! - sorted.first!
        var startI: Int = 0
        for i in 0..<sorted.count - 1 {
            if sorted[i + 1] - sorted[i] < diff {
                startI = i
                diff = sorted[i + 1] - sorted[i]
            }
        }
        if diff == sorted.last! - sorted.first! { return [[sorted.first!, sorted.last!]] }
        var result: [[Int]] = []
        for i in startI..<sorted.count - 1 {
            if sorted[i + 1] - sorted[i] == diff {
                result.append([sorted[i], sorted[i + 1]])
            }
        }
        return result
    }
    private struct Example {
        let nums: [Int]
        let res: [[Int]]
    }
    func test() {
        let examples: [Example] = [
            .init(nums: [4,2,1,3], res: [[1,2],[2,3],[3,4]]),
            .init(nums: [1,3,6,10,15], res: [[1,3]]),
            .init(nums: [3,8,-10,23,19,-4,-14,27], res: [[-14,-10],[19,23],[23,27]]),
        ]
        for (i, ex) in examples.enumerated() {
            if minimumAbsDifference(ex.nums) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
