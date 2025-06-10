import Foundation

// Cat 구조체
struct Cat: Introducible {
    // 고양이 이름
    var name: String

    // 야옹 메서드
    func meow() {
        print("\(name) : 야옹")
    }
}
