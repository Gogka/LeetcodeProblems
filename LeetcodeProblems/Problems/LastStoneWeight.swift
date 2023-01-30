//
//  LastStoneWeight.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 14.01.2023.
//

import Foundation

struct LastStoneWeight {
    /// ✅ https://leetcode.com/problems/last-stone-weight/description/
    func lastStoneWeight(_ stones: [Int]) -> Int {
        if stones.count == 1 { return stones.first! }
        var copy: [Int] = stones
        var heap: Heap<Int> = .maxHeap(elements: &copy, heapifyNeeded: true)
        while heap.count > 1 {
            let heaviest: Int = heap.poll()!
            let lighter: Int = heap.poll()!
            if heaviest != lighter {
                heap.add(heaviest - lighter)
            }
        }
        return heap.peek() ?? 0
    }
    private struct Example {
        let nums: [Int]
        let res: Int
    }
    func test() {
        let examples: [Example] = [
            .init(nums: [2,7,4,1,8,1], res: 1),
            .init(nums: [1], res: 1),
            .init(nums: [3,7,2], res: 2)
        ]
        for (i, ex) in examples.enumerated() {
            if lastStoneWeight(ex.nums) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
