//
//  WallsandGates.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 05.02.2023.
//

import Foundation

struct WallsandGates {
    /// ✅ https://leetcode.com/problems/walls-and-gates/description/
    func wallsAndGates(_ rooms: inout [[Int]]) {
        var queue: DictionaryQueue<(Int, Int)> = .init()
        for i in 0..<rooms.count {
            for j in 0..<rooms[i].count where rooms[i][j] == 0 {
                _ = queue.enqueue((i, j))
            }
        }
        func insertMove(i: Int, j: Int, step: Int) {
            if i >= rooms.count || i < 0 { return }
            if j >= rooms.first!.count || j < 0 { return }
            let currentDistance: Int = rooms[i][j]
            if currentDistance != Int32.max { return }
            rooms[i][j] = step
            _ = queue.enqueue((i, j))
        }
        while let (i, j): (Int, Int) = queue.dequeue() {
            let step: Int = rooms[i][j] + 1
            /// Top
            insertMove(i: i - 1, j: j, step: step)
            /// Left
            insertMove(i: i, j: j - 1, step: step)
            /// Right
            insertMove(i: i, j: j + 1, step: step)
            /// Bottom
            insertMove(i: i + 1, j: j, step: step)
        }
    }
//    func wallsAndGates(_ rooms: inout [[Int]]) {
//        for i in 0..<rooms.count {
//            for j in 0..<rooms[i].count where rooms[i][j] == 0 {
//                var movements: DictionaryQueue<(i: Int, j: Int)> = [(i, j)]
//                updateDistances(step: 1, movements: &movements, rooms: &rooms)
//            }
//        }
//    }
//    func updateDistances(step: Int,
//                         movements: inout DictionaryQueue<(i: Int, j: Int)>,
//                         rooms: inout [[Int]]) {
//        if movements.isEmpty { return }
//        func insertMove(i: Int, j: Int) {
//            if i >= rooms.count || i < 0 { return }
//            if j >= rooms.first!.count || j < 0 { return }
//            let currentDistance: Int = rooms[i][j]
//            if currentDistance == -1 || currentDistance == 0 { return }
//            if step < rooms[i][j] {
//                rooms[i][j] = step
//                _ = movements.enqueue((i, j))
//            }
//        }
//        for _ in 0..<movements.count {
//            let (i, j): (Int, Int) = movements.dequeue()!
//            /// Top
//            insertMove(i: i - 1, j: j)
//            /// Left
//            insertMove(i: i, j: j - 1)
//            /// Right
//            insertMove(i: i, j: j + 1)
//            /// Bottom
//            insertMove(i: i + 1, j: j)
//        }
//        updateDistances(step: step + 1, movements: &movements, rooms: &rooms)
//    }
    struct Case {
        let rooms: [[Int]]
        let result: [[Int]]
    }
    func test() {
        let cases: [Case] = [
            .init(
                rooms: [
                    [2147483647,-1,0,2147483647],
                    [2147483647,2147483647,2147483647,-1],
                    [2147483647,-1,2147483647,-1],
                    [0,-1,2147483647,2147483647]

                ],
                result: [
                    [3,-1,0,1],
                    [2,2,1,-1],
                    [1,-1,2,-1],
                    [0,-1,3,4]
                ]),
            .init(
                rooms: [
                    [2147483647,0,2147483647,2147483647,0,2147483647,-1,2147483647]
                ],
                result: [
                    [1,0,1,1,0,1,-1,2147483647]
                ])
        ]
        for (i, c) in cases.enumerated() {
            var rooms: [[Int]] = c.rooms
            wallsAndGates(&rooms)
            if rooms != c.result {
                print("Error in \(i).")
                return
            }
        }
    }
}
