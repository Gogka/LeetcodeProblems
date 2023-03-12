//
//  FindMinimuminRotatedSortedArrayII.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 05.03.2023.
//

import Foundation

struct FindMinimuminRotatedSortedArrayII {
    /// ✅ https://leetcode.com/problems/find-minimum-in-rotated-sorted-array-ii/description/
    func findMin(_ nums: [Int]) -> Int {
        var left: Int = 0
        var right: Int = nums.count - 1
        while left < right {
            let mid: Int = (left + right) / 2
            if nums[mid] > nums[right] {
                left = mid + 1
            } else if nums[mid] < nums[left] {
                right = mid
            } else {
                right -= 1
            }
        }
        return nums[left]
    }
//    func findMin(_ nums: [Int]) -> Int {
//        findMin(nums, 0, nums.count - 1)
//    }
//    func findMin(_ nums: [Int], _ leftStart: Int, _ rightStart: Int) -> Int {
//        var left: Int = leftStart
//        var right: Int = rightStart
//        while left < right {
//            let mid: Int = (left + right) / 2
//            if (mid - 1 >= 0 && mid + 1 < nums.count && nums[mid - 1] > nums[mid] && nums[mid + 1] > nums[mid]) || left == right {
//                left = mid
//                break
//            }
//            if nums[left] == nums[mid] || nums[mid] == nums[right] || nums[left] == nums[right] {
//                return min(findMin(nums, left, mid), findMin(nums, mid + 1, right))
//
//            } else if (nums[left] <= nums[mid] && nums[mid] > nums[right]) ||
//                        (nums[left] > nums[right] && nums[mid] > nums[right]) {
//                left = mid
//            } else {
//                right = mid
//            }
//        }
//        return nums[left]
//    }
    struct TestCase {
        let nums: [Int]
        let result: Int
    }
    func test() {
        let cases: [TestCase] = [
//            .init(nums: [10,10,10,-10,-10,-10,-10,-9,-9,-9,-9,-9,-9,-9,-8,-8,-8,-8,-8,-8,-8,-8,-7,-7,-7,-7,-6,-6,-6,-5,-5,-5,-4,-4,-4,-4,-3,-3,-2,-2,-2,-2,-2,-2,-2,-2,-1,-1,-1,-1,-1,0,0,0,0,0,0,0,1,1,1,1,2,2,2,2,2,2,2,3,3,3,4,4,4,5,5,5,5,6,6,6,7,7,7,7,7,8,8,8,8,9,9,9,9,9,9,9,10,10], result: -10),
//            .init(nums: [1,1,2,3,0,0], result: 0),
//            .init(nums: [2,2,0,0,1,1,1], result: 0),
//            .init(nums: [1,2,0,0,1], result: 0),
//            .init(nums: [2,0,1,1,1], result: 0),
            .init(nums: [10,1,10,10,10], result: 1),
            .init(nums: [3,3,1,3], result: 1),
            .init(nums: [3,3,1], result: 1),
            .init(nums: [5,1,3], result: 1),
            .init(nums: [1,1], result: 1),
            .init(nums: [3,1,1], result: 1),
            .init(nums: [3,4,5,1,2], result: 1),
            .init(nums: [4,5,6,7,0,1,2], result: 0),
            .init(nums: [11,13,15,17], result: 11),
            .init(nums: [2,1], result: 1),
            .init(nums: [2,2,2,0,1], result: 0),
            .init(nums: [3,1,3], result: 1),
        ]
        for (i, tcase) in cases.enumerated() {
            if findMin(tcase.nums) != tcase.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
