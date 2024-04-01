//
//  RemoveDuplicatesFromSortedList.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 01.04.2024.
//

import Foundation

final class RemoveDuplicatesFromSortedList {
    /// ✅  https://leetcode.com/problems/remove-duplicates-from-sorted-list/
    final class ListNode {
        var val: Int
        var next: ListNode?
        init() { self.val = 0; self.next = nil; }
        init(_ val: Int) { self.val = val; self.next = nil; }
        init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
    // [1,1,2,3,3]
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard let head else { return nil }
        var tail = head
        var current = head
        while let next = current.next {
            current = next
            if next.val != tail.val {
                tail.next = next
                tail = next
            }
        }
        tail.next = nil
        return head
    }
}
