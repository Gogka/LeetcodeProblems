//
//  ConstructBinaryTreefromInorderandPostorderTraversal.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 29.12.2022.
//

import Foundation

extension TreesProblems.BinaryTreesProblems {
    /// ✅ https://leetcode.com/explore/learn/card/data-structure-tree/133/conclusion/942/
    struct ConstructBinaryTreefromInorderandPostorderTraversal {
        struct Example {
            let inorder: [Int]
            let postorder: [Int]
            let result: [Int?]
        }
        func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
            if inorder.count == 1 { return .init(inorder.first!) }
            var inorderDic: [Int: Int] = [:]
            var postorderDic: [Int: Int] = [:]
            for i in 0..<inorder.count {
                inorderDic[inorder[i]] = i
                postorderDic[postorder[i]] = i
            }
            let root: Int = postorder.last!
            let rootInorderIndex: Int = inorderDic[root]!
            /// Looking for right subtree's leafs
            var postorderTraversalIndex: Int = postorder.count
            repeat {
                postorderTraversalIndex -= 1
                if postorderTraversalIndex == -1 { break }
            } while inorderDic[postorder[postorderTraversalIndex]]! >= rootInorderIndex
            let left: TreeNode? = {
                if rootInorderIndex == 0 {
                    return nil
                } else if postorderTraversalIndex == 0 {
                    return .init(postorder[0])
                } else {
                    return buildTree(Array(inorder[0..<rootInorderIndex]),
                                     Array(postorder[0...postorderTraversalIndex]))
                }
            }()
            let right: TreeNode? = {
                if inorder.last == inorder[rootInorderIndex] {
                    return nil
                } else if rootInorderIndex == inorder.count - 1 {
                    return .init(inorder.last!)
                } else {
                    
                    return buildTree(Array(inorder[(rootInorderIndex + 1)..<inorder.count]),
                                     Array(postorder[(postorderTraversalIndex + 1)..<postorder.count - 1]))
                }
            }()
            return TreeNode(root, left, right)
        }
        static func test() {
            do {
                try test(examples: [
                    .init(inorder: [9,3,15,20,7], postorder: [9,15,7,20,3], result: [3,9,20,nil,nil,15,7]),
                    .init(inorder: [2,1], postorder: [2,1], result: [1,2]),
                    .init(inorder: [1, 2], postorder: [2,1], result: [1, nil, 2]),
                    .init(inorder: [1, 3, 2], postorder: [3,2,1], result: [1, nil, 2, 3]),
                    .init(inorder: [1, 2, 3, 4], postorder: [1,4,3,2], result: [2, 1, 3, nil, nil, nil, 4]),
                ])
            } catch {
                print(error)
            }
        }
        static func test(examples: [Example]) throws {
            let solution: Self = .init()
            for example in examples {
                let res: TreeNode? = solution.buildTree(example.inorder, example.postorder)
                let resArray: [Int?] = TreeNode.array(from: res)
                if resArray != example.result {
                    throw TextError(text: "Invalid result.\nInorder: \(example.inorder)\nPostorder: \(example.postorder)\nExpected: \(example.result)\nOutput:\(resArray)")
                }
            }
        }
    }
}
