import Foundation
// source : https://www.raywenderlich.com/138190/swift-algorithm-club-swift-tree-data-structure

/***************************************************
 Make general-purpose tree
 -. String
 -> Generic
 ***************************************************/

// String Version
/* class Node {
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
} */

// Generic Version
class Node<T> {
    var value: T
    var children: [Node] = []
    weak var parent: Node?
    
    init(value: T) {
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

let tea = Node(value: "tea")
let coffee = Node(value: "coffee")
let cocoa = Node(value: "cocoa")
hotBeverage.add(child: tea)
hotBeverage.add(child: coffee)
hotBeverage.add(child: cocoa)

let blackTea = Node(value: "black")
let greenTea = Node(value: "green")
let chaiTea = Node(value: "chai")
tea.add(child: blackTea)
tea.add(child: greenTea)
tea.add(child: chaiTea)

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

print(beverages)
// beverages {hot {tea {black, green, chai} , coffee, cocoa} , cold}

print(blackTea.parent)
print(blackTea.parent!.parent)


/***************************************************
 Search
 ***************************************************/

// String Version
//extension Node {
//    func search(value: String) -> Node? {

// Generic Version
extension Node where T: Equatable {
    func search(value: T) -> Node? {
        if value == self.value {
            return self
        }
        
        for child in children {
            if let found = child.search(value: value) {
                return found
            }
        }
        return nil
    }
}

if let SearchHot = beverages.search(value: "hot") {
    print(SearchHot.description)
}


// Generic - Case (value: Int) Test
let number = Node(value: 5)
let testNum = Node(value: 3)
number.add(child: testNum)

print(number)





