//
//  CountUnivalueSubtrees.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 14.02.2023.
//

import Foundation

final class CountUnivalueSubtrees {
    typealias TreeNode = TreesProblems.BinaryTreesProblems.TreeNode
    var count: Int = 0
    func countUnivalSubtrees(_ root: TreeNode?) -> Int {
        _ = isSame(root)
        return count
    }
    func isSame(_ root: TreeNode?) -> Bool {
        guard let root: TreeNode = root else { return true }
        let _isSame: Bool = (root.left.map { root.val == $0.val } ?? true) && (root.right.map { root.val == $0.val } ?? true)
        let isLeftSame: Bool = isSame(root.left)
        let isRightSame: Bool = isSame(root.right)
        let isFinalySame: Bool = _isSame && isLeftSame && isRightSame
        if isFinalySame {
            count += 1
        }
        return isFinalySame
    }
    // MARK: - first
//    func countUnivalSubtrees(_ root: TreeNode?) -> Int {
//        guard let root: TreeNode = root else { return 0 }
//        let count: Int = isSame(root) ? 1 : 0
//        return count + (root.left.map({ countUnivalSubtrees($0) }) ?? 0) + (root.right.map({ countUnivalSubtrees($0) }) ?? 0)
//    }
//    func isSame(_ root: TreeNode?) -> Bool {
//        guard let root: TreeNode = root else { return true }
//        let _isSame: Bool = (root.left.map { root.val == $0.val } ?? true) && (root.right.map { root.val == $0.val } ?? true)
//        return _isSame && isSame(root.left) && isSame(root.right)
//    }
    struct Case {
        let root: TreeNode?
        let result: Int
    }
    func test() {
        let cases: [Case] = [
//            .init(root: TreeNode.tree(from: [5,5,5,5,5,5]), result: 6),
            .init(root: TreeNode.tree(from: [5,1,5,5,5,nil,5]), result: 5),
//            .init(rooms: [[1,3],[3,0,1],[2],[0]], result: false),
        ]
        for i in 0..<cases.count {
            let c: Case = cases[i]
            count = 0
            if countUnivalSubtrees(c.root) != c.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
