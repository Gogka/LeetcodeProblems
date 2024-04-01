//
//  ConvertSortedArrayToBinarySearchTree.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 01.04.2024.
//

import Foundation

final class ConvertSortedArrayToBinarySearchTree {
    /// ✅ https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/description/
    typealias TreeNode = SameTree.TreeNode
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard nums.count > 1 else {
            return nums.first.map(TreeNode.init)
        }
        let mid = nums.count / 2
        let head = TreeNode(nums[mid])
        head.left = sortedArrayToBST(Array(nums[0..<mid]))
        head.right = sortedArrayToBST(Array(nums[mid + 1..<nums.count]))
        return head
    }
}
