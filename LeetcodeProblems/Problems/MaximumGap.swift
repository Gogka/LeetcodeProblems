//
//  MaximumGap.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 12.01.2023.
//

import Foundation

struct MaximumGap {
    /// ✅ https://leetcode.com/problems/maximum-gap/description/
    func maximumGap(_ nums: [Int]) -> Int {
        if nums.count < 2 { return 0 }
        var copy: [Int] = nums
        var heap: Heap<Int> = .minHeap(elements: &copy, heapifyNeeded: true)
        var maxDif: Int = 0
        var prev: Int = heap.poll()!
        var diff: Int = 0
        while !heap.isEmpty {
            let tmpPrev: Int = heap.poll()!
            diff = tmpPrev - prev
            maxDif = max(maxDif, diff)
            prev = tmpPrev
        }
        return maxDif
    }
    private struct Example {
        let nums: [Int]
        let res: Int
    }
    func test() {
        let examples: [Example] = [
            .init(nums: [1,3,5,6], res: 2),
            .init(nums: [3,6,9,1], res: 3),
            .init(nums: [10], res: 0)
        ]
        for (i, ex) in examples.enumerated() {
            if maximumGap(ex.nums) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
