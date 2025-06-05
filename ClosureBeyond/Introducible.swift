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
