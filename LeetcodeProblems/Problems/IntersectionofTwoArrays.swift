//
//  IntersectionofTwoArrays.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 05.03.2023.
//

import Foundation

struct IntersectionofTwoArrays {
    /// ✅ https://leetcode.com/problems/intersection-of-two-arrays/description/
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var result: Set<Int> = []
        var passed: Set<Int> = []
        if nums1.count < nums2.count {
            for int in nums1 {
                passed.insert(int)
            }
            for int in nums2 {
                if passed.contains(int) {
                    result.insert(int)
                    if result.count == passed.count { break }
                }
            }
        } else {
            for int in nums2 {
                passed.insert(int)
            }
            for int in nums1 {
                if passed.contains(int) {
                    result.insert(int)
                    if result.count == passed.count { break }
                }
            }
        }
        return Array(result)
    }
    struct TestCase {
        let nums1: [Int]
        let nums2: [Int]
        let result: [Int]
    }
    func test() {
        let cases: [TestCase] = [
            .init(nums1: [1,2,2,1], nums2: [2,2], result: [2]),
            .init(nums1: [4,9,5], nums2: [9,4,9,8,4], result: [9,4]),
        ]
        for (i, tcase) in cases.enumerated() {
            if intersection(tcase.nums1, tcase.nums2) != tcase.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
