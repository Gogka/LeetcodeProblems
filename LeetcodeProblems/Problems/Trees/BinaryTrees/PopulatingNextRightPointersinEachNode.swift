//
//  PopulatingNextRightPointersinEachNode.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 01.01.2023.
//

import Foundation
extension TreesProblems.BinaryTreesProblems {
    /// ✅ https://leetcode.com/problems/populating-next-right-pointers-in-each-node/description/
    struct PopulatingNextRightPointersinEachNode {
        public class Node {
            public var val: Int
            public var left: Node?
            public var right: Node?
            public var next: Node?
            public init(_ val: Int) {
                self.val = val
            }
            static func array(from tree: Node?) -> [Int?] {
                guard let tree else { return [] }
                var values: [Int?] = [tree.val]
                var leafs: [Node?] = getLeafs(from: [tree])
                while !leafs.isEmpty {
                    values += leafs.map { $0?.val }
                    leafs = getLeafs(from: leafs.filter({ $0 != nil }))
                    if leafs.first(where: { $0 != nil }) == nil { break }
                }
                while (values.last ?? nil) == nil {
                    values.removeLast()
                }
                return values
            }
            private static func getLeafs(from nodes: [Node?]) -> [Node?] {
                nodes.reduce(into: [Node?](), { $0 += [$1?.left, $1?.right] })
            }
            static func tree(from array: [Int?]) -> Node? {
                if array.isEmpty { return nil }
                if array.count == 1 { return .init(array.first!!) }
                let root: Node = .init(array.first!!)
                var previousLevel: [Node?] = [root]
                var newLevel: [Node?] = []
                var level: Int = 1
                var currentIndex: Int = 0
                var index: Int = 1
                while index < array.count {
                    let insertedNode: Node? = array[index].map { Node.init($0) } ?? nil
                    index += 1
                    let elementsOnLevel: Int = pow(2, level - 1)
                    if currentIndex / 2 == elementsOnLevel {
                        newLevel.first??.left = insertedNode
                        previousLevel = newLevel
                        newLevel = [insertedNode]
                        currentIndex = 1
                        level += 1
                        continue
                    }
                    insertedNode.map { newLevel.append($0) }
                    let destinationNode: Node? = previousLevel[currentIndex / 2]
                    if currentIndex % 2 == 0 {
                        destinationNode?.left = insertedNode
                    } else {
                        destinationNode?.right = insertedNode
                    }
                    currentIndex += 1
                }
                return root
            }
            private static func pow(_ value: Int, _ grade: Int) -> Int {
                if grade == 0 { return 1 }
                return value * pow(value, grade - 1)
            }
        }
        func connect(_ root: Node?) -> Node? {
            guard let _root: Node = root else { return nil }
            _root.left?.next = _root.right
            _root.right?.next = _root.next?.left ?? _root.next?.right
            _ = connect(_root.left)
            _ = connect(_root.right)
            return _root
        }
    }
}
