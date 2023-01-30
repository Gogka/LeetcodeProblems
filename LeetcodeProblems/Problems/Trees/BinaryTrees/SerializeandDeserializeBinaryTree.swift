//
//  SerializeandDeserializeBinaryTree.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 03.01.2023.
//

import Foundation
extension TreesProblems.BinaryTreesProblems {
    /// ✅ https://leetcode.com/problems/serialize-and-deserialize-binary-tree/submissions/870231909/
    struct SerializeandDeserializeBinaryTree {
        func serialize(_ root: TreeNode?) -> String {
            guard let root = root else { return "[]" }
            var values: [Int?] = [root.val]
            var leafs: [TreeNode?] = [root.left, root.right]
            while !leafs.isEmpty {
                var newLeafs: [TreeNode?] = []
                var isOnlyNil: Bool = true
                leafs.forEach {
                    values.append($0?.val)
                    if $0 != nil {
                        newLeafs.append($0?.left)
                        newLeafs.append($0?.right)
                        isOnlyNil = isOnlyNil && $0?.left == nil && $0?.right == nil
                    }
                }
                if isOnlyNil { break }
                leafs = newLeafs
            }
            while !values.isEmpty, (values.last ?? nil) == nil {
                values.removeLast()
            }
            return values.reduce(into: "[", { $0 += "\($1.map { "\($0)" } ?? "null")," }).dropLast() + "]"
        }
        
        func deserialize(_ data: String) -> TreeNode? {
            let array: [Int?] = data.dropFirst().dropLast().split(separator: ",").map {
                Int($0)
            }
            if array.isEmpty { return nil }
            if array.count == 1 { return .init(array.first!!) }
            let root: TreeNode = .init(array.first!!)
            var previousLevel: [TreeNode?] = [root]
            var newLevel: [TreeNode?] = []
            var currentIndex: Int = 0
            var index: Int = 1
            var elementsOnLevel: Int = 1
            while index < array.count {
                let insertedNode: TreeNode? = array[index].map { TreeNode.init($0) } ?? nil
                index += 1
                if currentIndex / 2 == elementsOnLevel {
                    newLevel.first??.left = insertedNode
                    elementsOnLevel = newLevel.count
                    previousLevel = newLevel
                    newLevel = insertedNode.map { [$0] } ?? []
                    currentIndex = 1
                    continue
                }
                insertedNode.map { newLevel.append($0) }
                let destinationNode: TreeNode? = previousLevel[currentIndex / 2]
                if currentIndex % 2 == 0 {
                    destinationNode?.left = insertedNode
                } else {
                    destinationNode?.right = insertedNode
                }
                currentIndex += 1
            }
            return root
        }
        func test() {
            let inputs: [String] = [
                "[1,2,3,null,null,4,5,6,7]"
            ]
            for input in inputs {
                let deserialized = deserialize(input)
                let serialized = serialize(deserialized)
                if serialized != input {
                    print("Error in input \(input).\nSerialized: \(serialized)")
                    break
                }
            }
        }
    }
}
