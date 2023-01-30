//
//  InsertionSortList.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 08.01.2023.
//

import Foundation
infix operator -->: AdditionPrecedence
struct InsertionSortList {
    /// ✅ https://leetcode.com/problems/insertion-sort-list/description/
    final class ListNode: ExpressibleByIntegerLiteral, CustomStringConvertible {
        var description: String {
            var tmp: ListNode = self
            var result: String = "\(tmp.val)"
            while let next: ListNode = tmp.next {
                result = "\(result) -> \(next.val)"
                tmp  = next
            }
            return result
        }
        var val: Int
        var next: ListNode?
        init(integerLiteral value: IntegerLiteralType) {
            self.val = value
        }
        init() { self.val = 0; self.next = nil; }
        init(_ val: Int) { self.val = val; self.next = nil; }
        init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
        static func -->(l: ListNode, r: ListNode) -> ListNode {
            var next: ListNode = l
            while let nxt: ListNode = next.next {
                next = nxt
            }
            next.next = r
            return l
        }
        static func -->(l: ListNode, r: Int) -> ListNode {
            l --> .init(r)
        }
        static func ==(l: ListNode, r: ListNode) -> Bool {
            var lCur: ListNode? = l
            var rCur: ListNode? = r
            while lCur != nil && rCur != nil {
                if lCur?.val != rCur?.val { return false }
                lCur = lCur?.next
                rCur = rCur?.next
            }
            return lCur?.val == rCur?.val
        }
        static func !=(l: ListNode, r: ListNode?) -> Bool {
            r.map { !(l == $0) } ?? false
        }
    }
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
            .init(head: 4 --> 2 --> 1 --> 3,
                  res: 1 --> 2 --> 3 --> 4),
            .init(head: -1 --> 5 --> 4 --> 3 --> 0,
                  res: -1 --> 0 --> 3 --> 4 --> 5),
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
