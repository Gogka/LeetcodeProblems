//
//  InsertionSortList.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 08.01.2023.
//

import Foundation
infix operator -->: AdditionPrecedence
struct InsertionSortList {
    typealias ListNode = LeetcodeProblems.ListNode<Int>
    /// ✅ https://leetcode.com/problems/insertion-sort-list/description/
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        var head: ListNode? = head
        var current: ListNode? = head?.next
        var tmpHead: ListNode? = head
        head?.next = nil
        while let cur: ListNode = current {
            var prev: ListNode?
            while let _tmpHead: ListNode = tmpHead, cur.val >= _tmpHead.val {
                prev = tmpHead
                tmpHead = _tmpHead.next
            }
            let tmpNext: ListNode? = cur.next
            if let prev: ListNode = prev {
                let tmp: ListNode? = prev.next
                prev.next = cur
                cur.next = tmp
            } else {
                cur.next = head
                head = cur
            }
            current = tmpNext
            tmpHead = head
        }
        return head
    }
    private struct Example {
        let head: ListNode?
        let res: ListNode?
    }
    func test() {
        let examples: [Example] = [
            .init(head: .init(4) --> 2 --> 1 --> 3,
                  res: .init(1) --> 2 --> 3 --> 4),
            .init(head: .init(-1) --> 5 --> 4 --> 3 --> 0,
                  res: .init(-1) --> 0 --> 3 --> 4 --> 5),
        ]
        for (i, ex) in examples.enumerated() {
            guard let res: InsertionSortList.ListNode = insertionSortList(ex.head) else {
                if ex.res != nil {
                    print("Error in \(i + 1).")
                    return
                } else {
                    continue
                }
            }
            if res != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
    
}
