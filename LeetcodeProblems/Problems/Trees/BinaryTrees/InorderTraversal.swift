//
//  InorderTraversal.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 29.12.2022.
//

import Foundation
extension TreesProblems.BinaryTreesProblems {
    /// ✅ https://leetcode.com/explore/learn/card/data-structure-tree/134/traverse-a-tree/929/
    struct InorderTraversal {
        func inorderTraversal(_ root: TreeNode?) -> [Int] {
            guard let node: TreeNode = root else { return [] }
            return inorderTraversal(node.left) + [node.val] + inorderTraversal(node.right)
        }
    }
}
