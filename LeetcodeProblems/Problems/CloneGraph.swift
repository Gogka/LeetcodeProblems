//
//  CloneGraph.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 06.02.2023.
//

import Foundation

struct CloneGraph {
    /// ✅ https://leetcode.com/problems/clone-graph/description/
    public class Node: CustomStringConvertible {
        public var description: String { "Val: \(val). Neighbors: \(neighbors.reduce(into: "", { $0 += $1.map { "\($0.val)," } ?? "" }))" }
        public var val: Int
        public var neighbors: [Node?]
        public init(_ val: Int) {
            self.val = val
            self.neighbors = []
        }
    }
    func cloneGraph(_ node: Node?) -> Node? {
        guard let node: Node = node else { return nil }
        var created: [Int: Node] = [:]
        func clone(cloning: Node) -> Node? {
            if let val: Node = created[cloning.val] { return val }
            let new: Node = .init(cloning.val)
            created[cloning.val] = new
            for n in cloning.neighbors where n != nil {
                clone(cloning: n!).map { new.neighbors.append($0) }
            }
            return new
        }
        return clone(cloning: node)
    }
}
