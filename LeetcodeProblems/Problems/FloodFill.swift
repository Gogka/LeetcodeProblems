//
//  FloodFill.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 13.02.2023.
//

import Foundation

struct FloodFill {
    /// ✅ https://leetcode.com/problems/flood-fill/description/
    /// DFS
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        var result: [[Int]] = image
        let replacingColor: Int = result[sr][sc]
        func replace(row: Int, column: Int) {
            if row >= result.count || row < 0 { return }
            if column >= result.first!.count || column < 0 { return }
            if result[row][column] == replacingColor && result[row][column] != color {
                result[row][column] = color
                replace(row: row + 1, column: column)
                replace(row: row - 1, column: column)
                replace(row: row, column: column + 1)
                replace(row: row, column: column - 1)
            }
        }
        replace(row: sr, column: sc)
        return result
    }
    /// BFS
//    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
//        var result: [[Int]] = image
//        let replacingColor: Int = result[sr][sc]
//        var queue: DictionaryQueue<(Int, Int)> = []
//        func enque(row: Int, column: Int) {
//            if row >= result.count || row < 0 { return }
//            if column >= result.first!.count || column < 0 { return }
//            if result[row][column] == replacingColor && result[row][column] != color {
//                _ = queue.enqueue((row, column))
//            }
//        }
//        enque(row: sr, column: sc)
//        while !queue.isEmpty {
//            for _ in 0..<queue.count {
//                let (row, column): (Int, Int) = queue.dequeue()!
//                result[row][column] = color
//                enque(row: row + 1, column: column)
//                enque(row: row - 1, column: column)
//                enque(row: row, column: column + 1)
//                enque(row: row, column: column - 1)
//            }
//        }
//        return result
//    }
    struct Case {
        let image: [[Int]]
        let sr: Int
        let sc: Int
        let color: Int
        let result: [[Int]]
    }
    func test() {
        let cases: [Case] = [
            .init(image: [[1,1,1],
                          [1,1,0],
                          [1,0,1]],
                  sr: 1,
                  sc: 1,
                  color: 2,
                  result: [[2,2,2],[2,2,0],[2,0,1]]),
            .init(image: [[0,0,0],[0,0,0]],
                  sr: 0,
                  sc: 0,
                  color: 0,
                  result: [[0,0,0],[0,0,0]])
        ]
        for i in 0..<cases.count {
            let c: Case = cases[i]
            if floodFill(c.image, c.sr, c.sc, c.color) != c.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
