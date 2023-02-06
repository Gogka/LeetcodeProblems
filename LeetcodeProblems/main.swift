//
//  main.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 29.12.2022.
//

import Foundation
//NumberOfIslands().test()

var dsu: DisjointSetUnion<String> = .init()

dsu.makeSet(from: "a")
dsu.makeSet(from: "b")
var names: [String] = [
    "barbos",
    "anton",
    "sladkii",
    "abram",
    "boris",
    "kucher",
    "bobik",
    "apelsin",
]
for name in names {
    dsu.makeSet(from: name)
    if name.hasPrefix("a") {
        dsu.union("a", and: name)
    } else if name.hasPrefix("b") {
        dsu.union("b", and: name)
    }
}

print(dsu.isInSameSet(first: "anton", second: "apelsin"))
print(dsu.isInSameSet(first: "anton", second: "kucher"))
print(dsu.isInSameSet(first: "bobik", second: "kucher"))
print(dsu.isInSameSet(first: "bobik", second: "barbos"))
