//
//  Introducible.swift
//  ClosureBeyond
//
//  Created by 노가현 on 6/5/25.
//

import Foundation

protocol Introducible {
    var name: String { get set }
    func introduce() -> String
}

extension Introducible {
    func introduce() -> String {
        return "안녕하세요, 저는 \(name)입니다."
    }
}
