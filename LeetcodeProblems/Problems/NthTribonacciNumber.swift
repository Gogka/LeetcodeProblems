//
//  NthTribonacciNumber.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 19.03.2023.
//

import Foundation

final class NthTribonacciNumber {
    /// ✅ https://leetcode.com/problems/n-th-tribonacci-number/description/
    /// Bottom up
//    func tribonacci(_ n: Int) -> Int {
//        if n == 0 { return 0 }
//        if n < 3 { return 1 }
//        var trib: [Int] = [0, 1, 1]
//        for _ in 3...n {
//            let res: Int = trib[0] + trib[1] + trib[2]
//            trib[0] = trib[1]
//            trib[1] = trib[2]
//            trib[2] = res
//        }
//        return trib.last!
//    }
    /// Top bottom
    var memo: [Int: Int] = [:]
    func tribonacci(_ n: Int) -> Int {
        if n == 0 { return 0 }
        if n < 3 { return 1 }
        if let val: Int = memo[n] { return val }
        let val: Int = tribonacci(n - 1) + tribonacci(n - 2) + tribonacci(n - 3)
        memo[n] = val
        return val
    }
    struct TestCase {
        let n: Int
        let result: Int
    }
    func test() {
        let cases: [TestCase] = [
            .init(n: 4, result: 4),
            .init(n: 25, result: 1389537),
        ]
        for (i, tCase) in cases.enumerated() {
            memo = [:]
            if tribonacci(tCase.n) != tCase.result {
                print("Error in:", i)
                return
            }
        }
    }
}
