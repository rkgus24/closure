import Foundation

// 하이브리드 자동차
public final class HybridCar: Car {
    
    // 엔진을 새로운 엔진으로 교체하는 메서드
    // 다양한 엔진 타입을 받을 수 있음
    public func switchEngine(to newEngine: any Engine) {
        print("엔진 교체 : \(engine.description) → \(newEngine.description)")
        self.engine = newEngine // 엔진 교체
    }
}
