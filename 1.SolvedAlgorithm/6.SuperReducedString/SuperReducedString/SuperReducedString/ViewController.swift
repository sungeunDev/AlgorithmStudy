//
//  ViewController.swift
//  SuperReducedString
//
//  Created by sungnni on 2018. 5. 17..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(superReducedString(s: "aaabccddd"))
    }

    func superReducedString(s: String) -> String {
        var array: [Character] = []
        for cha in s {
            
            if array.isEmpty {
                array.append(cha)
                continue
            } else {
                if cha == array.last! {
                    array.removeLast()
                    continue
                } else {
                    array.append(cha)
                }
            }
        }
     
        if array.isEmpty {
            return "String"
        } else {
            return String(array)
        }
    }
}

//        ** 참고사항 - <알파벳 배열 만들기>
//        let alphabets: [Character] = (0..<26).map {
//            Character(UnicodeScalar("a".unicodeScalars.first!.value + $0)!)
//        }
