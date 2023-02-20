//
//  ListNode.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 19.02.2023.
//

import Foundation
final class ListNode<Value: Equatable>: Equatable, ExpressibleByArrayLiteral, CustomStringConvertible {
    typealias ArrayLiteralElement = Value
    var description: String {
        var tmp: ListNode = self
        var result: String = "\(tmp.val)"
        while let next: ListNode = tmp.next {
            result = "\(result) -> \(next.val)"
            tmp  = next
        }
        return result
    }
    var val: Value
    var next: ListNode?
    init(arrayLiteral elements: Value...) {
        if elements.isEmpty {
            fatalError("The array shouldn't be empty")
        }
        self.val = elements.first!
        var node: ListNode<Value> = self
        for i in 1..<elements.count {
            node.next = .init(elements[i])
            node = node.next!
        }
    }
    init(_ val: Value) { self.val = val; self.next = nil; }
    init(_ val: Value, _ next: ListNode?) { self.val = val; self.next = next; }
    static func -->(l: ListNode, r: ListNode) -> ListNode {
        var next: ListNode = l
        while let nxt: ListNode = next.next {
            next = nxt
        }
        next.next = r
        return l
    }
    static func -->(l: ListNode, r: Value) -> ListNode {
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
