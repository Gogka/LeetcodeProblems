//
//  TopKFrequentElements.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 12.01.2023.
//

import Foundation

struct TopKFrequentElements {
    final class Bucket<T>: CustomStringConvertible {
        var description: String { elements.description }
        fileprivate var elements: [T]
        init(el: T) {
            elements = [el]
        }
        func append(_ element: T) {
            elements.append(element)
        }
    }
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var counts: [Int: Int] = [:]
        /// Calculate frequency of the elements
        var maxCount: Int = 0
        for i in 0..<nums.count {
            counts[nums[i], default: 0] += 1
            maxCount = max(maxCount, counts[nums[i]]!)
        }
        var sorted: [Bucket<Int>?] = .init(repeating: nil, count: maxCount)
        for (key, value) in counts {
            if let buck: Bucket<Int> = sorted[value - 1] {
                buck.append(key)
            } else {
                sorted[value - 1] = .init(el: key)
            }
        }
        var result: [Int] = .init(repeating: 0, count: k)
        var currentSortedIndex: Int = sorted.count - 1
        var i: Int = 0
        while true {
            while currentSortedIndex >= 0, sorted[currentSortedIndex] == nil {
                currentSortedIndex -= 1
            }
            let bucket: Bucket<Int> = sorted[currentSortedIndex]!
            var j: Int = 0
            while i < k && j < bucket.elements.count  {
                result[i] = bucket.elements[j]
                i += 1
                j += 1
            }
            if i == k { return result }
            currentSortedIndex -= 1
        }
    }
    private struct Example {
        let nums: [Int]
        let k: Int
        let res: [Int]
    }
    func test() {
        let examples: [Example] = [
            .init(nums: [1,1,1,2,2,3], k: 2, res: [1, 2]),
            .init(nums: [1], k: 1, res: [1]),
            .init(nums: [1,2], k: 2, res: [1, 2]),
        ]
        for (i, ex) in examples.enumerated() {
            if topKFrequent(ex.nums, ex.k) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
