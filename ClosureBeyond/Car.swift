import Foundation

open class Car {

    public let brand: String
    public let model: String
    public let year: String
    
    open var engine: Engine

    public init(brand: String, model: String, year: String, engine: any Engine) {
        self.brand = brand
        self.model = model
        self.year  = year
        self.engine = engine
    }

    open func drive() {
        engine.start()
        print("\(brand) \(model) 주행 중...")
    }

    open func stop() {
        print("\(brand) \(model) 정지")
    }
}
