//
//  ValidMountainArray.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 04.01.2023.
//

import Foundation

struct ValidMountainArray {
    /// ✅ https://leetcode.com/problems/valid-mountain-array/description/
    func validMountainArray(_ arr: [Int]) -> Bool {
        let count = arr.count
        if arr.count < 3 || arr[0] >= arr[1] || arr.last! >= arr[count - 2] { return false }
        var top: Int?
        var i = 1
        var j = count - 2
        let jExtra = count % 2 == 0 ? 1 : 0
        while i <= j + jExtra {
            if let top = top {
                if top > j {
                    if arr[j] >= arr[j+1] || arr[i] <= arr[i - 1] { return false }
                } else {
                    if arr[j] <= arr[j+1] || arr[i] >= arr[i - 1] { return false }
                }
                i += 1
                j -= 1
            } else {
                if i == j {
                    let el = arr[i]
                    return (arr[i - 1] < el && el > arr[j + 1]) || (el > arr[i - 1] && el < arr[i + 1]) || (el < arr[i - 1] && el > arr[i + 1])
                }
                if arr[j] < arr[j + 1] {
                    top = j + 1
                } else if arr[j] == arr[j + 1] {
                    return false
                }
                if arr[i] < arr[i - 1] {
                    if top != nil { return false }
                    top = i
                } else if arr[i] == arr[i - 1] {
                    return false
                }
                j -= 1
                i += 1
            }
        }
        return top != nil
    }
    private struct Example {
        let arr: [Int]
        let result: Bool
    }
    func test() {
        let examples: [Example] = [
            Example.init(arr: [2,4], result: false),
            Example.init(arr: [4,2], result: false),
            Example.init(arr: [1,2,3], result: false),
            Example.init(arr: [-1,2,1], result: true),
            .init(arr: [0,1,2,4,2,1], result: true),
            .init(arr: [9,8,7,6,5,4,3,2,1,0], result: false),
            .init(arr: [6,7,7,8,6], result: false),
            .init(arr: [0,1,2,3,4,8,9,10,11,12,11], result: true),
            .init(arr: [0,1,2,-1,-2,-3,-4,-5, -6], result: true),
            .init(arr: [0,1,2,1,2], result: false),
            .init(arr: [3,6,5,6,7,6,5,3,0], result: false),
            .init(arr: [4,20,32,45,49,45,31,21,20,16,11,8], result: true),
                .init(arr: [3,7,6,4,3,0,1,0], result: false),
            .init(arr: [3,4,9,14,22,29,32,36,39,41,40,37,32,23,21,10,3], result: true)
        ]
        for ex in examples {
            if validMountainArray(ex.arr) != ex.result {
                print("Error in \(ex.arr)")
                return
            }
        }
    }
}
