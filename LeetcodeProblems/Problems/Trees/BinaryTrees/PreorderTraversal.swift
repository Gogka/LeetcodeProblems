//
//  PreorderTraversal.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 29.12.2022.
//

import Foundation

extension TreesProblems.BinaryTreesProblems {
    /// ✅ https://leetcode.com/explore/learn/card/data-structure-tree/134/traverse-a-tree/928/
    struct PreorderTraversal {
        func preorderTraversal(_ root: TreeNode?) -> [Int] {
                guard let node: TreeNode = root else { return [] }
                var output: [Int] = [node.val]
                var childNode: TreeNode?
                var parents: [TreeNode] = []
                if let left: TreeNode = node.left {
                    childNode = left
                    parents.append(node)
                } else {
                    childNode = node.right
                }
                while let child: TreeNode = childNode {
                    output.append(child.val)
                    childNode = child.left
                    if childNode == nil {
                        if let right: TreeNode = child.right {
                            childNode = right
                            continue
                        }
                        if parents.isEmpty { break }
                        while !parents.isEmpty {
                            childNode = parents.removeLast().right
                            if childNode != nil { break }
                        }
                    } else {
                        parents.append(child)
                    }
                }
                return output
            }
    }
}
