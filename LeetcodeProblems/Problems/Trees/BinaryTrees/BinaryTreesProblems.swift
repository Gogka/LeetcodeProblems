//
//  BinaryTreesProblems.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 29.12.2022.
//

import Foundation
extension TreesProblems {
    enum BinaryTreesProblems {
        public class TreeNode: CustomDebugStringConvertible, CustomStringConvertible {
            public var val: Int
            public var left: TreeNode?
            public var right: TreeNode?
            public var debugDescription: String {
                "val: \(val), left: \(left.map { "\($0)" } ?? "nil"), right: \(right.map { "\($0)" } ?? "nil")"
            }
            public var description: String { debugDescription }
            public init() { self.val = 0; self.left = nil; self.right = nil; }
            public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
            public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
                self.val = val
                self.left = left
                self.right = right
            }
            static func array(from root: TreeNode?) -> [Int?] {
                guard let root else { return [] }
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
                return values
            }
            static func tree(from array: [Int?]) -> TreeNode? {
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
        }
    }
}
