//
//  FibonacciNumber.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 19.02.2023.
//

import Foundation

final class FibonacciNumber {
    var saved: [Int: Int] = [:]
    func fib(_ n: Int) -> Int {
        if n < 2 { return n }
        if let res = saved[n] { return res }
        let prevResult: Int = fib(n - 1)
        saved[n - 1] = prevResult
        return prevResult + fib(n - 2)
    }
}
