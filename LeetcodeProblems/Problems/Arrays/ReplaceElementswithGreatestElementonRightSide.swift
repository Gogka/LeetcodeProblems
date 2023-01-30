//
//  ReplaceElementswithGreatestElementonRightSide.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 04.01.2023.
//

import Foundation

struct ReplaceElementswithGreatestElementonRightSide {
    /// ✅ https://leetcode.com/problems/replace-elements-with-greatest-element-on-right-side/description/
    func replaceElements(_ arr: [Int]) -> [Int] {
        if arr.isEmpty { return [] }
        let count = arr.count
        if count == 1 { return [-1] }
        var copy = arr
        var maxVal: Int = copy.last!
        copy[count - 1] = -1
        var i = count - 2
        while i >= 0 {
            let val = maxVal
            maxVal = max(maxVal, copy[i])
            copy[i] = val
            i -= 1
        }
        return copy
    }
    private struct Example {
        let arr: [Int]
        let res: [Int]
    }
    func test() {
        let examples: [Example] = [
            .init(arr: [17,18,5,4,6,1], res: [18,6,6,6,1,-1]),
            .init(arr: [400], res: [-1]),
        ]
        for ex in examples {
            if replaceElements(ex.arr) != ex.res {
                print("Error in \(ex.arr)")
                return
            }
        }
    }
}
