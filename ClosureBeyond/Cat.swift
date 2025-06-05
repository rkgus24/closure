//
//  Cat.swift
//  ClosureBeyond
//
//  Created by 노가현 on 6/5/25.
//

import Foundation

struct Cat: Introducible {
    var name: String

    func introduce() -> String {
        return "안녕하세요, 저는 고양이 \(name)입니다."
    }

    func meow() {
        print("\(name) : 야옹")
    }
}
