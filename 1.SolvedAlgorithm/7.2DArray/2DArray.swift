import Foundation

func array2D(arr: [[Int]]) -> Int {

    var sumArr: [Int] = []
    var sum = 0
    
    for i in 0...3 {
        for j in 0...3 {
            var sum = 0
            sum += arr[i][j] + arr[i][j+1] + arr[i][j+2] 
                + arr[i+1][j+1] 
                + arr[i+2][j] + arr[i+2][j+1] + arr[i+2][j+2]
            sumArr.append(sum)
        }
    }
    
    var max = sumArr[0]
    for num in sumArr {
        if num > max {
            max = num
        }
    }
    
    return max
}
