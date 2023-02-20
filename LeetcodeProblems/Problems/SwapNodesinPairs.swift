//
//  SwapNodesinPairs.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 16.02.2023.
//

import Foundation

struct SwapNodesinPairs {
    /// ✅ https://leetcode.com/problems/swap-nodes-in-pairs/description/
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head?.next == nil { return head }
        let next: ListNode? = head?.next?.next
        head?.next?.next = head
        let res: ListNode? = head?.next
        head?.next = swapPairs(next)
        return res
    }
}
