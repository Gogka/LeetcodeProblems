//
//  SquaresofaSortedArray.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 03.01.2023.
//

import Foundation

struct SquaresofaSortedArray {
    /// ✅ https://leetcode.com/problems/squares-of-a-sorted-array/description/
    func sortedSquares(_ nums: [Int]) -> [Int] {
        guard !nums.isEmpty else { return nums }
        var startIndex: Int = 0
        var endIndex: Int = nums.count - 1
        var result: [Int] = nums
        var index: Int = endIndex
        while index >= 0 {
            if abs(nums[startIndex]) > abs(nums[endIndex]) {
                result[index] = nums[startIndex] * nums[startIndex]
                startIndex += 1
            } else {
                result[index] = nums[endIndex] * nums[endIndex]
                endIndex -= 1
            }
            index -= 1
        }
        return result
    }
    func test() {
        [
            [-4,-1,0,3,10],
            [-7,-3,2,3,11]
        ].forEach {
            print(sortedSquares($0))
        }
    }
}
