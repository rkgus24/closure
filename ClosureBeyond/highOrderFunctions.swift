//
//  highOrderFunctions.swift
//  ClosureBeyond
//
//  Created by 노가현 on 6/2/25.
//

import Foundation

func example() {
    let numbers = [1,2,3,4,5]
    let result = numbers.map { String($0) }
    print(result)
}

func exampleFilterMap() {
    let input = [1,2,3,4,5,6,7,8,9,10]
    let output = input
        .filter { $0 % 2 == 0}
        .map { String($0) }
    print(output)
}

func myMap(_ array: [Int], _ transform: (Int) -> String) -> [String] {
    var result: [String] = []
    for item in array {
        result.append(transform(item))
    }
    return result
}

func exampleMyMap() {
    let mapped = myMap([1,2,3,4,5]) { String($0) }
    print(mapped)
}
