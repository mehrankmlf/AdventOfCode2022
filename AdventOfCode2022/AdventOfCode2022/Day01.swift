//
//  Day01.swift
//  AdventOfCode2022
//
//  Created by Mehran on 3/4/1402 AP.
//

import Foundation

struct Day01: Solution {

    var input: String
    
    init(input: String) {
        self.input = input
    }
    
   private func elfs() -> [Int] {
        var elfs = [Int]()
        var sum = 0
        
        let lines = self.fetchData
        
        for entry in lines {
            if entry != "" {
                sum += Int(entry)!
            } else if entry == "" {
                elfs.append(sum)
                sum = 0
            }
        }
        return elfs
    }
}

extension Day01: Puzzels {
    func puzzleOne() {
        let result = self.elfs().max() ?? 0
        print("Total: \(result)")
    }
    func puzzleTwo() {
        let sorted = self.elfs().sorted { $0 > $1 }
        let topThree = Array(sorted.prefix(3))
        let result = topThree.reduce(0, +)
        print("TopThree: \(result)")
    }
}
