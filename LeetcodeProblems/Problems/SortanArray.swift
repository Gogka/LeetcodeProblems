//
//  SortanArray.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 10.01.2023.
//

import Foundation

/// [0,1,2,3,4,5,6]
struct SortanArray {
    /// ✅ https://leetcode.com/problems/sort-an-array/description/
    func sortArray(_ nums: [Int]) -> [Int] {
        if nums.count <= 1 { return nums }
        var copy: [Int] = nums
        heapify(&copy)
        var i: Int = nums.count - 1
        while i > 0 {
            copy.swapAt(0, i)
            heapifyDown(&copy, startFrom: 0, count: i)
            i -= 1
        }
        return copy
    }
    func heapify(_ nums: inout [Int]) {
        var i: Int = nums.count - 1
        while i >= 0 {
            heapifyDown(&nums, startFrom: i, count: nums.count)
            i -= 1
        }
    }
    func heapifyDown(_ nums: inout [Int], startFrom: Int, count: Int) {
        let getLeftChildIndex: (Int) -> Int = {
            $0 * 2 + 1
        }
        let hasLeftChildIndex: (Int) -> Bool = {
            getLeftChildIndex($0) < count
        }
        let getRightChildIndex: (Int) -> Int = {
            $0 * 2 + 2
        }
        let hasRightChildIndex: (Int) -> Bool = {
            getRightChildIndex($0) < count
        }
        var current: Int = startFrom
        while hasLeftChildIndex(current) {
            var largestIndex: Int = getLeftChildIndex(current)
            if hasRightChildIndex(current) {
                let rightIndex: Int = getRightChildIndex(current)
                if nums[rightIndex] > nums[largestIndex] {
                    largestIndex = rightIndex
                }
            }
            if nums[largestIndex] > nums[current] {
                nums.swapAt(largestIndex, current)
                current = largestIndex
            } else {
                return
            }
        }
    }
    private struct Example {
        let nums: [Int]
        let res: [Int]
    }
    func test() {
        let examples: [Example] = [
            .init(nums: [2,0,2,1,1,0], res: [0,0,1,1,2,2]),
            .init(nums: [2,0,1], res: [0,1,2]),
            .init(nums: [1,2,0], res: [0,1,2])
        ]
        for (i, ex) in examples.enumerated() {
            if sortArray(ex.nums) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
