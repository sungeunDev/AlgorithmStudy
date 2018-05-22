import Foundation
import UIKit
// source : https://www.raywenderlich.com/138190/swift-algorithm-club-swift-tree-data-structure

/***************************************************
 make Node class
 ***************************************************/
class Node {
    var value: String
    var children: [Node] = []
    
    // parent : optional - becuase not all nodes have parents - such as root node in a tree
    // and made it weak to avoid retain cycles.
    weak var parent: Node?
    
    init(value: String) {
        self.value = value
    }
    
    func add(child: Node) {
        children.append(child)
        child.parent = self
    }
}


/***************************************************
 Challenge: Beverage
 ***************************************************/
let beverages = Node(value: "beverages")
let hotBeverage = Node(value: "hot")
let coldBeverage = Node(value: "cold")

beverages.add(child: hotBeverage)
beverages.add(child: coldBeverage)


/***************************************************
 Printing Trees
 : To aid the compiler, you'll need to make Node adopt <<the CustomStringConvertible protocol>>
 
 -. Custom String Convertible
 ㄴ A type with a customized textual representation
 ㄴ link : https://developer.apple.com/documentation/swift/customstringconvertible
 ***************************************************/
extension Node: CustomStringConvertible {
    
    var description: String {
        var text = "\(value)"
        if !children.isEmpty {
            text += " {" + children.map { $0.description }.joined(separator: ", ") + "} "
        }
        return text
    }
    
}






