//
//  ClimbingStairs.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 16.02.2023.
//

import Foundation

final class ClimbingStairs {
    /// ✅ https://leetcode.com/problems/climbing-stairs/description/
    var saved: [Int: Int] = [:]
    func climbStairs(_ n: Int) -> Int {
        if n <= 2 { return n }
        if let res = saved[n] { return res }
        let result: Int = climbStairs(n - 1)
        saved[n - 1] = result
        return climbStairs(n - 2) + result
    }
//    func climbStairs(_ n: Int) -> Int {
//        if n < 2 { return 1 }
//        var result: Int = 1
//        var prev: Int = 1
//        for _ in 1..<n {
//            let oldRes: Int = result
//            result += prev
//            prev = oldRes
//        }
//        return result
//    }
    /// [1,1,1,1,1,1]
    /// [1,1,1,1,2] [1,1,1,2,1] [1,1,2,1,1] [1,2,1,1,1] [2,1,1,1,1]
    /// [1,1,2,2] [1,2,1,2] [2,1,1,2] [2,1,2,1] [2,2,1,1] [1,2,2,1]
    /// [2,2,2]
    struct Case {
        let n: Int
        let result: Int
    }
    func test() {
        let cases: [Case] = [
//            .init(n: 2, result: 2),
//            .init(n: 3, result: 3),
            .init(n: 7, result: 21),
            .init(n: 35, result: 14930352)
        ]
        for (i, testCase) in cases.enumerated() {
            if climbStairs(testCase.n) != testCase.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
