import Foundation

// 전기차 클래스
public final class ElectricCar: Car {
    
    // 외부에서 호출할 수 있는 생성자
    // 브랜드, 모델, 연식을 받아서 초기화
    public init(brand: String, model: String, year: String) {
        // engine 파라미터에 전기 엔진  전달
        super.init(
            brand: brand,
            model: model,
            year: year,
            engine: ElectricEngine()
        )
    }
}
