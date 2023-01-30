//
//  ArrayPartitionI.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 08.01.2023.
//

import Foundation

struct ArrayPartitionI {
    /// ✅ https://leetcode.com/problems/array-partition/description/
    func arrayPairSum(_ nums: [Int]) -> Int {
        let sorted: [Int] = nums.sorted(by: >)
        var i: Int = 0
        var sum: Int = 0
        while i + 2 <= sorted.count {
            sum += sorted[i + 1]
            i += 2
        }
        return sum
    }
    private struct Example {
        let nums: [Int]
        let res: Int
    }
    func test() {
        let examples: [Example] = [
            .init(nums: [3,6,1,0], res: 3),
            .init(nums: [1,2,3,4], res: 4),
            .init(nums: [1,0], res: 0),
        ]
        for (i, ex) in examples.enumerated() {
            if arrayPairSum(ex.nums) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
