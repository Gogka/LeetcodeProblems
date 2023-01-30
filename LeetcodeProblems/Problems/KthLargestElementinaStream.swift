//
//  KthLargestElementinaStream.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 14.01.2023.
//

import Foundation

struct KthLargestElementinaStream {
    /// ✅ https://leetcode.com/problems/kth-largest-element-in-a-stream/description/
    class KthLargest {
        private var heap: Heap<Int> = .minHeap()
        private var count: Int
        private let k: Int
        init(_ k: Int, _ nums: [Int]) {
            var count: Int = 0
            for num in nums {
                heap.add(num)
                if count == k {
                    _ = heap.poll()
                } else {
                    count += 1
                }
            }
            self.k = k
            self.count = count
        }
        func add(_ val: Int) -> Int {
            heap.add(val)
            if count == k {
                _ = heap.poll()
            } else {
                count += 1
            }
            return heap.peek()!
        }
    }
}
