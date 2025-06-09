//
//  Dog.swift
//  ClosureBeyond
//
//  Created by 노가현 on 6/5/25.
//

import Foundation

struct Dog: Introducible {
    var name: String

    func bark() {
        print("\(name) : 멍멍")
    }
}
