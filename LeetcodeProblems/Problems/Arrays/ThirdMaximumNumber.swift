//
//  ThirdMaximumNumber.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 04.01.2023.
//

import Foundation

struct ThirdMaximumNumber {
    /// ✅ https://leetcode.com/problems/third-maximum-number/description/
    func thirdMax(_ nums: [Int]) -> Int {
        var maximums: [Int?] = .init(repeating: nil, count: 3)
        for num in nums {
            for i in (0..<3).reversed() {
                if maximums[i] == nil {
                    maximums[i] = num
                    break
                }
                if num == maximums[i] { break }
                if num > maximums[i]! {
                    for i in 0..<i {
                        maximums[i] = maximums[i + 1]
                    }
                    maximums[i] = num
                    break
                }
            }
        }
        return maximums[0] != nil ? maximums[0]! : maximums.last!!
    }
    private struct Example {
        let arr: [Int]
        let res: Int
    }
    func test() {
        let examples: [Example] = [
//            .init(arr: [1,1,4,2,1,3], res: 2),
//            .init(arr: [5,1,2,3,4], res: 3),
//            .init(arr: [1,2,3,4,5], res: 3),
            .init(arr: [2,2,3,1], res: 1)
        ]
        for ex in examples {
            if thirdMax(ex.arr) != ex.res {
                print("Error in \(ex.arr)")
                return
            }
        }
    }
}
