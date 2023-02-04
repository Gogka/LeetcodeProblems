//
//  MinimumCosttoConnectSticks.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 31.01.2023.
//

import Foundation

struct MinimumCosttoConnectSticks {
    /// ✅ https://leetcode.com/problems/minimum-cost-to-connect-sticks/description/
    func connectSticks(_ sticks: [Int]) -> Int {
        if sticks.count < 2 { return 0 }
        var result: Int = 0
        var copy: [Int] = sticks
        var heap: Heap<Int> = .minHeap(elements: &copy, heapifyNeeded: true)
        while heap.count > 1 {
            let cost: Int = heap.poll()! + heap.poll()!
            result += cost
            heap.add(cost)
        }
        return result
    }
    private struct Example {
        let sticks: [Int]
        let res: Int
    }
    func test() {
        let examples: [Example] = [
            .init(sticks: [2,4,3], res: 14),
            .init(sticks: [1,8,3,5], res: 30),
            .init(sticks: [5], res: 0)
        ]
        for (i, ex) in examples.enumerated() {
            if connectSticks(ex.sticks) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
