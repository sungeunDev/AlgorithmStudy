//
//  ViewController.swift
//  JesseAndCookies
//
//  Created by sungnni on 2018. 5. 20..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        print(sortMin(array: [3, 9, 10, 12, 5]))
        
//        print(cookies2(k: 7, A: [1, 2, 3, 9, 10, 12]))
//        print(cookies2(k: 7, A: [1, 2]))
        print(cookies2(k: 90, A: [13, 47, 74, 12, 89, 74, 18, 38]))

//        print(cookies2(k: 3, A: [13, 47, 74, 12, 89, 74, 18, 38]))
    }
    
    
    /***************************************************
     cookies
     ***************************************************/
    func cookies(k: Int, A: [Int]) -> Int {
        var array = sortMin(array: A)
        
        var count = 0
        var result = array[0]
        
        while result < k {
            if array.count < 2 {
                return -1
            }
                count += 1
                let danger = array[0] * 1 + array[1] * 2
            if result < k {
                array.removeFirst()
                array.removeFirst()
                array.append(danger)
                array = sortMin(array: array)
                result = array[0]
            }
        }
        return count
    }
    
    // 배열 값 작은 순서대로 배치하기
    func sortMin(array: [Int]) -> [Int] {
        var minList: [Int] = array
        var i = 0
        var j = i + 1
        
        while i < array.count-1 {
            while j <= array.count - 1 {
                if minList[i] <= minList[j] {
                    j += 1
                } else {
                    let temp = minList[i]
                    minList[i] = minList[j]
                    minList[j] = temp
                    j = i + 1
                }
            }
            i += 1
            j = i + 1
        }
        return minList
    }
    
    
    /***************************************************
     cookies2
     ***************************************************/
    func cookies2(k: Int, A: [Int]) -> Int {
        
        var array = A
        var count = 0
        var result = findMinNum(array: array).1
        
        while result < k {
            if array.count < 2 {
                return -1
            }
            
            count += 1
            
            let firstMin = findMinNum(array: array) // firstMin.0 - index, firstMin.1 - value
            var danger = firstMin.1  * 1
            array.remove(at: firstMin.0)
            
            let secondMin = findMinNum(array: array)
            danger += secondMin.1  * 2
            array.remove(at: secondMin.0)
            
            array.append(danger)
            result = findMinNum(array: array).1
        }
        return count
    }
    
    // 배열 중 최소값 찾기
    func findMinNum(array: [Int]) -> (Int, Int) {
        var minNum = array[0]
        var index = 0
        
        for (idx, num) in array.enumerated() {
            if num <= minNum {
                minNum = num
                index = idx
            }
        }
        return (index, minNum)
    }
    
    

}

