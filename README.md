# Swift 문법, 실전 문제 풀이 기록
Ch 2. 프로그래밍 심화 주차 과제
문제별로 개념 설명, 간단한 코드 스니펫 제공
실전 문제로 고차함수, 제네릭, 프로토콜, 에러처리, 클로저, ARC 같은 개념을 실습했습니다

## 필수 문제 1 : 클로저, 고차함수, 클로저 타입 전달
### 1. 클로저 설계 및 활용
두 개의 Int를 받아 합산 결과를 문자열로 반환하는 클로저를 정의했습니다

```
let sum: (Int, Int) -> String = { a, b in
    "두 수의 합은 \(a + b) 입니다"
}
print(sum(3, 7)) // "두 수의 합은 10 입니다"
```

### 2. 클로저를 파라미터로 받는 함수
동일한 타입의 클로저를 인자로 받는 calculate 함수 작성

```
func calculate(_ closure: (Int, Int) -> String) {
    print(closure(2, 5))
}
```

## 필수 문제 2 : 고차함수 실습
### 1. for-in → map 변환
기존 for-in 문을 map을 사용해 리팩토링했습니다

```
let result = numbers.map { "\($0)" }
```

### 2. filter + map 체이닝
짝수만 골라 문자열 배열로 변환

```
let output = input.filter { $0 % 2 == 0 }.map { "\($0)" }
```

### 3. 직접 고차함수 구현 : myMap
Swift 내장 map 없이 동작하는 커스텀 map 함수 구현

```
func myMap(_ input: [Int], _ transform: (Int) -> String) -> [String] {
    var result = [String]()
    for i in input {
        result.append(transform(i))
    }
    return result
}
```

## 필수 문제 3 : 제네릭, 인덱스 필터링
### 1. 짝수 인덱스 제거 함수 (a, b)
Int, String 배열 각각에서 짝수 인덱스 제거

### 2. 제네릭 함수 c
두 함수를 하나의 제네릭 함수로 통합

```
func c<T>(_ input: [T]) -> [T] {
    input.enumerated().compactMap { $0.offset % 2 == 0 ? $0.element : nil }
}
```

### 3. Numeric 프로토콜 기반 함수 d
제네릭 타입을 Numeric으로 제한

```
func d<T: Numeric>(_ input: [T]) -> [T] {
    input.enumerated().compactMap { $0.offset % 2 == 0 ? $0.element : nil }
}
```

## 필수 문제 4 : 프로토콜 + 타입별 고유 기능
### 1. Introducible 프로토콜
name 프로퍼티, introduce() 메서드 요구

```
protocol Introducible {
    var name: String { get set }
    func introduce() -> String
}
```

### 2. Robot, Cat, Dog 타입 정의 및 기능 추가
Robot: name 변경 시 이전값-이후값 출력

각 타입은 고유 메서드 포함

### 3. Introducible 배열 순회
배열에 다양한 타입 저장, 타입캐스팅으로 메서드 호출

## 필수 문제 5 : 열거형 + 에러 처리
### 1. 배송 상태 열거형 정의

```
enum DeliveryStatus {
    case notStarted
    case inTransit(daysRemaining: Int)
    case error
}
```

### 2. 에러 타입 정의, 예외처리 함수 구현

```
enum DeliveryError: Error {
    case invalidAddress, notStarted, systemError(reason: String)
}
```

### 3. predictDeliveryDay 함수
주소가 유효하지 않거나 하면 예외 throw

do-catch 구문으로  처리

## 도전 문제 1 : OOP - 자동차 설계
### 1. Base Class Car 설계
브랜드, 모델, 연식, 엔진 등의 상태 정의

drive() 같은 기본 동작 포함

### 2. 상속 활용
ElectricCar, HybridCar 구현

HybridCar는 switchEngine(to:) 메서드 추가

### 3. 상속 vs 프로토콜 방식 비교
상속은 기본 구현 공유에 좋으나 다중 상속 불가
프로토콜은 유연한 기능 확장에 유리하나 기본 상태 보장은 불가능

## 도전 문제 2 : 제네릭 구조체
SortableBox 구현
제네릭 타입 T 사용

T: Comparable 일 때만 정렬 가능

```
struct SortableBox<T> {
    var items: [T]
    mutating func sortItems() where T: Comparable {
        items.sort()
    }
}
```

## 도전 문제 3 : 프로토콜 기본 구현 제공
Introducible 프로토콜에 introduce() 기본 구현 추가

Robot은 고유한 introduce() 오버라이드

```
extension Introducible {
    func introduce() -> String {
        "안녕하세요, 저는 \(name)입니다."
    }
}
```

## 도전 문제 4 : ARC, 순환 참조
### 1. 클래스 간 순환 참조 발생 구조
클래스 A → B → 클로저 내부에서 A 참조로 인해 메모리 누수 발생

### 2. 캡처 리스트를 통한 해결
```
closure = { [weak self] in
    print(self?.name ?? "nil")
}
```
