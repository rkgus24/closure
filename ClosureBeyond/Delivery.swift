import Foundation

// 배송 상태
enum DeliveryStatus {
    case notStarted // 배송 시작 전
    case inTransit(daysRemaining: Int) // 배송 중, 남은 배송 일 포함
    case error // 오류 발생
}

// 에러를 정의하는 열거형
enum DeliveryError: Error {
    case invalidAddress // 잘못된 주소 입력
    case notStarted // 배송이 시작되지 않은 상태
    case systemError(reason: String) // 에러, 상세 이유 문자열 포함
}

// 주소, 배송 상태를 받아 배송 예상 일자를 반환하거나 에러 띄움
func predictDeliveryDay(for address: String, status: DeliveryStatus) throws -> String {
    // 주소가 비어있으면 잘못된 주소 에러 발생
    guard !address.isEmpty else {
        throw DeliveryError.invalidAddress
    }

    // 배송 상태에 따른 처리
    switch status {
    case .notStarted:
        // 배송이 시작되지 않은 상태면 에러 발생
        throw DeliveryError.notStarted
    case .error:
        // 시스템 에러가 발생한 경우, 에러 발생
        throw DeliveryError.systemError(reason: "시스템 서버 에러 예측이 불가능합니다.")
    case .inTransit(let daysRemaining):
        // 배송 중인 경우 남은 일자를 문자열로 반환
        return "배송까지 \(daysRemaining)일 남았습니다."
    }
}
