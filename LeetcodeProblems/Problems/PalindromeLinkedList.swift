//
//  PalindromeLinkedList.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 12.04.2024.
//

import Foundation

final class PalindromeLinkedList {
    typealias ListNode = LeetcodeProblems.ListNode<Int>
    /// ✅ https://leetcode.com/problems/palindrome-linked-list/
    func isPalindrome(_ head: ListNode?) -> Bool {
        /// calculating count
        var current = head
        var count = 0
        while current != nil {
            current = current!.next
            count += 1
        }
        if count == 1 { return true }
        /// splitting
        var i = 1
        current = head
        while i < count / 2 {
            current = current?.next
            i += 1
        }
        var second = current?.next
        if count % 2 == 1 {
            second = second?.next
        }
        second = revert(second)
        current = head
        while second != nil {
            if current?.val != second?.val { return false }
            current = current?.next
            second = second?.next
        }
        
        return true
    }
    func revert(_ headA: ListNode?) -> ListNode? {
        var previous: ListNode?
        var current = headA
        
        while current != nil {
            let node = current?.next
            current?.next = previous
            previous = current
            current = node
        }
        return previous
    }
}
