//
//  FirstProblem.swift
//  ZigZag
//
//  Created by sungnni on 2018. 5. 3..
//  Copyright © 2018년 ohteam. All rights reserved.
//

import UIKit

class FirstProblem: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("first")
        self.view.backgroundColor = .white
        
        
        print(minBeautifulYear(of: 1111))
    }
}

/***************************************************
 1. 아름다운 연도 (0-9까지 숫자가 중복없이 사용된 연도)
 -. 특정 연도 P가 매개변수로 주어질 때, 해당 연도보다 큰 아름다운 연도 중 가장 작은 아름다운 연도를 return
 -. 연도 P : 1,000 이상 10,000 이하의 자연수
 ***************************************************/

extension FirstProblem {
    
    func minBeautifulYear(of year: Int) -> Int {
        
        // 1. year+1 가 아름다운 연도인지 체크
        var yearCopy = year+1
        var yearList: [Int] = []

        while yearCopy > 0 {
            yearList.append(yearCopy%10)
            yearCopy /= 10
        }

        for idx in 0..<yearList.count-1 {
            
            // 2. 아니라면 year + 1를 재귀함수로 return
            for j in idx+1..<yearList.count {
                if yearList[idx] == yearList[j] {
                    return minBeautifulYear(of: year+1)
                }
            }
        }
        
        // 3. 맞으면 해당 year+1를 return
        return year+1
    }
}


