//
//  FindAllNumbersDisappearedinanArray.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 04.01.2023.
//

import Foundation

struct FindAllNumbersDisappearedinanArray {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var copy = nums
        for num in nums {
            copy[num - 1] = -1
        }
        var res: [Int] = []
        for i in 0..<copy.count {
            if copy[i] > 0 {
                res.append(i + 1)
            }
        }
        return res
    }
    private struct Example {
        let arr: [Int]
        let res: [Int]
    }
    func test() {
        let examples: [Example] = [
            .init(arr: [4,3,2,7,8,2,3,1], res: [5,6]),
            .init(arr: [1,1], res: [2])
        ]
        for ex in examples {
            if findDisappearedNumbers(ex.arr) != ex.res {
                print("Error in \(ex.arr)")
                return
            }
        }
    }
}
