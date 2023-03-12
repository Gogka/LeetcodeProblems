//
//  FindKClosestElements.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 04.03.2023.
//

import Foundation

struct FindKClosestElements {
    /// ✅ https://leetcode.com/problems/find-k-closest-elements/description/
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var left: Int = 0
        var right: Int = arr.count - 1
        while left < right {
            let mid: Int = (left + right) / 2
            if arr[mid] == x {
                left = mid
                break
            } else if arr[mid] < x {
                left = mid + 1
            } else {
                right = mid
            }
        }
        let index: Int
        if arr[left] == x {
            index = left
        } else if arr[right] == x {
            index = right
        } else if left == 0 {
            return Array(arr[0..<k])
        } else if right == arr.count {
            return Array(arr[arr.count - k..<arr.count])
        } else {
            index = abs(arr[left - 1] - x) <= abs(arr[left] - x) ? left - 1 : left
        }
        left = index + 1
        right = index + 1
        while right - left < k {
            if right == arr.count || (left > 0 && abs(arr[left - 1] - x) <= abs(arr[right] - x)) {
                left -= 1
            } else {
                right += 1
            }
        }
        return Array(arr[left..<right])
    }
    struct TestCase {
        let arr: [Int]
        let k: Int
        let x: Int
        let result: [Int]
    }
    func test() {
        let cases: [TestCase] = [
            .init(arr: [0,0,0,1,3,5,6,7,8,8], k: 2, x: 2, result: [1,3]),
            .init(arr: [1,1,1,10,10,10], k: 1, x: 9, result: [10]),
            .init(arr: [0,1,1,1,2,3,6,7,8,9], k: 9, x: 4, result: [0,1,1,1,2,3,6,7,8]),
            .init(arr: [1,2,3,4,5], k: 4, x: 3, result: [1,2,3,4]),
            .init(arr: [1,2,3,4,5], k: 4, x: 6, result: [2,3,4,5]),
            .init(arr: [1,2,3,4,5], k: 4, x: -1, result: [1,2,3,4]),
            .init(arr: [0,0,1,2,3,3,4,7,7,8], k: 3, x: 5, result: [3,3,4]),
//            .init(arr: [1,1,2,3,3,3,4,6,8,8], k: 6, x: 1, result: [])
        ]
        for (i, tcase) in cases.enumerated() {
            if findClosestElements(tcase.arr, tcase.k, tcase.x) != tcase.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
