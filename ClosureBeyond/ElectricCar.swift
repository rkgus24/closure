//
//  ElectricCar.swift
//  ClosureBeyond
//
//  Created by 노가현 on 6/9/25.
//

import Foundation

public final class ElectricCar: Car {
    public init(brand: String, model: String, year: String) {
        super.init(
            brand: brand,
            model: model,
            year: year,
            engine: ElectricEngine()
        )
    }
}
