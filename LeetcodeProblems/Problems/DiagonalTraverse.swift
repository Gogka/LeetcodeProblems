//
//  DiagonalTraverse.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 06.01.2023.
//

import Foundation

struct DiagonalTraverse {
    /// ✅ https://leetcode.com/problems/diagonal-traverse/description/
    func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
        if mat.isEmpty { return [] }
        let m: Int = mat.count
        let n: Int = mat.first!.count
        let targetCount: Int = m * n
        var result: [Int] = .init(repeating: 0, count: targetCount)
        var currentIndex: Int = 0
        var iDirection: Int = -1
        var jDirection: Int = 1
        var i: Int = 0
        var j: Int = 0
        repeat {
            result[currentIndex] = mat[i][j]
            currentIndex += 1
            if i + iDirection < 0 || i + iDirection >= m {
                iDirection = -iDirection
                if j + 1 >= 0 && j + 1 < n {
                    j += 1
                } else {
                    i += 1
                }
                jDirection = -jDirection
                continue
            }
            if j + jDirection < 0 || j + jDirection >= n {
                jDirection = -jDirection
                if i + 1 >= 0 && i + 1 < m {
                    i += 1
                } else {
                    j += 1
                }
                iDirection = -iDirection
                continue
            }
            j += jDirection
            i += iDirection
        } while currentIndex < targetCount
        return result
    }
    private struct Example {
        let nums: [[Int]]
        let res: [Int]
    }
    func test() {
        let examples: [Example] = [
            .init(
                nums: [
                    [1,2,3],
                    [4,5,6],
                    [7,8,9]],
                res: [1,2,4,7,5,3,6,8,9]),
            .init(
                nums: [
                    [1,2],
                    [3,4]
                ],
                res: [1,2,3,4]),
            .init(
                nums: [
                    [1],
                ],
                res: [1]),
        .init(
            nums: [
                [6,9,7],
            ],
            res: [6,9,7]),
        ]
        for (i, ex) in examples.enumerated() {
            if findDiagonalOrder(ex.nums) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
