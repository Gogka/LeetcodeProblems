//
//  SortArrayByParity.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 04.01.2023.
//

import Foundation

struct SortArrayByParity {
    /// ✅ https://leetcode.com/problems/sort-array-by-parity/description/
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        let count = nums.count
        if nums.count < 2 { return nums }
        var copy = nums
        var j = 0
        var i = 0
        while i < count {
            if copy[i] % 2 == 0 {
                if i != j {
                    let odd = copy[j]
                    copy[j] = copy[i]
                    copy[i] = odd
                }
                j += 1
            }
            i += 1
        }
        return copy
    }
    private struct Example {
        let arr: [Int]
        let res: [Int]
    }
    func test() {
        let examples: [Example] = [
            .init(arr: [17,18,5,4,6,1], res: [18,4,6,17,5,1]),
            .init(arr: [400], res: [400]),
        ]
        for ex in examples {
            if sortArrayByParity(ex.arr) != ex.res {
                print("Error in \(ex.arr)")
                return
            }
        }
    }
}
