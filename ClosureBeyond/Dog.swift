import Foundation

// Dog 구조체
struct Dog: Introducible {
    // 강아지 이름
    var name: String

    // 멍멍 메서드
    func bark() {
        print("\(name) : 멍멍")
    }
}
