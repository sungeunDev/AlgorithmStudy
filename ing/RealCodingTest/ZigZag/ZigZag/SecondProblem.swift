//
//  SecondProblem.swift
//  ZigZag
//
//  Created by sungnni on 2018. 5. 3..
//  Copyright © 2018년 ohteam. All rights reserved.
//

import UIKit

class SecondProblem: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("second")
        
        parsing(str: "AM 10:12:34", idx: 0)
    }
}

/***************************************************
2. 12시간 단위 시계 -> 24시간 단위 변환
 -. 12시간 단위로 표시된 (예: "AM hh:mm:ss") 현재 시각 P와 N이 매개변수로 주어졌을 때, N초 후의 시간을 24시간 단위 표시의 string형으로 return
 -. N은 200,000 이하인 자연수
 -. Date 관련 클래스 사용하지 말 것
 ***************************************************/

extension SecondProblem {
    func second(str: String, n: Int) -> String {
        var returnResult = ""
        
        let dayCheck = 0
        let hourCheck = 3
        let minCheck = 6
        let secCheck = 9
        
        let hour = Int(parsing(str: str, idx: hourCheck))!
        let min = Int(parsing(str: str, idx: minCheck))!
        let sec = Int(parsing(str: str, idx: secCheck))!
        
        let dayStr = parsing(str: str, idx: dayCheck)
        
        // 초 단위로 시간 바꾸기
        var time = min * 60 + sec
        
        if dayStr == "AM" {
            time += hour * 3600
        } else if dayStr == "PM" {
            time += (hour + 12) * 3600
        }
        
        // N 초 더하기
        time += n
        
        // 24시간 형태로 변환하기

        
        return returnResult
    }
    
    func parsing(str: String, idx: Int) -> String {
//        var returnResult = ""
        let subStr = str[str.index(str.startIndex, offsetBy: idx)...str.index(str.startIndex, offsetBy: idx+1)]
//        print(returnResult)
        return String(subStr)
    }
    
    // 초 -> 24시간 형태
    func change24Time(of sec: Int) -> String {
        
        
        return ""
    }
}
