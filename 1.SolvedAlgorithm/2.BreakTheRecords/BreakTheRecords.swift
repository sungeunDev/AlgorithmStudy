import Foundation

func breakingRecords(score: [Int]) -> [Int] {

    var maxScore = score[0]
    var minScore = score[0]
    
    var maxCount = 0
    var minCount = 0
    
    for score in score {
        if score > maxScore {
            maxScore = score
            maxCount += 1
        } else if score < minScore {
            minScore = score
            minCount += 1
        }
    }
    
    let returnResult = [maxCount, minCount]
    return returnResult
}
