//
//  Engine.swift
//  ClosureBeyond
//
//  Created by 노가현 on 6/9/25.
//

import Foundation

public protocol Engine {
    var description: String { get }
    func start()
    func recharge()
}

public struct CombustionEngine: Engine {
    public let description: String = "엔진"

    public func start()   { print("CombustionEngine") }
    public func recharge() { }
}

public struct ElectricEngine: Engine {
    public let description: String = "전기 엔진"

    public func start()   { print("ElectricEngine") }
    public func recharge() { print("배터리 충전 중...") }
}

public struct HydrogenEngine: Engine {
    public let description: String = "수소 엔진"

    public func start()   { print("HydrogenEngine") }
    public func recharge() { print("수소 충전 중...") }
}
