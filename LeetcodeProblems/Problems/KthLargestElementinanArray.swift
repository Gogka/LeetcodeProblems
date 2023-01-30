//
//  KthLargestElementinanArray.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 11.01.2023.
//

import Foundation

struct KthLargestElementinanArray {
    /// ✅ https://leetcode.com/problems/kth-largest-element-in-an-array/description/
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        if k > (nums.count / 2) {
            var heap: Heap<Int> = .maxHeap()
            var count: Int = 0
            for i in 0..<nums.count {
                heap.add(nums[i])
                count += 1
                if count > nums.count - k + 1 {
                    _ = heap.poll()
                    count -= 1
                }
            }
            return heap.peek()!
        } else {
            var heap: Heap<Int> = .minHeap()
            var count: Int = 0
            for i in 0..<nums.count {
                heap.add(nums[i])
                count += 1
                if count > k {
                    _ = heap.poll()
                    count -= 1
                }
            }
            return heap.peek()!
        }
    }
    private struct Example {
        let nums: [Int]
        let k: Int
        let res: Int
    }
    func test() {
        let examples: [Example] = [
            .init(nums: [3,2,1,5,6,4], k: 2, res: 5),
            .init(nums: [3,2,3,1,2,4,5,5,6], k: 7, res: 2),
        ]
        for (i, ex) in examples.enumerated() {
            if findKthLargest(ex.nums, ex.k) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
