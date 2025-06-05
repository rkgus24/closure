//
//  Delivery.swift
//  ClosureBeyond
//
//  Created by 노가현 on 6/5/25.
//

import Foundation

enum DeliveryStatus {
    case notStarted
    case inTransit(daysRemaining: Int)
    case error
}

enum DeliveryError: Error {
    case invalidAddress
    case notStarted
    case systemError(reason: String)
}

func predictDeliveryDay(for address: String, status: DeliveryStatus) throws -> String {
    guard !address.isEmpty else {
        throw DeliveryError.invalidAddress
    }

    switch status {
    case .notStarted:
        throw DeliveryError.notStarted
    case .error:
        throw DeliveryError.systemError(reason: "시스템 서버 에러 예측이 불가능합니다.")
    case .inTransit(let daysRemaining):
        return "배송까지 \(daysRemaining)일 남았습니다."
    }
}
