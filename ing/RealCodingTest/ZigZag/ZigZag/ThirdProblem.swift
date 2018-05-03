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
        print(third(str: "asdf12nmd46kj[]r596029"))
    }
}

/***************************************************
3. 주어진 문자열에서 숫자 추출하여 그 중 홀수인 숫자들의 제곱의 합을 반환
 -. 문자열 길이는 100 이하
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
    
    func third2(str: String) -> Int {
        
        
        
        return 3
    }
}
