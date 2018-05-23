# Tree

## ㅁ Tree Data Structure
![Tree Data Structure](https://koenig-media.raywenderlich.com/uploads/2016/06/Tree-2.png)


## ㅁ 트리 구조의 장점
- representing a hierarchical relationship between objects
- making searches quick and efficient
- providing a sorted list of data
- powering prefix matching in text fields

## ㅁ 용어
- Root: 0th level’s node of a tree. 트리 구조의 시작점
- Node: a block of data in the tree structure. root는 node이기도 함.
- Leaf: a node with no children. (= terminal node)

- Height of the tree: number of links between the root node and the lowest leaf. 
- Depth of a node: The number of links between this node and the root node

## ㅁ Implementation in Swift
- general-purpose tree
```swift
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
```

### ㅁ Other Trees 
> Sometimes you don't need to have a parent property at all.  
Maybe you only need to give each node a maximum of two children - such a tree is called a binary tree.  
A very common type of tree is the binary search tree (or BST), a stricter version of a binary tree where the nodes are ordered in a particular way to speed up searches.
```

- Binary Search Tree
- Binary Tree
- Minimum Spanning Tree (unweighted)
- Red-Black Tree

<br>

## ㅁ Source
- [Raywenderlich - Swift Algorithm Club: Swift Tree Data Structure](https://www.raywenderlich.com/138190/swift-algorithm-club-swift-tree-data-structure)