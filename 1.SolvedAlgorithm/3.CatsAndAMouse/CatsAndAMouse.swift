import Foundation

func catAndMouse(x: Int, y: Int, z: Int) -> String {

    var aDistance = x-z
    var bDistance = y-z
    
    if aDistance < 0 {
        aDistance *= -1
    } 
    if bDistance < 0 {
        bDistance *= -1
    }
    
    if aDistance < bDistance {
        return "Cat A"
    } else if aDistance > bDistance {
        return "Cat B"
    } else {
        return "Mouse C"
    }
    
}
