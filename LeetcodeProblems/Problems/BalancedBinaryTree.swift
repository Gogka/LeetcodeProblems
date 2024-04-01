//
//  BalancedBinaryTree.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 01.04.2024.
//

import Foundation

final class BalancedBinaryTree {
    /// ✅ https://leetcode.com/problems/balanced-binary-tree/
    typealias TreeNode = SameTree.TreeNode
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root else { return true }
        return abs(height(root.left) - height(root.right)) < 2 && isBalanced(root.left) && isBalanced(root.right)
    }
    func height(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        return max(height(root.left), height(root.right)) + 1
    }
}
