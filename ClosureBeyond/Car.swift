import Foundation

// 자동차 기본 클래스
open class Car {

    // 브랜드
    public let brand: String
    
    // 모델명
    public let model: String
    
    // 출시 연도
    public let year: String
    
    // 자동차 엔진. Engine 프로토콜을 따르는 어떤 타입이든 가능하게
    open var engine: Engine

    // Car 클래스 생성자
    // 자동차 정보 받아서 초기화
    public init(brand: String, model: String, year: String, engine: any Engine) {
        self.brand = brand
        self.model = model
        self.year  = year
        self.engine = engine
    }

    // 자동차를 운전하는 메서드
    // 엔진을 켜고 주행 중 메시지 출력
    open func drive() {
        engine.start()  // 동작 시작
        print("\(brand) \(model) 주행 중...") // 상태 출력
    }

    // 자동차를 멈추는 메서드
    open func stop() {
        print("\(brand) \(model) 정지")  // 정지 출력
    }
}
