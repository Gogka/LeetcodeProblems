//
//  Sqrtx.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 28.02.2023.
//

import Foundation

struct Sqrtx {
    /// ✅ https://leetcode.com/problems/sqrtx/description/
    func mySqrt(_ x: Int) -> Int {
        if x < 2 { return x }
        var min: Int = 0
        var max: Int = x
        while min <= max {
            let nextMin: Int = (max + min) / 2
            let square: Int = nextMin * nextMin
            if square == x {
                return nextMin
            } else if square < x {
                if min == nextMin { return nextMin }
                min = nextMin
            } else {
                if max == nextMin { return min }
                max = nextMin
            }
        }
        return min
    }
    struct TestCase {
        let x: Int
        let result: Int
    }
    func test() {
        let cases: [TestCase] = [
            .init(x: 0, result: 0),
            .init(x: 1, result: 1),
            .init(x: 3, result: 1),
            .init(x: 5, result: 2),
            .init(x: 4, result: 2),
            .init(x: 8, result: 2),
            .init(x: 9, result: 3),
            .init(x: 10, result: 3),
            .init(x: 11, result: 3),
            .init(x: 15, result: 3),
            .init(x: 16, result: 4),
        ]
        for (i, tcase) in cases.enumerated() {
            if mySqrt(tcase.x) != tcase.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
