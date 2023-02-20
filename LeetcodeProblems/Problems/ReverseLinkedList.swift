//
//  ReverseLinkedList.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 19.02.2023.
//

import Foundation

struct ReverseLinkedList {
    /// ✅ https://leetcode.com/problems/reverse-linked-list/description/
    typealias ListNode = LeetcodeProblems.ListNode<Int>
    /// Iterative
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let head: ListNode = head else { return nil }
        var newHead: ListNode = head
        var newNext: ListNode? = head.next
        newHead.next = nil
        while let next: ListNode = newNext {
            newNext = next.next
            next.next = newHead
            newHead = next
        }
        return newHead
    }
    /// Recursive
//    func reverseList(_ head: ListNode?) -> ListNode? {
//        reverseListHelper(head).head
//    }
//    func reverseListHelper(_ head: ListNode?) -> (tail: ListNode?, head: ListNode?) {
//        guard let head: ListNode = head else { return (nil, nil) }
//        guard let next: ListNode = head.next else { return (head, head) }
//        let (tail, oldHead): (ListNode?, ListNode?) = reverseListHelper(next)
//        head.next = nil
//        tail?.next = head
//        return (head, oldHead)
//    }
    struct TestCase {
        let head: ListNode?
        let result: ListNode?
    }
    func test() {
        let cases: [TestCase] = [
            .init(head: [1,2,3,4,5], result: [5,4,3,2,1]),
            .init(head: [1,2], result: [2,1])
        ]
        for (i,testCase) in cases.enumerated() {
            if reverseList(testCase.head) != testCase.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
