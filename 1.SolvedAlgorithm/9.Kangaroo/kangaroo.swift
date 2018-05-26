func kangaroo(x1: Int, v1: Int, x2: Int, v2: Int) -> String {
    
    if v1 > v2 {
        let numOfJump = Double(x2 - x1) / Double(v2 - v1)
        if floor(numOfJump) == numOfJump {
            return "YES"
        } else {
            return "NO"
        }
    } else {
        return "NO"
    }
}
