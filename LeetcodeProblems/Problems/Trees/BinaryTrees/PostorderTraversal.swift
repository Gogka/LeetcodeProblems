//
//  PostorderTraversal.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 29.12.2022.
//

import Foundation
extension TreesProblems.BinaryTreesProblems {
    /// ✅ https://leetcode.com/explore/learn/card/data-structure-tree/134/traverse-a-tree/930/
    struct PostorderTraversal {
        func postorderTraversal(_ root: TreeNode?) -> [Int] {
            guard let node: TreeNode = root else { return [] }
            return postorderTraversal(node.left) + postorderTraversal(node.right) + [node.val]
        }
    }
}
