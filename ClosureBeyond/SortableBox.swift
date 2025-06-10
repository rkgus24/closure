import Foundation

// 제네릭 구조체, 어떤 타입 T든 담을 수 있는 박스
struct SortableBox<T> {
    var items: [T] // T 타입의 배열 저장
}

// T가 Comparable 프로토콜을 따랐을 때 사용 가능한 익스텐션
extension SortableBox where T: Comparable {
    // items 배열을 정렬하는 메서드
    mutating func sortItems() {
        items.sort() // Comparable 프로토콜 덕분에 정렬 가능
    }
}
