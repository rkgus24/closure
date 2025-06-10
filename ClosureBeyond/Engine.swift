import Foundation

// 공통 기능을 정의
public protocol Engine {
    var description: String { get } // 엔진 설명 제공, 읽기 전용 프로퍼티
    func start() // 시작 기능
}

// 내연기관 엔진
public struct CombustionEngine: Engine {
    public let description: String = "엔진"

    // 엔진 시작 시 호출
    public func start() {
        print("CombustionEngine")
    }
}

// 전기 엔진
public struct ElectricEngine: Engine {
    public let description: String = "전기 엔진"

    // 엔진 시작 시 호출
    public func start() {
        print("ElectricEngine")
    }
}

// 수소 엔진
public struct HydrogenEngine: Engine {
    public let description: String = "수소 엔진"

    // 엔진 시작 시 호출
    public func start() {
        print("HydrogenEngine")
    }
}
