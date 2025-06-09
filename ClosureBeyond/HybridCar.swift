//
//  HybridCar.swift
//  ClosureBeyond
//
//  Created by 노가현 on 6/9/25.
//

import Foundation

public final class HybridCar: Car {
    public func switchEngine(to newEngine: any Engine) {
        print("엔진 교체 : \(engine.description) → \(newEngine.description)")
        self.engine = newEngine
    }
}
