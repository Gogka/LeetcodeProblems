//
//  SearchinaBinarySearchTree.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 19.02.2023.
//

import Foundation

struct SearchinaBinarySearchTree {
    typealias TreeNode = TreesProblems.BinaryTreesProblems.TreeNode
    /// ✅ https://leetcode.com/problems/search-in-a-binary-search-tree/description/
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root: TreeNode = root else { return nil }
        if root.val == val { return root }
        if val >= root.val {
            return searchBST(root.right, val)
        } else {
            return searchBST(root.left, val)
        }
    }
    func test() {
        let tree: TreeNode? = TreeNode.tree(from: [4,2,7,1,3])
        let node = searchBST(tree, 2)
        print(node)
//        let cases: [TestCase] = [
//            .init(head: [1,2,3,4,5], result: [5,4,3,2,1]),
//            .init(head: [1,2], result: [2,1])
//        ]
//        for (i,testCase) in cases.enumerated() {
//            if searchBST(testCase.root, testCase.val) != testCase.result {
//                print("Error in \(i)")
//                return
//            }
//        }
    }
}
