//
//  PascalsTriangleII.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 08.01.2023.
//

import Foundation

struct PascalsTriangleII {
    /// ✅ https://leetcode.com/problems/pascals-triangle-ii/description/
    func getRow(_ rowIndex: Int) -> [Int] {
        var result: [Int] = .init(repeating: 1, count: rowIndex + 1)
        guard rowIndex > 1 else { return result }
        var currentRow: Int = 2
        var previousValue: Int = 1
        var tmp: Int = 0
        while currentRow <= rowIndex {
            for i in 1...currentRow / 2 {
                tmp = result[i]
                result[i] = previousValue + result[i]
                result[currentRow - i] = result[i]
                previousValue = tmp
            }
            previousValue = 1
            currentRow += 1
        }
        return result
    }
    private struct Example {
        let numRows: Int
        let res: [Int]
    }
    func test() {
        let examples: [Example] = [
            .init(numRows: 1, res: [1,1]),
            .init(numRows: 2, res: [1,2,1]),
            .init(numRows: 3, res: [1,3,3,1]),
            .init(numRows: 4, res: [1,4,6,4,1]),
        ]
        for (i, ex) in examples.enumerated() {
            if getRow(ex.numRows) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
