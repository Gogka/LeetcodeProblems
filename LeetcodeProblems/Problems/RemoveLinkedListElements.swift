//
//  RemoveLinkedListElements.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 12.04.2024.
//

import Foundation

final class RemoveLinkedListElements {
    typealias ListNode = LeetcodeProblems.ListNode<Int>
    /// ✅ https://leetcode.com/problems/remove-linked-list-elements/description/
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head?.val == val {
            return removeElements(head?.next, val)
        } else {
            head?.next = removeElements(head?.next, val)
            return head
        }
    }
}
