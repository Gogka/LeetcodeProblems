//
//  CheckIfNandItsDoubleExist.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 04.01.2023.
//

import Foundation

struct CheckIfNandItsDoubleExist {
    /// ✅ https://leetcode.com/problems/check-if-n-and-its-double-exist/description/
    func checkIfExist(_ arr: [Int]) -> Bool {
        var passed: Set<Int> = []
        for num in arr {
            if passed.contains(num * 2) {
                return true
            }
            if num % 2 == 0 && passed.contains(num / 2) {
                return true
            } else {
                passed.insert(num)
            }
        }
        return false
    }
    private struct Example {
        let arr: [Int]
        let result: Bool
    }
    func test() {
        let examples = [
            Example.init(arr: [2,4], result: true),
            Example.init(arr: [4,2], result: true),
            Example.init(arr: [1,2,3], result: true),
            Example.init(arr: [2,2,2], result: false),
        ]
        for ex in examples {
            if checkIfExist(ex.arr) != ex.result {
                print("Error in \(ex.arr)")
                return
            }
        }
    }
}
