//
//  closures.swift
//  ClosureBeyond
//
//  Created by 노가현 on 6/2/25.
//

import Foundation

let sum: (Int, Int) -> String = { a, b in
    let result = a + b
    return "두 수의 합은 \(result)입니다"
}

func calculator(closure: (Int, Int) -> String) {
    let result = closure(4, 5)
    print(result)
}
