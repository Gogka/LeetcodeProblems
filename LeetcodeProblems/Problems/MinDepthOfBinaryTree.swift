//
//  MinDepthOfBinaryTree.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 07.04.2024.
//

import Foundation

final class MinDepthOfBinaryTree {
    typealias TreeNode = BalancedBinaryTree.TreeNode
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        guard root.left != nil || root.right != nil else { return 1 }
        var min = Int.max
        if let node = root.left {
            min = minDepth(node)
        }
        if let node = root.right {
            min = Swift.min(minDepth(node), min)
        }
        return min + 1
    }
}
