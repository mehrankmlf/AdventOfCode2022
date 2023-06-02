//
//  Day02.swift
//  AdventOfCode2022
//
//  Created by Mehran on 3/4/1402 AP.
//

import Foundation

struct Day02: Solution {
    
    var input: String

    init(input: String) {
        self.input = input
    }
}

extension Day02: Puzzels {
    func puzzleOne() {
        
        /*
         The Roles Should be like below
         
         A Y = Win   2+6 = 8
         A X = Draw  1+3 = 4
         A Z = Loss  3+0 = 3
         
         B Y = Draw  2+3 = 5
         B X = Loss  1+0 = 1
         B Z = Win   3+6 = 9
         
         C Y = Loss  2+0 = 2
         C X = Win   1+6 = 7
         C Z = Draw  3+3 = 6
         
         */
        
        let input = self.fetchData
        var totalScore = 0
        
        let results = ["A Y": 8, "A X": 4, "A Z": 3,
                       "B Y": 5, "B X": 1, "B Z": 9,
                       "C Y": 2, "C X": 7, "C Z": 6]
        
        for match in input {
            for result in results.keys where match == result {
                totalScore += results[result]!
            }
        }
        print(totalScore)
    }
    
    func puzzleTwo() {
        
        /*
         The Roles Should be like below
         
         A Y   1+3 = 4
         A X   0+3 = 3
         A Z   6+2 = 8
         
         B Y   3+2 = 5
         B X   0+1 = 1
         B Z   6+3 = 9
         
         C Y   3+3 = 6
         C X   0+2 = 2
         C Z   6+1 = 7
         
         */
        
        let input = self.fetchData
        var totalScore = 0
        
        let results = ["A Y": 4, "A X": 3, "A Z": 8,
                       "B Y": 5, "B X": 1, "B Z": 9,
                       "C Y": 6, "C X": 2, "C Z": 7]
        
        for match in input {
            for result in results.keys where match == result {
                totalScore += results[result]!
            }
        }
        print(totalScore)
    }
}
