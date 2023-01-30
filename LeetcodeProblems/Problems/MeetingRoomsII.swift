//
//  MeetingRoomsII.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 15.01.2023.
//

import Foundation

struct MeetingRoomsII {
    struct Interval: Comparable {
        let start: Int
        let end: Int
        static func < (lhs: Interval, rhs: Interval) -> Bool {
            lhs.start < rhs.start
        }
    }
    struct Room: Comparable {
        let end: Int
        static func < (lhs: Room, rhs: Room) -> Bool {
            lhs.end < rhs.end
        }
    }
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        if intervals.isEmpty { return 0 }
        if intervals.count == 1 { return 1 }
        /// Sorting
        var newIntervals: [Interval] = intervals.map { .init(start: $0.first!, end: $0.last!) }
        var heap: Heap<Interval> = .minHeap(elements: &newIntervals, heapifyNeeded: true)
        var sortedIntervals: [Interval] = []
        sortedIntervals.reserveCapacity(intervals.count)
        while !heap.isEmpty {
            sortedIntervals.append(heap.poll()!)
        }
        /// Calculating rooms
        var rooms: Heap<Room> = .minHeap()
        var maxRooms: Int = 0
        for i in 0..<sortedIntervals.count {
            if let room: Room = rooms.peek(), room.end <= sortedIntervals[i].start {
                rooms.poll()
            }
            rooms.add(.init(end: sortedIntervals[i].end))
            maxRooms = max(maxRooms, rooms.count)
        }
        return maxRooms
    }
    /// Solution # 1
//    struct Interval: Comparable {
//        let start: Int
//        let end: Int
//        static func < (lhs: Interval, rhs: Interval) -> Bool {
//            lhs.end < rhs.end
//        }
//    }
//    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
//        if intervals.isEmpty { return 0 }
//        if intervals.count == 1 { return 1 }
//        /// Sorting
//        var newIntervals: [Interval] = intervals.map { .init(start: $0.first!, end: $0.last!) }
//        var heap: Heap<Interval> = .minHeap(elements: &newIntervals, heapifyNeeded: true)
//        var sortedIntervals: [Interval] = []
//        sortedIntervals.reserveCapacity(intervals.count)
//        while !heap.isEmpty {
//            sortedIntervals.append(heap.poll()!)
//        }
//        /// Calculating simultanious iterations
//        var maxRooms: Int = 1
//        for i in 0..<sortedIntervals.count - 1 {
//            var rooms: Int = 1
//            for j in i + 1..<sortedIntervals.count {
//                if sortedIntervals[i].end > sortedIntervals[j].start {
//                    rooms += 1
//                }
//            }
//            maxRooms = max(rooms, maxRooms)
//        }
//        return maxRooms
//    }
    private struct Example {
        let intervals: [[Int]]
        let res: Int
    }
    func test() {
        let examples: [Example] = [
            .init(intervals: [[0,30],[5,10],[15,20]], res: 2),
            .init(intervals: [[7,10],[2,4]], res: 1),
            .init(intervals: [[0,30],[5,10],[15,20]], res: 2),
            .init(intervals: [[2,15],[36,45],[9,29],[16,23],[4,9]], res: 2)
//            .init(intervals: [[7,10],[2,4], [5,8], [3,6], [9,11], [12, 14]], res: 1),
        ]
        for (i, ex) in examples.enumerated() {
            if minMeetingRooms(ex.intervals) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
