import Foundation

// Int를 문자열로 변환
func convertIntArrayToStringArray() {
    let numbers = [1, 2, 3, 4, 5] // 숫자 배열 선언
    let result = numbers.map(String.init) // 숫자를 문자열로 변환
    print("숫자 -> 문자열 :", result)
}

// 1부터 10까지 숫자 중 짝수만 걸러내서 문자열 배열로 변환하는 함수
func filterEvenNumbersAndConvertToString() {
    let input = Array(1...10) // 1부터 10까지 배열 생성
    let output = input
        .filter { $0.isMultiple(of: 2) } // 짝수만 필터링
        .map(String.init) // 문자열로 변환
    print("짝수만 문자열로 :", output)
}

// 배열, 변환 함수를 받아서 새 배열 반환
func myMap(_ array: [Int], _ transform: (Int) -> String) -> [String] {
    var result: [String] = [] // 결과를 저장할 빈 배열
    for item in array { // 배열의 각 요소에 대해
        result.append(transform(item)) // 변환 함수를 적용 후 추가
    }
    return result // 변환된 배열 반환
}

// myMap 함수 사용 예시
func exampleMyMap() {
    let result = myMap([1, 2, 3, 4, 5]) { String($0) } // 숫자를 문자열로 변환
    print(result)
}

// 인덱스가 짝수인 요소만 걸러내는 함수 (Int)
func a(_ input: [Int]) -> [Int] {
    input.enumerated() // 인덱스와 값 쌍으로 변환
        .filter { $0.offset.isMultiple(of: 2) } // 인덱스가 짝수인 요소만 필터링
        .map(\.element) // 값만 추출하여 새 배열 생성
}

// 인덱스가 짝수인 요소만 걸러내는 함수 (String)
func b(_ input: [String]) -> [String] {
    input.enumerated()
        .filter { $0.offset.isMultiple(of: 2) }
        .map(\.element)
}

// 타입에 상관없이 인덱스가 짝수인 요소만 걸러내는 함수
func c<T>(_ input: [T]) -> [T] {
    input.enumerated()
        .filter { $0.offset.isMultiple(of: 2) }
        .map(\.element)
}

// Numeric 프로토콜을 준수하는 타입에 한정한 제네릭 함수
// 인덱스가 짝수인 요소만 걸러냄
func d<T: Numeric>(_ input: [T]) -> [T] {
    input.enumerated()
        .filter { $0.offset.isMultiple(of: 2) }
        .map(\.element)
}
