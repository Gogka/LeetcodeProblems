//
//  UniqueBinarySearchTreesII.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 28.02.2023.
//

import Foundation

struct UniqueBinarySearchTreesII {
    /// ✅ https://leetcode.com/problems/unique-binary-search-trees-ii/description/
    typealias TreeNode = TreesProblems.BinaryTreesProblems.TreeNode
    func generateTrees(_ n: Int) -> [TreeNode?] {
        var trees: [TreeNode] = []
        for i in 1...n {
            trees += generateTrees(current: i, leftBorder: 1, rightBorder: n)
        }
        return trees
    }
    private func generateTrees(current: Int, leftBorder: Int, rightBorder: Int) -> [TreeNode] {
        if current == leftBorder && current == rightBorder { return [.init(current)] }
        var leftTrees: [TreeNode] = []
        for i in leftBorder..<current {
            leftTrees += generateTrees(current: i, leftBorder: leftBorder, rightBorder: current - 1)
        }
        var rightTrees: [TreeNode] = []
        for i in current + 1..<rightBorder + 1 {
            rightTrees += generateTrees(current: i, leftBorder: current + 1, rightBorder: rightBorder)
        }
        var result: [TreeNode] = []
        if leftTrees.count > rightTrees.count {
            for leftTree in leftTrees {
                if rightTrees.isEmpty {
                    let node: TreeNode = .init(current)
                    node.left = leftTree
                    result.append(node)
                } else {
                    for rightTree in rightTrees {
                        let node: TreeNode = .init(current)
                        node.left = leftTree
                        node.right = rightTree
                        result.append(node)
                    }
                }
            }
        } else {
            for rightTree in rightTrees {
                if leftTrees.isEmpty {
                    let node: TreeNode = .init(current)
                    node.right = rightTree
                    result.append(node)
                } else {
                    for leftTree in leftTrees {
                        let node: TreeNode = .init(current)
                        node.left = leftTree
                        node.right = rightTree
                        result.append(node)
                    }
                }
            }
        }
        return result
    }
    func test() {
        print(generateTrees(3))
    }
}
