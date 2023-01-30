//
//  ConstructBinaryTreefromInorderandPreorderTraversal.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 30.12.2022.
//

import Foundation
extension TreesProblems.BinaryTreesProblems {
    /// ✅ https://leetcode.com/explore/learn/card/data-structure-tree/133/conclusion/943/
    struct ConstructBinaryTreefromInorderandPreorderTraversal {
        struct Example {
            let preorder: [Int]
            let inorder: [Int]
            let result: [Int?]
        }
        func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
            if inorder.isEmpty { return nil }
            if inorder.count == 1 { return .init(inorder.first!) }
            var inorderDic: [Int: Int] = [:]
            var preorderDic: [Int: Int] = [:]
            for i in 0..<inorder.count {
                inorderDic[inorder[i]] = i
                preorderDic[preorder[i]] = i
            }
            let root: Int = preorder.first!
            let inorderIndex: Int = inorderDic[root]!
            let leftInorder: [Int] = Array(inorder[0..<inorderIndex])
            let rightInorder: [Int] = Array(inorder[inorderIndex + 1..<inorder.count])
            let leftPreorder: [Int] = leftInorder.map { preorderDic[$0]! }.sorted().map { preorder[$0] }
            let rightPreorder: [Int] = rightInorder.map { preorderDic[$0]! }.sorted().map { preorder[$0] }
            let left: TreeNode? = buildTree(leftPreorder, leftInorder)
            let right: TreeNode? = buildTree(rightPreorder, rightInorder)
            return TreeNode(root, left, right)
        }
        static func test() {
            do {
                try test(examples: [
                    .init(preorder: [3,9,8,10,11,20,15,7], inorder: [8,9,11,10,3,15,20,7], result: [3, 9,20,8,10,15,7, nil,nil,11]),
                    .init(preorder: [3,9,20,15,7], inorder: [9,3,15,20,7], result: [3,9,20,nil,nil,15,7]),
                    .init(preorder: [-1], inorder: [-1], result: [-1])
                ])
            } catch {
                print(error)
            }
        }
        static func test(examples: [Example]) throws {
            let solution: Self = .init()
            for example in examples {
                let res: TreeNode? = solution.buildTree(example.preorder, example.inorder)
                let resArray: [Int?] = TreeNode.array(from: res)
                if resArray != example.result {
                    throw TextError(text: "Invalid result.\nInorder: \(example.inorder)\nPreorder: \(example.preorder)\nExpected: \(example.result)\nOutput:\(resArray)")
                }
            }
        }
    }
}
