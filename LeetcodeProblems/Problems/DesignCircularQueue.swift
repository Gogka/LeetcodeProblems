//
//  DesignCircularQueue.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 05.01.2023.
//

import Foundation

struct DesignCircularQueue {
    /// ✅ https://leetcode.com/problems/design-circular-queue/description/
    final class MyCircularQueue {
        private var head: Int?
        private var tail: Int?
        private lazy var queue: Array<Int> = .init(repeating: 0, count: capacity)
        private let capacity: Int
        init(_ k: Int) {
            capacity = k
        }
        func enQueue(_ value: Int) -> Bool {
            if isFull() { return false }
            if head != nil, tail != nil {
                if tail! >= head!, tail! + 1 == capacity {
                    tail = 0
                } else {
                    tail! += 1
                }
                queue[self.tail!] = value
            } else {
                queue[0] = value
                head = 0
                tail = 0
            }
            return true
        }
        
        func deQueue() -> Bool {
            if isEmpty() { return false }
            if self.head! == self.tail! {
                self.head = nil
                self.tail = nil
                return true
            }
            if self.head! == capacity - 1 {
                self.head = 0
            } else {
                self.head! += 1
            }
            return true
        }
        
        func Front() -> Int {
            head.map { queue[$0] } ?? -1
        }
        
        func Rear() -> Int {
            tail.map { queue[$0] } ?? -1
        }
        
        func isEmpty() -> Bool {
            head == nil
        }
        
        func isFull() -> Bool {
            guard let tail = tail, let head = head else { return false }
            if tail >= head {
                return capacity - 1 == tail && head == 0
            } else {
                return head - 1 == tail
            }
        }
    }
    func test() {
        // # 1
        let obj = MyCircularQueue(3)
        print("\(#line): ", obj.enQueue(1))
        print("\(#line): ", obj.enQueue(2))
        print("\(#line): ", obj.enQueue(3))
        print("\(#line): ", obj.deQueue())
        print("\(#line): ", obj.deQueue())
        print("\(#line): ", obj.enQueue(3))
        print("\(#line): ", obj.enQueue(5))
        print("\(#line): ", obj.deQueue())
        print("\(#line): ", obj.deQueue())
        print("\(#line): ", obj.deQueue())
        print("\(#line): ", obj.deQueue())
        // # 1
//        let obj = MyCircularQueue(1)
//        print("\(#line): ", obj.enQueue(1))
//        print("\(#line): ", obj.enQueue(2))
        
    }
}
