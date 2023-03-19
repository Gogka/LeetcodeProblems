//
//  FindKthSmallestPairDistance.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 12.03.2023.
//

import Foundation

struct FindKthSmallestPairDistance {
    /// https://leetcode.com/problems/find-k-th-smallest-pair-distance/description/
    func smallestDistancePair(_ nums: [Int], _ k: Int) -> Int {
        var counter: Int = 1
        var pairsCount: Int = nums.count - 1
        var target: Int = pairsCount
        while target < k {
            pairsCount -= 1
            target += pairsCount
            counter += 1
        }
        let newK: Int = k - (target - pairsCount)
        let sorted: [Int] = nums.sorted()
        var heap: Heap<Int> = .maxHeap()
        for i in 0..<sorted.count - counter {
            heap.add(abs(sorted[i] - sorted[i + counter]))
            if heap.count > newK {
                heap.poll()
            }
        }
        return heap.peek()!
    }
//    func smallestDistancePair(_ nums: [Int], _ k: Int) -> Int {
//        var heap: Heap<Int> = .maxHeap()
//        for i in 0..<nums.count - 1 {
//            for j in (i + 1)..<nums.count {
//                heap.add(abs(nums[j] - nums[i]))
//                if heap.count > k {
//                    heap.poll()
//                }
//            }
//        }
//        return heap.peek()!
//    }
    struct TestCase {
        let nums: [Int]
        let k: Int
        let result: Int
    }
    func test() {
        let cases: [TestCase] = [
            .init(nums: [1,3,5,7], k: 1, result: 2),
            .init(nums: [1,3,5,7], k: 2, result: 2),
            .init(nums: [1,3,5,7], k: 3, result: 2),
            .init(nums: [1,3,5,7], k: 4, result: 4),
            .init(nums: [1,3,5,7], k: 5, result: 4),
            .init(nums: [1,3,1], k: 1, result: 0),
            .init(nums: [1,1,1], k: 2, result: 0),
            .init(nums: [1,6,1], k: 3, result: 5),
        ]
        for (i, tcase) in cases.enumerated() {
            if smallestDistancePair(tcase.nums, tcase.k) != tcase.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
