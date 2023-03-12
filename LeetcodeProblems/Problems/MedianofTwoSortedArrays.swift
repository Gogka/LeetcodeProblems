//
//  MedianofTwoSortedArrays.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 09.03.2023.
//

import Foundation

struct MedianofTwoSortedArrays {
    /// ✅ https://leetcode.com/problems/median-of-two-sorted-arrays/description/
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let bigger: [Int]
        let smaller: [Int]
        if nums1.count > nums2.count {
            bigger = nums1
            smaller = nums2
        } else {
            bigger = nums2
            smaller = nums1
        }
        var left: Int = 0
        var right: Int = smaller.count - 1
        let total: Int = nums1.count + nums2.count
        let half: Int = total / 2
        while true {
            let smallerMidIndex: Int = left + right < 0 ? left + right : (left + right) / 2
            let biggerMidIndex: Int = half - smallerMidIndex - 2
            
            let smallerLeft: Int = smallerMidIndex >= 0 ? smaller[smallerMidIndex] : .min
            let smallerRight: Int = smallerMidIndex + 1 < smaller.count ? smaller[smallerMidIndex + 1] : .max
            let biggerLeft: Int = biggerMidIndex >= 0 ? bigger[biggerMidIndex] : .min
            let biggerRight: Int = biggerMidIndex + 1 < bigger.count ? bigger[biggerMidIndex + 1] : .max
            if smallerLeft <= biggerRight && biggerLeft <= smallerRight {
                if total % 2 == 0 {
                    return Double(max(smallerLeft, biggerLeft) + min(smallerRight, biggerRight)) / 2
                } else {
                    return Double(min(smallerRight, biggerRight))
                }
            } else if smallerLeft > biggerRight {
                right = smallerMidIndex - 1
            } else {
                left = smallerMidIndex + 1
            }
        }
    }
    struct TestCase {
        let nums1: [Int]
        let nums2: [Int]
        let result: Double
    }
    func test() {
        let cases: [TestCase] = [
            .init(nums1: [], nums2: [1], result: 1),
//            .init(nums1: [1,2,2,2], nums2: [1,4,4,4,5,6,7,8], result: 2),
//            .init(nums1: [1,2,2,2,5,6], nums2: [1,4,4,4,5,6,7,8], result: 2),
            .init(nums1: [1,3], nums2: [2], result: 2),
            .init(nums1: [1,2], nums2: [3,4], result: 2.5),
            .init(nums1: [1,3,4,5,6,7,8,9,10], nums2: [1,2,3,4,5], result: 4.5)
        ]
        for (i, tcase) in cases.enumerated() {
            if findMedianSortedArrays(tcase.nums1, tcase.nums2) != tcase.result {
                print("Error in \(i)")
//                return
            }
        }
    }
}
