//
//  ViewController.swift
//  BalancedBrackets
//
//  Created by sungnni on 2018. 5. 16..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        let first = "{[()]}"
        let second = "{[(])}"
        let third = "{{[[(())]]}}"
        
        let fourth = "[](){()}"
        let fifth = "{)[](}]}]}))}(())("
        
//        print(isBalanced(s: first))
//        print(isBalanced(s: second))
//        print(isBalanced(s: third))
        
//        print(isBalanced(s: fourth))
//        print(isBalanced(s: fifth))
        
        print(isBalancedList(sList: [first, second, third, fourth, fifth]))
    }
    
    
    // stack 자료구조 이용
    func isBalanced(s: String) -> String {
        
        // 문자열 홀수개일 경우 거르기
        if s.count % 2 != 0 {
            return "NO"
        }
        
        // check
        // 문자열 배열에 저장
        var array: [Character] = []
        for cha in s {
            switch cha {
            case "{" :
                fallthrough // fallthrough - 다음 case 문을 진행하는 것.
            case "[" :
                fallthrough
            case "(" :
                array.append(cha) // stack push
                break
                
            default:
                // 첫번째에 ), }, ] 가 나오면 거르기
                if array.isEmpty {
                    return "NO"
                } else {
                    // 저장되어있는 배열이 있을 경우 (, {, [ 매칭 체크하기
                    // 매칭될 경우, 해당 괄호 remove (stack pop)
                    switch array.last {
                    case "{" :
                        if cha == "}" {
                            array.removeLast()
                            break
                        } else {
                            return "NO"
                        }
                    case "[" :
                        if cha == "]" {
                            array.removeLast()
                            break
                        } else {
                            return "NO"
                        }
                    case "(" :
                        if cha == ")" {
                            array.removeLast()
                            break
                        } else {
                            return "NO"
                        }
                    default :
                        return "NO"
                    }
                }
            }
        }
        
        // 배열이 비어있을 경우, YES (모두 다 remove된 경우)
        if array.isEmpty {
            return "YES"
        } else {
            return "NO"
        }
    }

    
    func isBalancedList(sList: [String]) -> [String] {
        var returnResult: [String] = []
        for s in sList {
            let result = isBalanced(s: s)
            returnResult.append(result)
        }
        return returnResult
    }
    
}

