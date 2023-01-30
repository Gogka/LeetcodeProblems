//
//  PerfectSquares.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 06.01.2023.
//

import Foundation

struct PerfectSquares {
    /// ✅ https://leetcode.com/problems/perfect-squares/description/
    func numSquares(_ n: Int) -> Int {
        var perfectSquares: [Int] = []
        var i: Int = 1
        repeat {
            let square: Int = i * i
            if square == n { return 1 }
            perfectSquares.append(square)
            i += 1
        } while i * i <= n
        var currentMin: Int?
        while let greatestSquare: Int = perfectSquares.last {
            var passedResult: Set<Int> = [greatestSquare]
            var passingResult: Set<Int> = []
            var numberOfTerms: Int = 2
            var index: Int = 1
            while !passedResult.isEmpty {
                let result: Int = passedResult.removeFirst()
                if currentMin.map({ result * $0 <= n }) ?? false { break }
                var isSumFound: Bool = false
                for square in perfectSquares {
                    let sum: Int = result + square
                    if sum == n {
                        isSumFound = true
                        break
                    }
                    if sum > n { continue }
                    passingResult.insert(sum)
                }
                if isSumFound {
                    if currentMin.map({ $0 > numberOfTerms }) ?? true {
                        currentMin = numberOfTerms
                    }
                    break
                }
                index -= 1
                if index == 0 {
                    passedResult = passingResult
                    numberOfTerms += 1
                    passingResult = []
                    index = passedResult.count
                    if currentMin.map({ numberOfTerms >= $0 }) ?? false {
                        continue
                    }
                }
            }
            perfectSquares.removeLast()
        }
        return currentMin ?? -1
    }
    private struct Example {
        let n: Int
        let res: Int
    }
    func test() {
        let examples: [Example] = [
            .init(n: 12, res: 3),
            .init(n: 13, res: 2),
            .init(n: 9, res: 1),
            .init(n: 10, res: 2),
            .init(n: 51, res: 3),
            .init(n: 55, res: 4),
            .init(n: 95, res: 4),
            .init(n: 7168, res: 4),
        ]
        for (i, ex) in examples.enumerated() {
            if numSquares(ex.n) != ex.res {
                print("Error in \(i + 1) example.")
                return
            }
        }
    }
}
