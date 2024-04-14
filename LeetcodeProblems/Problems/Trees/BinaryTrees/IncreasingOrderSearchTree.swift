//
//  IncreasingOrderSearchTree.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 14.04.2024.
//

import Foundation

extension TreesProblems.BinaryTreesProblems {
    final class IncreasingOrderSearchTree {
        /// ✅ https://leetcode.com/problems/increasing-order-search-tree/description/
        
        /// Recursive
        func increasingBST(_ root: TreeNode?) -> TreeNode? {
            guard let root else { return nil }
            if let left = increasingBST(root.left) {
                var right: TreeNode? = left
                while right?.right != nil {
                    right = right?.right
                }
                right?.right = root
                root.left = nil
                root.right = increasingBST(root.right)
                return left
            }
            root.right = increasingBST(root.right)
            return root
        }
        
        /// Loop
        func increasingBSTLoop(_ root: TreeNode?) -> TreeNode? {
            guard let root else { return nil }
            if root.left == nil, root.right == nil { return root }
            var nodes = [root]
            var result = [TreeNode]()
            
            while !nodes.isEmpty {
                let node = nodes.last!
                if let left = node.left {
                    nodes.append(left)
                    node.left = nil
                    continue
                }
                nodes.removeLast()
                result.append(node)
                if let right = node.right {
                    nodes.append(right)
                    node.right = nil
                }
            }
            
            for i in 0..<result.count - 1 {
                result[i].right = result[i + 1]
            }
            return result.first
            
//            var nodes = [root]
//            var head: TreeNode?
//            var currentNode: TreeNode?
//
//            while !nodes.isEmpty {
//                let node = nodes.removeLast()
//                if let right = node.right {
//                    nodes.append(right)
//                    node.right = nil
//                }
//                if let left = node.left {
//                    nodes.append(left)
//                } else {
//                    if head == nil {
//                        head = node
//                    }
//                    if let currentNode {
//                        currentNode.right = node
//                    }
//                    currentNode = node
//                }
//            }
//            return head
        }
    }
}
