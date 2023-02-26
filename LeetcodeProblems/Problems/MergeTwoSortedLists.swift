//
//  MergeTwoSortedLists.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 26.02.2023.
//

import Foundation

struct MergeTwoSortedLists {
    typealias ListNode = LeetcodeProblems.ListNode<Int>
    /// Iterating
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil { return list2 }
        if list2 == nil { return list1 }
        let head: ListNode?
        var cur1: ListNode?
        var cur2: ListNode?
        if list1!.val < list2!.val {
            head = list1
            cur1 = list1?.next
            cur2 = list2
        } else {
            head = list2
            cur1 = list1
            cur2 = list2?.next
        }
        var tail: ListNode? = head
        while let _cur1 = cur1, let _cur2 = cur2 {
            if _cur1.val < _cur2.val {
                tail?.next = cur1
                cur1 = _cur1.next
            } else {
                tail?.next = cur2
                cur2 = _cur2.next
            }
            tail = tail?.next
        }
        if let cur1 = cur1 {
            tail?.next = cur1
        } else {
            tail?.next = cur2
        }
        return head
    }
    /// Recursion
//    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
//        if list1 == nil { return list2 }
//        if list2 == nil { return list1 }
//        let head: ListNode
//        if list1!.val < list2!.val {
//            head = list1!
//            head.next = mergeTwoLists(head.next, list2)
//        } else {
//            head = list2!
//            head.next = mergeTwoLists(list1, head.next)
//        }
//        return head
//    }
}
