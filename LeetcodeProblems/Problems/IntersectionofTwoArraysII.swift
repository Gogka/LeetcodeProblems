//
//  IntersectionofTwoArraysII.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 05.03.2023.
//

import Foundation
struct IntersectionofTwoArraysII {
    /// ✅ https://leetcode.com/problems/intersection-of-two-arrays/description/
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let nums1S: [Int] = nums1.sorted()
        let nums2S: [Int] = nums2.sorted()
        var result: [Int] = []
        var i: Int = 0
        var j: Int = 0
        while true {
            if i == nums1S.count { break }
            if j == nums2S.count { break }
            if nums1S[i] == nums2S[j] {
                result.append(nums1S[i])
                i += 1
                j += 1
            } else if nums1S[i] > nums2S[j] {
                j += 1
            } else {
                i += 1
            }
        }
        return result
    }
//    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
//        var result: [Int] = []
//        var passed: Set<Int> = []
//        var count: [Int: Int] = [:]
//        if nums1.count < nums2.count {
//            for int in nums1 {
//                passed.insert(int)
//                count[int] = count[int, default: 0] + 1
//            }
//            for int in nums2 {
//                if passed.contains(int) {
//                    if count[int].map({ $0 > 0}) ?? false {
//                        result.append(int)
//                        count[int]! -= 1
//                    }
//                }
//            }
//        } else {
//            for int in nums2 {
//                passed.insert(int)
//                count[int] = count[int, default: 0] + 1
//            }
//            for int in nums1 {
//                if passed.contains(int) {
//                    if count[int].map({ $0 > 0}) ?? false {
//                        result.append(int)
//                        count[int]! -= 1
//                    }
//                }
//            }
//        }
//        return result
//    }
    struct TestCase {
        let nums1: [Int]
        let nums2: [Int]
        let result: [Int]
    }
    func test() {
        let cases: [TestCase] = [
//            .init(nums1: [1,2,2,1], nums2: [2,2], result: [2,2]),
            .init(nums1: [4,9,5], nums2: [9,4,9,8,4], result: [9,4]),
        ]
        for (i, tcase) in cases.enumerated() {
            if intersect(tcase.nums1, tcase.nums2) != tcase.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
