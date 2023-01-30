//
//  LargestNumberAtLeastTwiceofOthers.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 06.01.2023.
//

import Foundation

struct LargestNumberAtLeastTwiceofOthers {
    /// ✅ https://leetcode.com/problems/largest-number-at-least-twice-of-others/description/
    func dominantIndex(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return -1 }
        var maxIndex: Int = 0
        var secondMaxIndex: Int?
        for i in 1..<nums.count {
            if nums[i] > nums[maxIndex] {
                secondMaxIndex = maxIndex
                maxIndex = i
            } else if secondMaxIndex.map({ nums[i] > nums[$0] }) ?? true {
                secondMaxIndex = i
            }
        }
        return secondMaxIndex.map { nums[maxIndex] >= nums[$0] * 2 } ?? true ? maxIndex : -1
    }
    private struct Example {
        let nums: [Int]
        let res: Int
    }
    func test() {
        let examples: [Example] = [
            .init(nums: [3,6,1,0], res: 1),
            .init(nums: [1,2,3,4], res: -1),
            .init(nums: [1,0], res: 0)
        ]
        for (i, ex) in examples.enumerated() {
            if dominantIndex(ex.nums) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
