//
//  LinkedListCycle.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 12.04.2024.
//

import Foundation

enum LinkedListCycle {
    typealias ListNode = LeetcodeProblems.ListNode<Int>
    /// ✅ https://leetcode.com/problems/linked-list-cycle/description/
    static func hasCycle(_ head: ListNode?) -> Bool {
        var next = head
        while next != nil {
            if next?.next === next {
                return true
            }
            let node = next?.next
            next?.next = next
            next = node
        }
        return false
    }
}
