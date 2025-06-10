import Foundation

// Robot 클래스
class Robot: Introducible {
    // name 프로퍼티에 값이 변경될 때마다 didSet 실행
    var name: String {
        didSet {
            // 변경 전과 변경 후 값이 다를 때만 출력
            if oldValue != name {
                print("name 변경 알림")
                print("변경 이전 값: \(oldValue)")
                print("변경 이후 값: \(name)")
            }
        }
    }

    // 초기화 메서드, name 초기값 설정
    init(name: String) {
        self.name = name
    }

    // Introducible 프로토콜 메서드 재정의
    func introduce() -> String {
        return "로봇 \(name)이 작동을 시작합니다."
    }

    // 배터리 충전
    func batteryCharge() {
        print("\(name): 배터리 충전 중")
    }
}
