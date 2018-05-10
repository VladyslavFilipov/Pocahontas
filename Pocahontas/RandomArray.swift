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
    
    mutating func insertSort(_ globalIndex: inout Int) -> (Int, Int)? {
        var key = 0
        var index = 0
        
        for newIndex in globalIndex ... array.count - 1 {
            key = array[newIndex]
            index = newIndex - 1
            
            while index >= 0 && array[index] > key {
                array.swapAt(index + 1, index)
                return (index + 1, index)
            }
        }
        return (0, 0)
    }
}

