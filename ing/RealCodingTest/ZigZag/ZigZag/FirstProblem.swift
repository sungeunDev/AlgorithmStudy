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
        
        
        minBeautifulYear(of: 1987)
    }
}

/***************************************************
 1. 아름다운 연도 (0-9까지 숫자가 중복없이 사용된 연도)
 -. 특정 연도 P가 매개변수로 주어질 때, 해당 연도보다 큰 아름다운 연도 중 가장 작은 아름다운 연도를 return
 -. 연도 P : 1,000 이상 10,000 이하의 자연수
 ***************************************************/

extension FirstProblem {
    
    func minBeautifulYear(of year: Int) -> Int {
        
        // 1. year 가 아름다운 연도인지 체크
        var yearCopy = year
        var yearList: [Int] = []
        
        while yearCopy > 0 {
            yearList.append(yearCopy%10)
            yearCopy /= 10
        }
        
        for num in yearList {
            let bool = yearList.contains(num)
            
        }
        
        // 2. 아니라면 year + 1 한 후 return 재귀함수
        // 3. 맞으면 해당 year를 return
        
        print(yearList)
        print(yearCopy)
        
        return 9
    }
    
    func twice() {
        
        let year = 1987
        let numList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
        
        
    }
}


