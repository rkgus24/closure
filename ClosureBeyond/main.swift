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

// Introducible 배열 및 고유 메서드 실행
var beings: [Introducible] = []

let robot = Robot(name: "피규어")
let cat = Cat(name: "나비")
let dog = Dog(name: "초코")

beings.append(robot)
beings.append(cat)
beings.append(dog)

for being in beings {
    print(being.introduce())

    if let robot = being as? Robot {
        robot.batteryCharge()
    } else if let cat = being as? Cat {
        cat.meow()
    } else if let dog = being as? Dog {
        dog.bark()
    }
}

robot.name = "옵티머스"
robot.name = "옵티머스"
