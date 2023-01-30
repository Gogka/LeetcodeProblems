//
//  NumberofIslands.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 05.01.2023.
//

import Foundation

struct NumberOfIslands {
    /// ✅ https://leetcode.com/problems/number-of-islands/description/
    func numIslands(_ grid: [[Character]]) -> Int {
        if grid.isEmpty { return 0 }
        var islands: Int = 0
        let m: Int = grid.count
        let n: Int = grid.first!.count
        var passed: [[Bool]] = .init(repeating: .init(repeating: false, count: n), count: m)
        let canPass: (Int, Int) -> Bool = {
            if $0 < 0 || $0 >= m || $1 < 0 || $1 >= n { return false }
            if passed[$0][$1] { return false }
            passed[$0][$1] = true
            return true
        }
        for i in 0..<m {
            for j in 0..<n {
                guard canPass(i, j), grid[i][j] == "1" else { continue }
                var islandSquare: [(Int, Int)] = [(i, j)]
                let appendTileIfNeeded: (Int, Int) -> Void = {
                    if canPass($0, $1), grid[$0][$1] == "1" {
                        islandSquare.append(($0, $1))
                    }
                }
                while !islandSquare.isEmpty {
                    for _ in 0..<islandSquare.count {
                        let (x, y): (Int, Int) = islandSquare.removeFirst()
                        /// Right
                        appendTileIfNeeded(x + 1, y)
                        /// Left
                        appendTileIfNeeded(x - 1, y)
                        /// Bottom
                        appendTileIfNeeded(x, y + 1)
                        /// Top
                        appendTileIfNeeded(x, y - 1)
                    }
                }
                islands += 1
            }
        }
        return islands
    }
    private struct Example {
        let grid: [[Character]]
        let count: Int
    }
    func test() {
        let examples: [Example] = [
            .init(
                grid: [
                    ["1","1","1","1","0"],
                    ["1","1","0","1","0"],
                    ["1","1","0","0","0"],
                    ["0","0","0","0","0"]
                ],
                count: 1),
            .init(
                grid: [
                    ["1","1","0","0","0"],
                    ["1","1","0","0","0"],
                    ["0","0","1","0","0"],
                    ["0","0","0","1","1"]
                ],
                count: 3),
            .init(
                grid: [
                    ["1"],
                    ["1"],
                ],
                count: 1),
            .init(
                grid: [
                    ["1","0","1","1","1"],
                    ["1","0","1","0","1"],
                    ["1","1","1","0","1"]],
                count: 1)
        ]
        for (i, ex) in examples.enumerated() {
            if numIslands(ex.grid) != ex.count {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
