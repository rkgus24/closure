import Foundation

// 두 개의 정수를 받아서 두 수의 합은 _입니다 라는 문자열을 반환하는 클로저
let sum: (Int, Int) -> String = { a, b in
    "두 수의 합은 \(a + b)입니다"
}

// 두 개의 정수를 받아서 문자열을 반환하는 클로저를 실행하는 함수
func calculator(closure: (Int, Int) -> String) {
    // closure에 4와 5를 넣음
    let result = closure(4, 5)
    print(result)
}
