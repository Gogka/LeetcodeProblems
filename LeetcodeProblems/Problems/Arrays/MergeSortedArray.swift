//
//  MergeSortedArray.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 03.01.2023.
//

import Foundation
struct MergeSortedArray {
    /// ✅ https://leetcode.com/problems/merge-sorted-array/description/
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        let nums1Copy = Array(nums1[0..<m])
        var i = 0
        var j = 0
        var index = 0
        let elements = m + n
        while index < elements {
            if i < m, j >= n || nums1Copy[i] < nums2[j] {
                nums1[index] = nums1Copy[i]
                i += 1
            } else {
                nums1[index] = nums2[j]
                j += 1
            }
            index += 1
        }
    }
    func test() {
        // # 1
//        var nums1: [Int] = [1]
//        let m = 1
//        let nums2: [Int] = []
//        let n = 0
        // # 2
        var nums1: [Int] = [1,0]
        let m = 1
        let nums2: [Int] = [2]
        let n = 1
        merge(&nums1, m, nums2, n)
        print(nums1)
    }
}
