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

// 필수 문제 1
print(sum(num, 7))
calculator(closure: sum)

// 필수 문제 2
convertIntArrayToStringArray()
filterEvenNumbersAndConvertToString()
exampleMyMap()

print("a 함수 :", a(intArray))
print("b 함수 :", b(stringArray))
print("c(Int) 함수 :", c(intArray))
print("c(String) 함수 :", c(stringArray))
print("d 함수 :", d(intArray))

// 필수 문제 4
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

// 필수 문제 5
let testAddress = "서울시 강남구"
let statuses: [DeliveryStatus] = [
    .inTransit(daysRemaining: 3),
    .notStarted,
    .error
]

for status in statuses {
    do {
        let result = try predictDeliveryDay(for: testAddress, status: status)
        print("결과 :", result)
    } catch let error as DeliveryError {
        switch error {
        case .invalidAddress:
            print("주소가 올바르지 않습니다.")
        case .notStarted:
            print("배송이 아직 시작되지 않았습니다.")
        case .systemError(let reason):
            print("\(reason)")
        }
    } catch {
        print("알 수 없는 에러 \(error)")
    }
}

do {
    let _ = try predictDeliveryDay(for: "", status: .inTransit(daysRemaining: 2))
} catch {
    print("빈 주소 ", error)
}
