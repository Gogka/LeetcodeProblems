//
//  ValidPerfectSquare.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 05.03.2023.
//

import Foundation

struct ValidPerfectSquare {
    /// ✅ https://leetcode.com/problems/valid-perfect-square/description/
    func isPerfectSquare(_ num: Int) -> Bool {
        if num < 2 { return true }
        var leftVal: Int = 1
        var rightVal: Int = num / 2
        while leftVal < rightVal {
            let mid: Int = (rightVal + leftVal) / 2
            let square: Int = mid * mid
            if square == num {
                return true
            } else if square < num {
                leftVal = mid + 1
            } else {
                rightVal = mid
            }
        }
        return leftVal * leftVal == num
    }
    struct TestCase {
        let num: Int
        let result: Bool
    }
    func test() {
        let cases: [TestCase] = [
            .init(num: 4, result: true),
            .init(num: 16, result: true),
            .init(num: 1, result: true),
            .init(num: 5, result: false),
            .init(num: 9, result: true),
            .init(num: 121, result: true),
            .init(num: 130, result: false),
        ]
        for (i, tcase) in cases.enumerated() {
            if isPerfectSquare(tcase.num) != tcase.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
