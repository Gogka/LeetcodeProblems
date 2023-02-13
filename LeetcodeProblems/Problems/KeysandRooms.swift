//
//  KeysandRooms.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 13.02.2023.
//

import Foundation

struct KeysandRooms {
    /// ✅ https://leetcode.com/problems/keys-and-rooms/description/
    /// DFS
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var uniqueRooms: Set<Int> = []
        uniqueRooms.reserveCapacity(rooms.count)
        for i in 1..<rooms.count {
            uniqueRooms.insert(i)
        }
        func pass(internalRooms: [Int]) {
            for room in internalRooms where uniqueRooms.contains(room) {
                uniqueRooms.remove(room)
                pass(internalRooms: rooms[room])
            }
        }
        pass(internalRooms: rooms.first!)
        return uniqueRooms.isEmpty
    }
    /// BFS
//    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
//        var uniqueRooms: Set<Int> = []
//        uniqueRooms.reserveCapacity(rooms.count)
//        for i in 1..<rooms.count {
//            uniqueRooms.insert(i)
//        }
//        var queue: DictionaryQueue<[Int]> = [rooms.first!]
//        while !queue.isEmpty {
//            for _ in 0..<queue.count {
//                let keys: [Int] = queue.dequeue()!
//                for key in keys {
//                    if uniqueRooms.contains(key) {
//                        uniqueRooms.remove(key)
//                        _ = queue.enqueue(rooms[key])
//                    }
//                }
//            }
//            if uniqueRooms.isEmpty { return true }
//        }
//        return false
//    }
    struct Case {
        let rooms: [[Int]]
        let result: Bool
    }
    func test() {
        let cases: [Case] = [
            .init(rooms: [[1],[2],[3],[]], result: true),
            .init(rooms: [[1,3],[3,0,1],[2],[0]], result: false),
        ]
        for i in 0..<cases.count {
            let c: Case = cases[i]
            if canVisitAllRooms(c.rooms) != c.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
