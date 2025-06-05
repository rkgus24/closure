//
//  Dog.swift
//  ClosureBeyond
//
//  Created by 노가현 on 6/5/25.
//

import Foundation

struct Dog: Introducible {
    var name: String

    func introduce() -> String {
        return "안녕하세요, 저는 강아지 \(name)입니다."
    }

    func bark() {
        print("\(name) : 멍멍")
    }
}
