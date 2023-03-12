//
//  ClosestBinarySearchTreeValue.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 04.03.2023.
//

import Foundation

struct ClosestBinarySearchTreeValue {
    /// ✅ https://leetcode.com/problems/closest-binary-search-tree-value/description/
    typealias TreeNode = TreesProblems.BinaryTreesProblems.TreeNode
    func diff(_ val: Int, _ target: Double) -> Double {
        abs(Double(val) - target)
    }
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        guard let root: TreeNode = root else { return .max }
        let rootDiff: Double = diff(root.val, target)
        let left: Int = {
            if let left: TreeNode = root.left, target < Double(root.val) {
                return closestValue(left, target)
            } else {
                return .max
            }
        }()
        let right: Int = {
            if let right: TreeNode = root.right, target > Double(root.val) {
                return closestValue(right, target)
            } else {
                return .max
            }
        }()
        if rootDiff < diff(left, target) {
            if rootDiff < diff(right, target) {
                return root.val
            } else {
                return right
            }
        } else {
            if diff(left, target) < diff(right, target) {
                return left
            } else {
                return right
            }
        }
    }
//    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
//        guard let root: TreeNode = root else { return .max }
//        let rootDiff: Double = diff(root.val, target)
//        let left: Int = {
//            if let left: TreeNode = root.left {
//                if rootDiff < diff(root.val - 1, target) {
//                    return .max
//                } else {
//                    return closestValue(left, target)
//                }
//            } else {
//                return .max
//            }
//        }()
//        let right: Int = {
//            if let right: TreeNode = root.right {
//                if rootDiff < diff(root.val + 1, target) {
//                    return .max
//                } else {
//                    return closestValue(right, target)
//                }
//            } else {
//                return .max
//            }
//        }()
//        if rootDiff < diff(left, target) {
//            if rootDiff < diff(right, target) {
//                return root.val
//            } else {
//                return right
//            }
//        } else {
//            if diff(left, target) < diff(right, target) {
//                return left
//            } else {
//                return right
//            }
//        }
//    }
    func test() {
        print(closestValue(.tree(from: [43,10,44,3,12,nil,47,1,7,11,21,46,48,0,2,5,9,nil,nil,19,39,45,nil,nil,49,nil,nil,nil,nil,4,6,8,nil,18,20,28,40,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,15,nil,nil,nil,26,34,nil,41,14,17,23,27,31,36,nil,42,13,nil,16,nil,22,24,nil,nil,29,33,35,38,nil,nil,nil,nil,nil,nil,nil,nil,nil,25,nil,30,32,nil,nil,nil,37]), 3.571429))
    }
}
