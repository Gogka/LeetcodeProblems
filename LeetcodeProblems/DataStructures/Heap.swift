//
//  Heap.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 10.01.2023.
//

import Foundation

struct Heap<T> {
    static func maxHeap<Element: Comparable>() -> Heap<Element> {
        var elements: [Element] = []
        return maxHeap(elements: &elements, heapifyNeeded: false)
    }
    static func maxHeap<Element: Comparable>(elements: inout [Element], heapifyNeeded: Bool = false) -> Heap<Element> {
        .init(storage: elements, heapifyNeeded: heapifyNeeded, compareFunc: >=)
    }
    static func minHeap<Element: Comparable>() -> Heap<Element> {
        var elements: [Element] = []
        return minHeap(elements: &elements, heapifyNeeded: false)
    }
    static func minHeap<Element: Comparable>(elements: inout [Element], heapifyNeeded: Bool = false) -> Heap<Element> {
        .init(storage: elements, heapifyNeeded: heapifyNeeded, compareFunc: <=)
    }
    // MARK: -
    private var storage: [T]
    private let compareFunc: (T, T) -> Bool
    // MARK: -
    var count: Int { storage.count }
    var isEmpty: Bool { storage.isEmpty }
    func peek() -> T? {
        storage.first
    }
    @discardableResult
    mutating func poll() -> T? {
        if isEmpty { return nil }
        let head: T = storage[0]
        storage[0] = storage.last!
        storage.removeLast()
        heapifyDown()
        return head
    }
    mutating func add(_ element: T) {
        storage.append(element)
        heapifyUp()
    }
    // MARK: -
    private init(storage: [T], heapifyNeeded: Bool, compareFunc: @escaping (T, T) -> Bool) {
        self.storage = storage
        self.compareFunc = compareFunc
        if heapifyNeeded { heapify() }
    }
    private func getLeftChildIndex(forParent parentIndex: Int) -> Int {
        parentIndex * 2 + 1
    }
    private func getRightChildIndex(forParent parentIndex: Int) -> Int {
        parentIndex * 2 + 2
    }
    private func getParentIndex(forChild childIndex: Int) -> Int {
        (childIndex - 1) / 2
    }
    private func hasLeftChild(forParent parentIndex: Int) -> Bool {
        getLeftChildIndex(forParent: parentIndex) < storage.count
    }
    private func hasRightChild(forParent parentIndex: Int) -> Bool {
        getRightChildIndex(forParent: parentIndex) < storage.count
    }
    private func hasParent(childIndex: Int) -> Bool {
        childIndex > 0 && getParentIndex(forChild: childIndex) >= 0
    }
    private func getLeftChild(forParent parentIndex: Int) -> T {
        storage[getLeftChildIndex(forParent: parentIndex)]
    }
    private func getRightChild(forParent parentIndex: Int) -> T {
        storage[getRightChildIndex(forParent: parentIndex)]
    }
    private func getParent(forChild childIndex: Int) -> T {
        storage[getParentIndex(forChild: childIndex)]
    }
    private mutating func heapifyDown() {
        if isEmpty { return }
        heapifyDown(startedNode: 0)
    }
    private mutating func heapifyDown(startedNode: Int) {
        var current: Int = startedNode
        while hasLeftChild(forParent: current) {
            var smallestIndex: Int = getLeftChildIndex(forParent: current)
            if hasRightChild(forParent: current),
                compareFunc(getRightChild(forParent: current), getLeftChild(forParent: current)) {
                smallestIndex = getRightChildIndex(forParent: current)
            }
            if compareFunc(storage[current], storage[smallestIndex]) {
                return
            } else {
                storage.swapAt(current, smallestIndex)
                current = smallestIndex
            }
        }
    }
    private mutating func heapifyUp() {
        if isEmpty { return }
        var current: Int = storage.count - 1
        while hasParent(childIndex: current) {
            if compareFunc(getParent(forChild: current), storage[current]) { return }
            storage.swapAt(current, getParentIndex(forChild: current))
            current = getParentIndex(forChild: current)
        }
    }
    private mutating func heapify() {
        if isEmpty { return }
        var currentNode: Int = storage.count - 1
        while currentNode >= 0 {
            heapifyDown(startedNode: currentNode)
            currentNode -= 1
        }
    }
}
