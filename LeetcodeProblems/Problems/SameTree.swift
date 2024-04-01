//
//  SameTree.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 01.04.2024.
//

import Foundation

final class SameTree {
    /// ✅ https://leetcode.com/problems/same-tree/description/
    final class TreeNode {
        var val: Int
        var left: TreeNode?
        var right: TreeNode?
        init() { self.val = 0; self.left = nil; self.right = nil; }
        init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
        init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
            self.val = val
            self.left = left
            self.right = right
        }
    }
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard let p, let q else {
            return p?.val == q?.val
        }
        guard p.val == q.val else {
            return false
        }
        return isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
    }
    
//    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
//        guard let p, let q else {
//            return p?.val == q?.val
//        }
//        var pQueue = [p]
//        var qQueue = [q]
//        while !pQueue.isEmpty, pQueue.count == qQueue.count {
//            let pNode = pQueue.removeFirst()
//            let qNode = qQueue.removeFirst()
//            if pNode.val != qNode.val {
//                return false
//            }
//            if let pLeft = pNode.left, let qLeft = qNode.left {
//                pQueue.append(pLeft)
//                qQueue.append(qLeft)
//            } else if pNode.left != nil || qNode.left != nil {
//                return false
//            }
//            if let pRight = pNode.right, let qRight = qNode.right {
//                pQueue.append(pRight)
//                qQueue.append(qRight)
//            } else if pNode.right != nil || qNode.right != nil {
//                return false
//            }
//        }
//        return true
//    }
}
