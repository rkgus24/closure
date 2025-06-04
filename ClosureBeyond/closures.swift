//
//  Closures.swift
//  ClosureBeyond
//
//  Created by 노가현 on 6/2/25.
//

import Foundation

let sum: (Int, Int) -> String = { a, b in
    "두 수의 합은 \(a + b)입니다"
}

func calculator(closure: (Int, Int) -> String) {
    let result = closure(4, 5)
    print(result)
}
