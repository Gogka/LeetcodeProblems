//
//  LinkedList.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 06.01.2023.
//

import Foundation

struct LinkedList<T>: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = T
    final class Node<T>: CustomStringConvertible {
        var description: String { "\(value)" }
        fileprivate(set) var next: Node<T>?
        let value: T
        init(_ value: T, next: Node<T>? = nil) {
            self.value = value
            self.next = next
        }
    }
    private(set) var tail: Node<T>?
    private(set) var head: Node<T>?
    // MARK: -
    var isEmpty: Bool { head == nil }
    // MARK: -
    init() { }
    init(array: [T]) {
        if array.isEmpty { return }
        head = .init(array.first!)
        var currentNode: Node<T> = head!
        for i in 1..<array.count {
            currentNode.next = .init(array[i])
            currentNode = currentNode.next!
        }
        tail = currentNode
    }
    init(arrayLiteral elements: ArrayLiteralElement...) {
        self.init(array: elements)
    }
    @discardableResult
    mutating func insertAtStart(_ value: T) -> Node<T> {
        copyIfNeeded()
        head = .init(value, next: head)
        if tail == nil {
            tail = head
        }
        return head!
    }
    @discardableResult
    mutating func append(_ value: T) -> Node<T> {
        copyIfNeeded()
        if isEmpty { return insertAtStart(value) }
        let node: Node<T> = .init(value)
        self.tail?.next = node
        self.tail = node
        return node
    }
    @discardableResult
    mutating func insert(_ value: T, after node: Node<T>) -> Node<T> {
        copyIfNeeded()
        if tail === node {
            append(value)
            return tail!
        }
        node.next = Node(value, next: node.next)
        return node.next!
    }
    @discardableResult
    mutating func remove(after node: Node<T>) -> T? {
        guard let node: Node<T> = copyIfNeeded(returningCopyOf: node) else { return nil }
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
    @discardableResult
    mutating func removeLast() -> T? {
        copyIfNeeded()
        guard let head: Node<T> = self.head else { return nil }
        guard head !== tail else { return pop() }
        var next: Node<T> = head
        while next.next !== tail {
            next = next.next!
        }
        let val: T = next.next!.value
        next.next = nil
        tail = next
        return val
    }
    @discardableResult
    mutating func pop() -> T? {
        copyIfNeeded()
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    mutating func reverse() {
        guard !isEmpty else { return }
        let newHead: Node<T> = tail!
        self.tail = head
        var currentTail: Node<T> = head!
        var nextElement: Node<T>? = head?.next
        while let nextEl: Node<T> = nextElement {
            let savedNext: Node<T>? = nextEl.next
            nextEl.next = currentTail
            currentTail = nextEl
            nextElement = savedNext
        }
        self.tail?.next = nil
        self.head = newHead
        self.tail!.next = nil
    }
    // MARK: -
    @discardableResult
    private mutating func copyIfNeeded(returningCopyOf node: Node<T>? = nil) -> Node<T>? {
        guard var oldNode: Node<T> = self.head, !isKnownUniquelyReferenced(&head) else { return nil }
        head = .init(oldNode.value)
        var currentTail: Node<T> = head!
        var copy: Node<T>? = oldNode === node ? head! : nil
        while let nextOld: Node<T> = oldNode.next {
            currentTail.next = .init(nextOld.value)
            if nextOld === node {
                copy = currentTail.next
            }
            currentTail = currentTail.next!
            oldNode = nextOld
            
        }
        tail = currentTail
        return copy
    }
    private func getNode(at index: Int) -> Node<T>? {
        var current: Node<T>? = head
        var _index: Int = 0
        while current != nil, _index < index {
            current = current?.next
            _index += 1
        }
        return current
    }
}
extension LinkedList: CustomStringConvertible {
    var description: String {
        guard var node: Node<T> = head else { return "Empty" }
        var result: String = "\(node.value)"
        while let next: Node<T> = node.next {
            result = "\(result) -> \(next.value)"
            node  = next
        }
        return result
    }
}
extension LinkedList: Collection {
    func index(after i: Index) -> Index {
        .init(node: i.node?.next)
    }
    subscript(position: Index) -> T? {
        position.node?.value
    }
    var startIndex: Index {
        .init(node: head)
    }
    var endIndex: Index {
        .init(node: tail)
    }
    struct Index: Comparable {
        let node: Node<T>?
        static func < (lhs: LinkedList<T>.Index, rhs: LinkedList<T>.Index) -> Bool {
            guard lhs != rhs else { return false }
            let rightNodes: UnfoldFirstSequence<Node<T>?> = sequence(first: lhs.node, next: { $0?.next })
            return rightNodes.contains(where: { $0 === rhs.node })
        }
        static func == (lhs: LinkedList<T>.Index, rhs: LinkedList<T>.Index) -> Bool {
            lhs.node === rhs.node
        }
    }
}
