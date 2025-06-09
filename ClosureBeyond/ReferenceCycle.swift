//
//  ReferenceCycle.swift
//  ClosureBeyond
//
//  Created by 노가현 on 6/9/25.
//

import Foundation

class A {
    var b: B?
    let name: String

    init(name: String) {
        self.name = name
        print("A init")
    }

    deinit {
        print("A deinit")
    }
}

class B {
    weak var a: A?
    var closure: (() -> Void)?

    init() {
        print("B init")
    }

    deinit {
        print("B deinit")
    }
}

func createStrongReferenceCycle() {
    print("[순환 참조 시작]")

    let a = A(name: "a-instance")
    let b = B()

    a.b = b
    b.a = a

    // strong reference 캡처 → 순환 참조 발생
    b.closure = {
        print("클로저 내부에서 A 접근 : \(a.name)")
    }

    print("[순환 참조 끝]")
}

func resolveReferenceCycleWithWeak() {
    print("[weak 시작]")

    var a: A? = A(name: "a-instance")
    var b: B? = B()

    a?.b = b
    b?.a = a

    b?.closure = { [weak a] in
        print("클로저 내부에서 A 접근 : \(a?.name ?? "nil")")
    }

    a = nil
    b = nil

    print("[weak 끝]")
}

func resolveReferenceCycleWithUnowned() {
    print("[unowned 시작]")

    var a: A? = A(name: "a-instance")
    var b: B? = B()

    a?.b = b
    b?.a = a

    if let unwrappedA = a {
        b?.closure = { [unowned unwrappedA] in
            print("클로저 내부에서 A 접근 : \(unwrappedA.name)")
        }
    }

    a = nil
    b = nil

    print("[unowned 끝]")
}

func main() {
    print("----- 순환 참조 -----")
    createStrongReferenceCycle()

    print("\n----- weak -----")
    resolveReferenceCycleWithWeak()

    print("\n----- unowned -----")
    resolveReferenceCycleWithUnowned()
}
