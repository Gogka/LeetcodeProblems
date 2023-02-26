//
//  KthSymbolinGrammar.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 26.02.2023.
//

import Foundation

struct KthSymbolinGrammar {
    /// ✅ https://leetcode.com/problems/k-th-symbol-in-grammar/description/
    func kthGrammar(_ n: Int, _ k: Int) -> Int {
        if k == 1 { return 0 }
        if k == 2 { return 1 }
        let elements: Int = pow(x: 2, n: n - 2)
        if k <= elements {
            return kthGrammar(n - 1, k)
        } else {
            let halfK: Int = k % elements
            if halfK <= elements / 2 {
                return kthGrammar(n - 1, elements / 2 + halfK)
            } else {
                return kthGrammar(n - 1, halfK - elements / 2)
            }
        }
    }
    func pow(x: Int, n: Int) -> Int {
        if n == 0 { return 1 }
        var result: Int = pow(x: x, n: n / 2)
        result *= result
        if n % 2 == 0 {
            return result
        } else {
            return result * x
        }
    }
//    func kthGrammar(_ n: Int, _ k: Int) -> Int {
//        if k == 1 { return 0 }
//        return getkthGrammar(k: k - 2, new: [1])
//    }
//    func getkthGrammar(k: Int, new: [Int]) -> Int {
//        if new.count > k { return new[k] }
//        var nextNew: [Int] = .init()
//        nextNew.reserveCapacity(new.count)
//        let newK: Int = k - new.count
//        for i in 0..<new.count {
//            let num: Int = new[i]
//            if num == 0 {
//                nextNew.append(0)
//                nextNew.append(1)
//            } else {
//                nextNew.append(1)
//                nextNew.append(0)
//            }
//            if newK < nextNew.count { break }
//        }
//        return getkthGrammar(k: newK, new: nextNew)
//    }
    struct TestCase {
        let n: Int
        let k: Int
        let result: Int
    }
    /// n: 1, 0
    /// n: 2, 01
    /// n: 3, 0110
    /// n: 4, 01101001
    /// n: 5, 0110100110010110
    /// n: 6, 01101001100101101001011001101001
    func test() {
        let cases: [TestCase] = [
            .init(n: 1, k: 1, result: 0),
            .init(n: 2, k: 1, result: 0),
            .init(n: 2, k: 2, result: 1),
            .init(n: 4, k: 4, result: 0),
            .init(n: 4, k: 7, result: 0),
            .init(n: 5, k: 2, result: 1),
            .init(n: 5, k: 9, result: 1),
            .init(n: 3, k: 4, result: 0),
            .init(n: 5, k: 10, result: 0),
            .init(n: 30, k: 434991989, result: 0)
        ]
        for (i, testCase) in cases.enumerated() {
            if kthGrammar(testCase.n, testCase.k) != testCase.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
