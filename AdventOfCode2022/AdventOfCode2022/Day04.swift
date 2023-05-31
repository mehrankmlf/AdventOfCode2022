//
//  Day04.swift
//  AdventOfCode2022
//
//  Created by Mehran Kamalifard on 5/30/23.
//

import Foundation

struct Day04: Solution {
    
    var input: String
    
    init(input: String) {
        self.input = input
    }
    
    private func isContained(left: Range<Int>, right: Range<Int>) -> Bool {
        return left.lowerBound <= right.lowerBound && right.upperBound <= left.upperBound
    }
}

extension Day04: Puzzels {
    func puzzleOne() {
        let input = self.fetchData.filter { $0 != "" }
        var sum = 0
        
        for item in input {
            let elfs = item.components(separatedBy: ",")
            let splitElfs = elfs.map{ $0.split(separator: "-") }
            
            let min1 = Int(splitElfs[0][0])!
            let max1 = Int(splitElfs[0][1])!
            
            let min2 = Int(splitElfs[1][0])!
            let max2 = Int(splitElfs[1][1])!
            
            if isContained(left: min1..<max1, right: min2..<max2) ||
                isContained(left: min2..<max2, right: min1..<max1) {
                sum += 1
            }
        }
        print(sum)
    }
    
    func puzzleTwo() {
        // Need to be implemented
    }
}

