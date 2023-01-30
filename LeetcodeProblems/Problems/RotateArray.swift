//
//  RotateArray.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 08.01.2023.
//

import Foundation

struct RotateArray {
    /// ✅ https://leetcode.com/problems/rotate-array/description/
    func rotate(_ nums: inout [Int], _ k: Int) {
        if nums.count <= 1 { return }
        /// 1
//        let copy: [Int] = nums
//        for i in 0..<nums.count {
//            nums[(i + k) % (nums.count)] = copy[i]
//        }
        /// 2
        var k = k % nums.count
        var i: Int = 1
        var prev: Int = 0
        var newPrev: Int = 0
        while k > 0 {
            prev = nums[0]
            while i <= nums.count {
                newPrev = nums[i % nums.count]
                nums[i % nums.count] = prev
                prev = newPrev
                 i += 1
            }
            i = 1
            k -= 1
        }
    }
    private final class Example {
        var nums: [Int]
        let k: Int
        let res: [Int]
        init(nums: [Int], k: Int, res: [Int]) {
            self.nums = nums
            self.k = k
            self.res = res
        }
    }
    func test() {
        let examples: [Example] = [
            .init(nums: [1,2,3,4,5,6,7], k: 3, res: [5,6,7,1,2,3,4]),
            .init(nums: [-1,-100,3,99], k: 2, res: [3,99,-1,-100]
)
        ]
        for (i, ex) in examples.enumerated() {
            rotate(&ex.nums, ex.k)
            if ex.nums != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
