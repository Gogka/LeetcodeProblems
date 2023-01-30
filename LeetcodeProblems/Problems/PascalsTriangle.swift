//
//  Pascal'sTriangle.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 07.01.2023.
//

import Foundation

struct PascalsTriangle {
    /// ✅ https://leetcode.com/problems/pascals-triangle/description/
    func generate(_ numRows: Int) -> [[Int]] {
        var result: [[Int]] = .init(repeating: [], count: numRows)
        for level in 0..<numRows {
            let count: Int = level + 1
            var array: [Int] = .init(repeating: 1, count: count)
            if level > 1 {
                for i in 1...level / 2 {
                    let value: Int = result[level - 1][i - 1] + result[level - 1][i]
                    array[i] = value
                    array[count - 1 - i] = value
                }
            }
            result[level] = array
        }
        return result
    }
    private struct Example {
        let numRows: Int
        let res: [[Int]]
    }
    func test() {
        let examples: [Example] = [
            .init(numRows: 1, res: [[1]]),
            .init(numRows: 2, res: [[1], [1, 1]]),
            .init(numRows: 3, res: [[1], [1, 1], [1,2,1]]),
            .init(numRows: 5, res: [[1], [1, 1], [1,2,1], [1,3,3,1], [1,4,6,4,1]]),
        ]
        for (i, ex) in examples.enumerated() {
            if generate(ex.numRows) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
