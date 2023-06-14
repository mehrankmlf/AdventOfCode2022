//
//  Day07.swift
//  AdventOfCode2022
//
//  Created by Mehran Kamalifard on 6/13/23.
//

import Foundation

struct Day07: Solution {
    
    var input: String
    
    init(input: String) {
        self.input = input
    }
    
    private func generatedDirectory() -> [String: Int] {
        let input = self.fetchData.filter { !$0.isEmpty }
        
        var path = [String]()
        var dirSizes: [String: Int] = [:]
        
        let terminalPrompt = "$"
        let cdCommand = "cd"
        let rootDirectory = "/"
        let previousDirectory = ".."
        
        for item in input {
            let separated = item.split(separator: " ")
            if separated[0] == terminalPrompt && separated[1] == cdCommand {
                if separated[2] == rootDirectory {
                    path = ["/"]
                } else if separated[2] == previousDirectory {
                    path.removeLast()
                } else {
                    path.append(String(separated[2]))
                }
            } else {
                if let size = Int(separated[0]) {
                    for i in 0..<path.count {
                        let directoryPath = path[0...i].joined(separator: "/")
                        dirSizes[directoryPath, default: 0] += size
                    }
                }
            }
        }
        return dirSizes
    }
}

extension Day07: Puzzels {
    func puzzleOne() {
        let directories = self.generatedDirectory()
        let totalSize = 100000
        
        let solution = directories.values.filter { $0 <= totalSize }.reduce(0, +)
        print(solution)
    }
    
    func puzzleTwo() {
        let directories = self.generatedDirectory()
        
        let diskSize = 70000000
        let need = 30000000
        let needToFree = need - (diskSize - (directories["/"] ?? 0))
        
        let solution = directories.values.filter({ $0 >= needToFree }).min()
        print(solution ?? 0)
    }
}
