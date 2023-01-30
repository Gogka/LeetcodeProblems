//
//  LevelorderTraversal.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 29.12.2022.
//

import Foundation
extension TreesProblems.BinaryTreesProblems {
    /// ✅ https://leetcode.com/explore/learn/card/data-structure-tree/134/traverse-a-tree/931/
    struct LevelorderTraversal {
        func levelOrder(_ root: TreeNode?) -> [[Int]] {
            guard let node: TreeNode = root else { return [] }
            var output: [[Int]] = []
            var queue: [TreeNode] = [node]
            while !queue.isEmpty {
                var level: [Int] = []
                for _ in 0..<queue.count {
                    let node: TreeNode = queue.removeFirst()
                    level.append(node.val)
                    node.left.map { queue.append($0) }
                    node.right.map { queue.append($0) }
                }
                output.append(level)
            }
            return output
        }
    }
}

