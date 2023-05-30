//
//  Day03.swift
//  AdventOfCode2022
//
//  Created by Mehran Kamalifard on 5/28/23.
//

import Foundation

struct Day03: Solution {
    
    var input: String
    
    init(input: String) {
        self.input = input
    }
    
    func roles() -> [String: Int] {
        var sum = 1
        var finalDict = [String: Int]()
        let str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let charArray = Array(str)
        
        for char in charArray {
            finalDict[String(char)] = sum
            sum += 1
        }
        return finalDict
    }
}

extension Day03: Puzzels {
    func puzzleOne() {
        let input = self.fetchData.filter { $0 != "" }
        let roles = self.roles()
        var totalSum = 0

        for item in input {
            let arrayChar = Array(item).devided()
            let commonWord = Set(arrayChar.0).intersection(Set(arrayChar.1))
            for item in roles where item.key == String(commonWord) {
                totalSum += item.value
            }
        }
        print(totalSum)
    }
    
    func puzzleTwo() {
        let input = self.fetchData.filter { $0 != "" }
        let roles = self.roles()
        var totalSum = 0

        let chunkedArray = input.chunk(into: 3)
        for item in chunkedArray {
            let commonWord = Set(item[0]).intersection(Set(item[1])).intersection(Set(item[2]))
            for item in roles where item.key == String(commonWord) {
                totalSum += item.value
            }
        }
        print(totalSum)
    }
}





