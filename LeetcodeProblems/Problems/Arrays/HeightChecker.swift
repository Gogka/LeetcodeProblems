//
//  HeightChecker.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 04.01.2023.
//

import Foundation

struct HeightChecker {
    /// ✅ https://leetcode.com/problems/height-checker/description/
    func heightChecker(_ heights: [Int]) -> Int {
        let sorted = heights.sorted(by: <)
        var count = 0
        for i in 0..<heights.count where sorted[i] != heights[i] {
            count += 1
        }
        return count
    }
    private struct Example {
        let arr: [Int]
        let res: Int
    }
    func test() {
        let examples: [Example] = [
            .init(arr: [1,1,4,2,1,3], res: 3),
            .init(arr: [5,1,2,3,4], res: 5),
            .init(arr: [1,2,3,4,5], res: 0)
        ]
        for ex in examples {
            if heightChecker(ex.arr) != ex.res {
                print("Error in \(ex.arr)")
                return
            }
        }
    }
}
