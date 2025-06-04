//
//  HighOrderFunctions.swift
//  ClosureBeyond
//
//  Created by 노가현 on 6/2/25.
//

import Foundation

func convertIntArrayToStringArray() {
    let numbers = [1, 2, 3, 4, 5]
    let result = numbers.map(String.init)
    print("숫자 -> 문자열 :", result)
}

func filterEvenNumbersAndConvertToString() {
    let input = Array(1...10)
    let output = input
        .filter { $0.isMultiple(of: 2) }
        .map(String.init)
    print("짝수만 문자열로 :", output)
}

func myMap(_ array: [Int], _ transform: (Int) -> String) -> [String] {
    var result: [String] = []
    for item in array {
        result.append(transform(item))
    }
    return result
}

func exampleMyMap() {
    let result = myMap([1, 2, 3, 4, 5]) { String($0) }
    print(result)
}

func a(_ input: [Int]) -> [Int] {
    input.enumerated()
        .filter { $0.offset.isMultiple(of: 2) }
        .map(\.element)
}

func b(_ input: [String]) -> [String] {
    input.enumerated()
        .filter { $0.offset.isMultiple(of: 2) }
        .map(\.element)
}

func c<T>(_ input: [T]) -> [T] {
    input.enumerated()
        .filter { $0.offset.isMultiple(of: 2) }
        .map(\.element)
}

func d<T: Numeric>(_ input: [T]) -> [T] {
    input.enumerated()
        .filter { $0.offset.isMultiple(of: 2) }
        .map(\.element)
}
