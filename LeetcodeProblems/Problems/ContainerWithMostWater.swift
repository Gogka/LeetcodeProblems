//
//  ContainerWithMostWater.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 06.01.2023.
//

import Foundation
struct ContainerWithMostWater {
    func maxArea(_ height: [Int]) -> Int {
        var maxSquare: Int = 0
        var i: Int = 0
        var j: Int = height.count - 1
        let getSquare: (Int, Int) -> Int = {
            min(height[$0], height[$1]) * ($1 - $0)
        }
        while i < j {
            maxSquare = max(maxSquare, getSquare(i, j))
            if getSquare(i + 1, j) > getSquare(i, j - 1) {
                i += 1
            } else {
                j -= 1
            }
        }
        return maxSquare
    }
    private struct Example {
        let height: [Int]
        let res: Int
    }
    func test() {
        let examples: [Example] = [
            .init(height: [1,8,6,2,5,4,8,3,7], res: 49),
            .init(height: [1,1], res: 1)
        ]
        for (i, ex) in examples.enumerated() {
            if maxArea(ex.height) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
