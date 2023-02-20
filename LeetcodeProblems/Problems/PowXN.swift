//
//  PowXN.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 20.02.2023.
//

import Foundation
final class PowXN {
    /// ✅ https://leetcode.com/problems/powx-n/description/
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n > 0 {
            return pow(x: x, n: n)
        } else {
            return pow(x: 1/x, n: -n)
        }
    }
    func pow(x: Double, n: Int) -> Double {
        if n == 0 { return 1 }
        var result: Double = pow(x: x, n: n / 2)
        result *= result
        if n % 2 == 0 {
            return result
        } else {
            return result * x
        }
    }
//    func myPow(_ x: Double, _ n: Int) -> Double {
//        if n == 0 { return 1 }
//        let newN: Int = abs(n)
//        let multiplier: Double = n > 0 ? x : 1/x
//        var result: Double = multiplier
//        var currentPower: Int = 1
//        while currentPower * 2 <= newN {
//            result *= result
//            currentPower *= 2
//        }
//        if currentPower == n { return result }
//        for _ in currentPower..<newN {
//            result *= multiplier
//        }
//        return result
//    }
//    func myPow(_ x: Double, _ n: Int) -> Double {
//        let multiplier: Double = n > 0 ? x : 1/x
//        var result: Double = 1
//        for _ in 0..<abs(n) / 2 {
//            result *= multiplier
//        }
//        if n % 2 == 0 {
//            return result * result
//        } else {
//            return result * result * multiplier
//        }
//    }
//    func myPow(_ x: Double, _ n: Int) -> Double {
//        if n == 0 { return 1 }
//        if x == 1 { return 1 }
//        if x == 0 { return 0 }
//        if x == -1 { return n % 2 == 0 ? 1 : -1 }
//        if n > 0 {
//            return myPow2(current: x, x, n - 1)
//        } else {
//            return myPow2(current: 1/x, x, n + 1)
//        }
//    }
//    func myPow2(current: Double, _ x: Double, _ n: Int) -> Double {
//        if n == 0 { return current }
//        let result: Double
//        if n > 0 {
//            let newCurrent: Double = current * x
//            if abs(newCurrent) < 0.00001 { return 0 }
//            result = myPow2(current: newCurrent, x, n - 1)
//        } else {
//            let newCurrent: Double = current * 1/x
//            if abs(newCurrent) < 0.00001 { return 0 }
//            result = myPow2(current: newCurrent, x, n + 1)
//        }
//        return result
//    }
    struct TestCase {
        let x: Double
        let n: Int
        let result: Double
    }
    func test() {
//        print(pow(Decimal(34.00515), -3))
        let cases: [TestCase] = [
//            .init(x: 2, n: 2, result: 4),
//            .init(x: 3, n: 4, result: 81),
//            .init(x: 3, n: -2, result: 1/9),
//            .init(x: 2.1, n: 3, result: 9.261),
//            .init(x: 0.00001, n: 2147483647, result: 0),
//            .init(x: 0.00001, n: 10, result: 0),
//            .init(x: 34.00515, n: -3, result: 0.00003),
            .init(x: 8.84372, n: -5, result: 0.00002)
        ]
        for (i, testCase) in cases.enumerated() {
            if myPow(testCase.x, testCase.n) != testCase.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
