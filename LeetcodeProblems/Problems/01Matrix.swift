//
//  01Matrix.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 13.02.2023.
//

import Foundation

struct Matrix01 {
    /// ✅ https://leetcode.com/problems/01-matrix/description/
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        var result: [[Int]] = mat
        var passed: [[Bool]] = .init(repeating: .init(repeating: false, count: mat.first!.count), count: mat.count)
        var queue: DictionaryQueue<(Int, Int)> = []
        for i in 0..<mat.count {
            for j in 0..<mat[i].count {
                if mat[i][j] == 0 {
                    _ = queue.enqueue((i, j))
                    passed[i][j] = true
                }
            }
        }
        func process(row: Int, col: Int) {
            if row < 0 || row >= mat.count { return }
            if col < 0 || col >= mat.first!.count { return }
            if passed[row][col] { return }
            passed[row][col] = true
            _ = queue.enqueue((row, col))
        }
        var length: Int = 0
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let (row, col): (Int, Int) = queue.dequeue()!
                if result[row][col] != 0 {
                    result[row][col] = length
                }
                process(row: row + 1, col: col)
                process(row: row - 1, col: col)
                process(row: row, col: col + 1)
                process(row: row, col: col - 1)
            }
            length += 1
        }
        return result
    }
    struct Case {
        let mat: [[Int]]
        let result: [[Int]]
    }
    func test() {
        let cases: [Case] = [
            .init(mat: [[0,0,0],[0,1,0],[0,0,0]],
                  result: [[0,0,0],[0,1,0],[0,0,0]]),
            .init(mat: [[0,0,0],[0,1,0],[1,1,1]],
                  result: [[0,0,0],[0,1,0],[1,2,1]])
        ]
        for i in 0..<cases.count {
            let c: Case = cases[i]
            if updateMatrix(c.mat) != c.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
