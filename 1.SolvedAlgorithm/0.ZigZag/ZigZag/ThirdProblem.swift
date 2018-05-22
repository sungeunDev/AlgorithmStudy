//
//  File.swift
//  ZigZag
//
//  Created by sungnni on 2018. 5. 3..
//  Copyright © 2018년 ohteam. All rights reserved.
//

import UIKit

class ThirdProblem: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("third")
//        print(third(str: "asdf12nmd46kj[]r596029"))
        
        third2(str: "asdfqwepr23419®9")
    }
}

/***************************************************
3. 주어진 문자열에서 숫자 추출하여 그 중 홀수인 숫자들의 제곱의 합을 반환
 -. 문자열 길이는 100 이하
 
 -. 붙어있는 숫자 문자열은 수 하나로 계산해서 처리해야 함.
 
 ***************************************************/

extension ThirdProblem {
    
    // 1차 시도. 홀수가 중복으로 나오면 count 못함.
    // >> 보완 : 문자열 하나하나 체크하며 횟수 카운트 해야 함.
    func third(str: String) -> Int {
        
        let odd = [1, 3, 5, 7, 9]
        var returnResult: Int = 0
        
        for num in odd {
            print("num: ", num)
            if str.contains(String(num)) {
                returnResult += num * num
                print("returnResult: ", returnResult)
            }
        }
        return returnResult
    }
    
    
    // 2차 시도. 정답!!
    // String.characters >> String 문자의 character 배열 값.
    // String.characters.indices >> 해당 character의 index 배열 값. -> for문 활용하여 str[idx]로 해당 character 이용 가능.
    func third2(str: String) -> Int {
        
        var returnResult = 0
        for idx in str.characters.indices {
            if let num = Int(String(str[idx])) {
                if num % 2 != 0 {
                    returnResult += num * num
                    print("num: ", num, "returnResult: ", returnResult)
                }
            }
        }
        print(returnResult)
        return returnResult
    }
}
