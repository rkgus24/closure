//
//  Robot.swift
//  ClosureBeyond
//
//  Created by 노가현 on 6/5/25.
//

import Foundation

class Robot: Introducible {
    var name: String {
        didSet {
            if oldValue != name {
                print("name 변경 알림")
                print("변경 이전 값: \(oldValue)")
                print("변경 이후 값: \(name)")
            }
        }
    }

    init(name: String) {
        self.name = name
    }

    func introduce() -> String {
        return "안녕하세요, 저는 \(name)입니다."
    }

    func batteryCharge() {
        print("\(name): 배터리 충전 중")
    }
}
