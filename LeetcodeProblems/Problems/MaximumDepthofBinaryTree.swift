//
//  MaximumDepthofBinaryTree.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 19.02.2023.
//

import Foundation

struct MaximumDepthofBinaryTree {
    typealias TreeNode = TreesProblems.BinaryTreesProblems.TreeNode
    /// ✅ https://leetcode.com/problems/maximum-depth-of-binary-tree/description/
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return max(maxDepth(root.left), maxDepth(root.right)) + 1
    }
}
