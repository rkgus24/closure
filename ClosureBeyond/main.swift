//
//  main.swift
//  ClosureBeyond
//
//  Created by 노가현 on 6/2/25.
//

import Foundation

let num = 3
let intArray = [1, 2, 3, 4, 5]
let stringArray = ["가", "나", "다", "라", "마"]

print(sum(num, 7))
calculator(closure: sum)

convertIntArrayToStringArray()
filterEvenNumbersAndConvertToString()
exampleMyMap()

print("a 함수 :", a(intArray))
print("b 함수 :", b(stringArray))
print("c(Int) 함수 :", c(intArray))
print("c(String) 함수 :", c(stringArray))
print("d 함수 :", d(intArray))
