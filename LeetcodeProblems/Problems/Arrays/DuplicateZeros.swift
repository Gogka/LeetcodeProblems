//
//  DuplicateZeros.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 03.01.2023.
//

import Foundation

struct DuplicateZeros {
    /// ✅ https://leetcode.com/problems/duplicate-zeros/description/
    func duplicateZeros(_ arr: inout [Int]) {
        let copy = arr
        var i = 0
        var copyI = 0
        let length = arr.count
        while i < length {
            if copy[copyI] == 0 {
                arr[i] = 0
                if i + 1 < length {
                    arr[i + 1] = 0
                    i += 1
                }
            } else {
                arr[i] = copy[copyI]
            }
            copyI += 1
            i += 1
        }
    }
    func test() {
//        var test = [1,0,2,3,0,4,5,0]
        var test = [1, 0, 1]
        duplicateZeros(&test)
        print(test)
    }
}
