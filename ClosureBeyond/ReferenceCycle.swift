import Foundation

// 클래스 A: B를 참조하는 프로퍼티, 이름
class A {
    var b: B? // B를 강한 참조로 보유
    let name: String // 이름 저장

    init(name: String) {
        self.name = name
        print("A init") // 초기화 시
    }

    deinit {
        print("A deinit") // 메모리 해제 시
    }
}

// 클래스 B: A를 약한 참조로 갖고, 클로저 프로퍼티도 포함
class B {
    weak var a: A? // A를 약한 참조로 가짐 → 순환 참조 방지용
    var closure: (() -> Void)? // 클로저 저장 프로퍼티

    init() {
        print("B init") // 초기화 시
    }

    deinit {
        print("B deinit") // 메모리 해제 시
    }
}

// 순환 참조 (강한 참조만)
func createStrongReferenceCycle() {
    print("[순환 참조 시작]")
    let a = A(name: "a-instance")
    let b = B()
    
    a.b = b // A가 B를 강한 참조
    b.a = a // B가 A를 강한 참조
    
    // 클로저 내에서 a를 캡처
    b.closure = {
        print("클로저 내부에서 A 접근 : \(a.name)")
    }
    print("[순환 참조 끝]")
    // a와 b는 서로 강한 참조를 하고, 클로저도 a를 강하게 잡아 순환 참조 발생
    // deinit이 호출되지 않아 메모리 해제 안 됨
}

// weak 캡처로 순환 참조 해결
func resolveReferenceCycleWithWeak() {
    print("[weak 시작]")

    var a: A? = A(name: "a-instance")
    let b = B()

    a?.b = b
    b.a = a

    // 클로저 내에서 [weak a]로 약한 참조 캡처 → 클로저가 a를 강하게 잡지 않음
    b.closure = { [weak a] in
        guard let a = a else {
            print("a는 해제됨") // a가 이미 해제되었을 때 처리
            return
        }
        print("클로저 내부에서 A 접근 : \(a.name)")
    }

    a = nil // a를 해제하면 실제로 메모리에서 해제됨 (deinit 호출)
    print("[weak 끝]")
}

// unowned 캡처로 순환 참조 해결
func resolveReferenceCycleWithUnowned() {
    print("[unowned 시작]")

    var a: A? = A(name: "a-instance")
    let b = B()

    a?.b = b
    b.a = a

    // unowned는 약한 참조와 비슷하지만 nil이 되지 않는다는 가정 하에
    if let unwrappedA = a {
        b.closure = { [unowned unwrappedA] in
            print("클로저 내부에서 A 접근 : \(unwrappedA.name)")
        }
    }

    a = nil // a가 해제되어도 unowned는 nil 체크를 안 하기 때문에
            // 만약 클로저 실행 시점에 a가 해제되어 있으면 런타임 에러 발생
    print("[unowned 끝]")
}
