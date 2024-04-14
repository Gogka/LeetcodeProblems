//
//  main.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 29.12.2022.
//

import Foundation
let tree = TreesProblems.BinaryTreesProblems.PostorderTraversal().postorderTraversalLoop(
//    .tree(from: [1, nil, 2, 3])
    .tree(from: [1, 2, 3,4,5,6,7])
)
print(tree)

//let node = ListNode<Int>(1)
//var next = node
//for i in 2..<5 {
//    let n = ListNode(i)
//    next.next = n
//    next = n
//}
//let a = IntersectionOfTwoLinkedLists.revert(node)
//print(a)
