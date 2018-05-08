//
//  Array randomizer.swift
//  Pocahontas
//
//  Created by Vladislav Filipov on 07.05.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import Foundation

struct RandomArray {
    var array: [Int] = []
    
    mutating func randomize(_ count: Int, value: UInt32) {
        for _ in 0..<count {
            self.array.append(Int(arc4random_uniform(value)))
        }
    }
    
    var count: Int {
        return self.array.count
    }
    
    mutating func bubbleSort(_ globalIndex: inout Int, _ sortedIndices: inout Int) -> (Int, Int)? {
        guard globalIndex < self.count else { return nil }
        let passes = (self.count - 1) - sortedIndices
        if (self.array[globalIndex] > self.array[globalIndex + 1]) {
            self.array.swapAt(globalIndex + 1, globalIndex)
            return (globalIndex + 1, globalIndex)
        }
        if globalIndex < passes - 1 {
            globalIndex += 1
            return self.bubbleSort(&globalIndex, &sortedIndices)
        } else {
            sortedIndices += 1
            globalIndex = 0
            return (globalIndex, globalIndex)
        }
    }
    
    mutating func selectionSort(_ globalIndex: inout Int) -> (Int, Int)? {
        guard globalIndex < self.count - 1 else { return nil }
        var lowestValueIndex = globalIndex
        for index in (globalIndex + 1)..<self.count {
            if self.array[index] < self.array[lowestValueIndex] {
                lowestValueIndex = index
            }
        }
        if globalIndex != lowestValueIndex {
            self.array.swapAt(globalIndex, lowestValueIndex)
            return (globalIndex, lowestValueIndex)
        }
        globalIndex += 1
        return self.selectionSort(&globalIndex)
    }
    
//    mutating func insertSort(_ globalIndex: inout Int) -> (Int, Int)? {
//        guard globalIndex < self.count else { return nil }
//        var count = 0
//        var y = globalIndex
//        let temp = self.array[y]
//        while y > 0 && temp < self.array[y - 1] {
//            self.array[y] = self.array[y - 1]
//            y -= 1
//            count += 1
//        }
//        self.array[y] = temp
//        print(self.array)
//        globalIndex += 1
//        return (y + count, 0)
//        var array = self.array
//        let index = array.index(of: self.array.min()!)
//        for ind in globalIndex..<index! {
//            if array[index!] < array[ind] {
//                array[index!] = 1000
//                self.array.swapAt(index!, ind)
//                globalIndex += 1
//                return (index!, ind)
//            }
//        }
//        return self.insertSort(&globalIndex)
//    }
}

