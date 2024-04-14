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
        
        func postorderTraversalLoop(_ root: TreeNode?) -> [Int] {
            var result = [Int]()
            var leftNodes = [TreeNode]()
            var previousRight: TreeNode?
            var leftBranch = root
            
            while leftBranch != nil || !leftNodes.isEmpty {
                if let m = leftBranch {
                    leftNodes.append(m)
                    leftBranch = m.left
                } else {
                    let node = leftNodes.last!
                    if let right = node.right {
                        if previousRight === right {
                            let last = leftNodes.removeLast()
                            result.append(last.val)
                            previousRight = last
                            continue
                        }
                        leftNodes.append(right)
                        leftBranch = right.left
                    } else {
                        previousRight = node
                        leftNodes.removeLast()
                        result.append(node.val)
                    }
                }
            }
            return result
        }
    }
}
