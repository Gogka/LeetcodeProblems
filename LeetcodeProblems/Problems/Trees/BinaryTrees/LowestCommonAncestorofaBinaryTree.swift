//
//  LowestCommonAncestorofaBinaryTree.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 01.01.2023.
//

import Foundation
extension TreesProblems.BinaryTreesProblems {
    /// ✅ https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/submissions/870182539/
    struct LowestCommonAncestorofaBinaryTree {
        func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
            return find(root: root, lowestAncestor: root, p: p, q: q).0 ?? root
        }
        private func find(root: TreeNode?,
                          lowestAncestor: TreeNode?,
                          p: TreeNode?,
                          q: TreeNode?) -> (TreeNode?, Bool, Bool) {
            guard let root = root else { return (nil, p == nil, q == nil) }
            var newP = p
            var newQ = q
            if root.val == p?.val {
                newP = nil
            }
            if root.val == q?.val {
                newQ = nil
            }
            if newP == nil && newQ == nil { return (lowestAncestor, true, true) }
            let left = find(
                root: root.left,
                lowestAncestor: newP == nil && p != nil || newQ == nil && q != nil ? root : lowestAncestor,
                p: newP,
                q: newQ)
            if let ancestor = left.0 { return (ancestor, true, true) }
            return find(
                root: root.right,
                lowestAncestor: left.1 && p != nil || left.2 && q != nil ? root : lowestAncestor,
                p: left.1 ? nil : p,
                q: left.2 ? nil : q)
        }
    }
}
