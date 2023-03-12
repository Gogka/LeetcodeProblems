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
        0
    }
    struct TestCase {
        let nums: [Int]
        let k: Int
        let result: Int
    }
    func test() {
        let cases: [TestCase] = [
            
        ]
        for (i, tcase) in cases.enumerated() {
            if smallestDistancePair(tcase.nums, tcase.k) != tcase.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
