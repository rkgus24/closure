import Foundation

// 자기소개 기능
protocol Introducible {
    var name: String { get set } // 이름 저장하는 프로퍼티, 읽고 쓰기 가능
    func introduce() -> String // 자기소개 문장 반환하
}

// 기본 구현을 제공하는 익스텐션
extension Introducible {
    func introduce() -> String {
        return "안녕하세요, 저는 \(name)입니다." // 자기소개 문장 반환
    }
}
