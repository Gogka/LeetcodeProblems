//
//  MinStack.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 05.02.2023.
//

import Foundation

struct MinStack {
    /// ✅ https://leetcode.com/problems/min-stack/description/
    class MinStack {
        private var stack: Stack<Int>
        private var minStack: Stack<Int>
        init() {
            stack = []
            minStack = []
        }
        func push(_ val: Int) {
            stack.push(val)
            if minStack.top.map({ $0 >= val }) ?? true {
                minStack.push(val)
            }
        }
        func pop() {
            let element: Int? = stack.pop()
            if element == minStack.top {
                minStack.pop()
            }
        }
        func top() -> Int {
            stack.top!
        }
        func getMin() -> Int {
            minStack.top!
        }
    }
}
