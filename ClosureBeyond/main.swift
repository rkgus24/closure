import Foundation

// 필수 문제 1번 : 클로저 기본 동작 확인
func testClosureBasics() {
    print("[필수 1번] 클로저 기본")
    
    let num = 3
    print(sum(num, 7)) // sum 함수 실행 결과 출력
    calculator(closure: sum) // sum 함수를 클로저 인자로 넘겨서 calculator 실행
}

// 필수 문제 2번 : 고차 함수 map, filter, custom map 함수
func testHigherOrderFunctions() {
    print("\n[필수 2번] 고차 함수 활용")
    
    convertIntArrayToStringArray() // 숫자 배열을 문자열 배열로 변환
    filterEvenNumbersAndConvertToString() // 짝수만 걸러서 문자열로 변환
    exampleMyMap()
    
    let intArray = [1, 2, 3, 4, 5]
    let stringArray = ["가", "나", "다", "라", "마"]

    print("a 함수 :", a(intArray)) // 짝수 인덱스 요소만 반환 (Int)
    print("b 함수 :", b(stringArray)) // 짝수 인덱스 요소만 반환 (String)
    print("c(Int) 함수 :", c(intArray)) // 제네릭 함수로 짝수 인덱스 요소만 반환 (Int)
    print("c(String) 함수 :", c(stringArray)) // 제네릭 함수로 짝수 인덱스 요소만 반환 (String)
    print("d 함수 :", d(intArray)) // Numeric 제약 조건 있는 제네릭 함수
}

// 필수 문제 3번 : Introducible 프로토콜 활용
func testIntroducibleProtocolUsage() {
    print("\n[필수 3번] Introducible 프로토콜")
    
    var beings: [Introducible] = [
        Robot(name: "피규어"),
        Cat(name: "나비"),
        Dog(name: "초코")
    ]

    // introduce 호출하고, 메서드 실행
    for being in beings {
        print(being.introduce())
        
        switch being {
        case let robot as Robot:
            robot.batteryCharge() // 로봇이면 배터리 충전 함수 호출
        case let cat as Cat:
            cat.meow() // 고양이면 야옹 함수 호출
        case let dog as Dog:
            dog.bark() // 강아지면 멍멍 함수 호출
        default:
            break
        }
    }

    // 배열 첫 번째가 Robot 타입이면 이름 변경
    if let robot = beings.first as? Robot {
        robot.name = "옵티머스"
    }
}

// 필수 문제 4번 : 배송 상태 예외 처리
func testDeliveryStatusErrorHandling() {
    print("\n[필수 4번] 배송 상태 처리")

    let testAddress = "서울시 강남구"
    let statuses: [DeliveryStatus] = [
        .inTransit(daysRemaining: 3), // 배송 중, 3일 남음
        .notStarted, // 아직 배송 시작 전
        .error // 에러 상태
    ]

    for status in statuses {
        do {
            let result = try predictDeliveryDay(for: testAddress, status: status)
            print("결과 :", result)   // 정상 처리 시 예상 도착일 출력
        } catch let error as DeliveryError {
            // 배송 에러 케이스별
            switch error {
            case .invalidAddress:
                print("주소가 올바르지 않습니다.")
            case .notStarted:
                print("배송이 아직 시작되지 않았습니다.")
            case .systemError(let reason):
                print("시스템 오류:", reason)
            }
        } catch {
            print("알 수 없는 에러:", error)
        }
    }

    // 빈 주소로 호출해 에러 발생 처리
    do {
        _ = try predictDeliveryDay(for: "", status: .inTransit(daysRemaining: 2))
    } catch {
        print("빈 주소 에러:", error)
    }
}

// 도전 문제 1번 : Car 클래스, 하위 클래스
func testCarClassesFunctionality() {
    print("\n[도전 1번] Car 클래스 테스트")
    
    // 내연기관 차 생성, 주행
    let avante = Car(brand: "현대", model: "Avante", year: "2024", engine: CombustionEngine())
    avante.drive()
    avante.stop()
    
    print("----------------")
    
    // 전기차 생성, 주행
    let model3 = ElectricCar(brand: "테슬라", model: "Model 3", year: "2025")
    model3.drive()
    model3.stop()
    
    print("----------------")
    
    // 하이브리드 차량 생성, 엔진 변경 후 주행
    let miraiHybrid = HybridCar(brand: "기아", model: "K8-Hybrid", year: "2025", engine: HydrogenEngine())
    miraiHybrid.drive()
    miraiHybrid.stop()
    miraiHybrid.switchEngine(to: ElectricEngine()) // 엔진 교체
    miraiHybrid.drive()
    miraiHybrid.stop()
}

// 도전 문제 2번 : 제네릭 SortableBox
func testSortableBoxGenericUsage() {
    print("\n[도전 2번] SortableBox 테스트")
    
    var intBox = SortableBox(items: [1, 10, 2, 9, 5])
    intBox.sortItems() // 정렬 실행
    print("정렬된 intBox:", intBox.items)

    var stringBox = SortableBox(items: ["Banana", "Apple", "Orange"])
    stringBox.sortItems() // 정렬 실행
    print("정렬된 stringBox:", stringBox.items)

    struct Person {
        let name: String
    }

    // Comparable 미구현
    let _ = SortableBox(items: [Person(name: "?"), Person(name: "??")])
}

// 도전 문제 4번 : 순환 참조 발생, 해결
func testStrongWeakUnownedReferenceCycles() {
    print("\n[도전 4번] 순환 참조 테스트")
    
    createStrongReferenceCycle() // 순환 참조 발생
    resolveReferenceCycleWithWeak() // weak 참조로 해결
    resolveReferenceCycleWithUnowned() // unowned 참조로 해결
}

// main 함수에서 테스트 실행
func main() {
    testClosureBasics()
    testHigherOrderFunctions()
    testIntroducibleProtocolUsage()
    testDeliveryStatusErrorHandling()
    
    testCarClassesFunctionality()
    testSortableBoxGenericUsage()
    testStrongWeakUnownedReferenceCycles()
}

main()
