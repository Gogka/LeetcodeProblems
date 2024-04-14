//
//  IntersectionOfTwoLinkedLists.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 12.04.2024.
//

import Foundation

enum IntersectionOfTwoLinkedLists {
    typealias ListNode = LeetcodeProblems.ListNode<Int>
    /// https://leetcode.com/problems/intersection-of-two-linked-lists/
    static func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var aLast = headA
        var bLast = headB
        while let next = aLast?.next {
            aLast = next
        }
        
        while let next = bLast?.next {
            bLast = next
        }
        guard aLast === bLast else { return nil }
        let aReverted = revert(headA)
        
        return nil
    }
    static func revert(_ headA: ListNode?) -> ListNode? {
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
