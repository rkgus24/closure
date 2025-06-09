import Foundation

public protocol Engine {
    var description: String { get }
    func start()
}

public struct CombustionEngine: Engine {
    public let description: String = "엔진"

    public func start() {
        print("CombustionEngine")
    }
}

public struct ElectricEngine: Engine {
    public let description: String = "전기 엔진"

    public func start() {
        print("ElectricEngine")
    }
}

public struct HydrogenEngine: Engine {
    public let description: String = "수소 엔진"

    public func start() {
        print("HydrogenEngine")
    }
}
