//
//  SpiralMatrix.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 07.01.2023.
//

import Foundation

struct SpiralMatrix {
    /// ✅ https://leetcode.com/problems/spiral-matrix/description/
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        if matrix.isEmpty { return [] }
        let m: Int = matrix.count
        let n: Int = matrix.first!.count
        var result: [Int] = .init(repeating: 0, count: m * n)
        var topBorder: Int = 0
        var botBorder: Int = m
        var leftBorder: Int = -1
        var rightBorder: Int = n
        var i: Int = 0
        var j: Int = 0
        var iDirection: Int = 0
        var jDirection: Int = 1
        for index in 0..<m * n {
            result[index] = matrix[i][j]
            if jDirection != 0 {
                if j + jDirection >= rightBorder {
                    rightBorder -= 1
                    jDirection = 0
                    iDirection = 1
                } else if j + jDirection <= leftBorder {
                    leftBorder += 1
                    jDirection = 0
                    iDirection = -1
                }
            }
            if iDirection != 0 {
                if i + iDirection >= botBorder {
                    botBorder -= 1
                    iDirection = 0
                    jDirection = -1
                } else if i + iDirection <= topBorder {
                    topBorder += 1
                    iDirection = 0
                    jDirection = 1
                }
            }
            i += iDirection
            j += jDirection
        }
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
                res: [1,2,3,6,9,8,7, 4,5]),
            .init(
                nums: [
                    [1,2],
                    [3,4]
                ],
                res: [1,2,4,3]),
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
            .init(
                nums: [
                    [1,2,3,4],
                    [5,6,7,8],
                    [9,10,11,12],
                    [13,14,15,16]
                ],
                res: [1,2,3,4,8,12,16,15,14,13,9,5,6,7,11,10])
        ]
        for (i, ex) in examples.enumerated() {
            if spiralOrder(ex.nums) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
