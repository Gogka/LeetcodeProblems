//
//  SearchinRotatedSortedArray.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 02.03.2023.
//

import Foundation

struct SearchinRotatedSortedArray {
    /// ✅ https://leetcode.com/problems/search-in-rotated-sorted-array/description/
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.isEmpty { return -1 }
        var left: Int = 0
        var right: Int = nums.count - 1
        while left <= right {
            let mid: Int = (left + right) / 2
            if nums[mid] == target {
                return mid
            } else if nums[right] == target {
                return right
            } else if nums[left] == target {
                return left
            } else if nums[mid] < target && nums[right] > target && nums[mid] < nums[right] ||
                        nums[mid] > nums[left] && (nums[mid] < target || nums[right] > target && nums[left] > nums[right]) {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return -1
    }
//    func search(_ nums: [Int], _ target: Int) -> Int {
//        if nums.isEmpty { return -1 }
//        var left: Int = 0
//        var right: Int = nums.count - 1
//        if nums.last! < nums.first! {
//            var pivot: Int = -1
//            while left <= right {
//                let mid: Int = (left + right) / 2
//                if mid + 1 >= nums.count || mid - 1 < 0 || nums[mid - 1] > nums[mid + 1] {
//                    pivot = mid
//                    break
//                } else if nums[mid] > nums[right] {
//                    left = mid + 1
//                } else {
//                    right = mid - 1
//                }
//            }
//            if nums[pivot] == target {
//                return pivot
//            } else if nums[0] > target {
//                left = pivot + 1
//                right = nums.count - 1
//            } else {
//                left = 0
//                right = pivot - 1
//            }
//        }
//        return binarySearch(left: &left, right: &right, target: target, nums: nums)
//    }
    func binarySearch(left: inout Int, right: inout Int, target: Int, nums: [Int]) -> Int {
        while left <= right {
            let mid: Int = (left + right) / 2
            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return -1
    }
    struct TestCase {
        let nums: [Int]
        let target: Int
        let result: Int
    }
    func test() {
        let cases: [TestCase] = [
            .init(nums: [0], target: 0, result: 0),
            .init(nums: [0], target: 1, result: -1),
            .init(nums: [0,2], target: 1, result: -1),
            .init(nums: [-1,0,3,5,9,12], target: 9, result: 4),
            .init(nums: [-1,0,3,5,9,12], target: 2, result: -1),
            .init(nums: [-1,0,3,5,9,12], target: 13, result: -1),
            .init(nums: [4,5,6,7,0,1,2], target: 3, result: -1),
            .init(nums: [4,5,6,7,0,1,2], target: 0, result: 4),
            .init(nums: [4,5,6,7,0,1,2], target: 1, result: 5),
            .init(nums: [4,5,6,7,0,1,2], target: 5, result: 1),
            .init(nums: [4,5,6,7,8,1,2,3], target: 8, result: 4),
            .init(nums: [3,1], target: 0, result: -1),
            .init(nums: [1,3], target: 3, result: 1),
            .init(nums: [3,5,1], target: 3, result: 0),
            .init(nums: [8,1,2,3,4,5,6,7], target: 6, result: 6),
            .init(nums: [8,9,2,3,4], target: 9, result: 1),
            .init(nums: [1,2,3,4,5], target: 2, result: 1),
        ]
        for (i, tcase) in cases.enumerated() {
            if search(tcase.nums, tcase.target) != tcase.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
