import Foundation

public class BinarySearchClass<T: Comparable> {
    private(set) public var value: T
    private(set) public var parent: BinarySearchClass?
    private(set) public var left: BinarySearchClass?
    private(set) public var right: BinarySearchClass?

    public init(value: T) {
        self.value = value
    }
    
    public convenience init(array: [T]) {
        precondition(array.count > 0)
        self.init(value: array.first!)
        for v in array.dropFirst() {
            insert(value: v)
        }
    }
    
    public var isRoot: Bool {
        return parent == nil
    }
    
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    public var isLeftChild: Bool {
        return parent?.left === self
    }
    
    public var isRightChild: Bool {
        return parent?.right === self
    }
    
    public var hasLeftChild: Bool {
        return left != nil
    }
    
    public var hasRightChild: Bool {
        return right != nil
    }
    
    public var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
    }
    
    public var hasBothChild: Bool {
        return hasLeftChild && hasRightChild
    }
    
    public var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
    
    
    public func insert(value: T) {
        
        // 자식 없을 경우, 중복 case 제거
        if !self.hasAnyChild && value == self.value {
            return
        }
        
        if value < self.value {
            if let left = left {
                left.insert(value: value)
            } else {
                left = BinarySearchClass(value: value)
                left?.parent = self
            }
        } else {
            if let right = right {
                right.insert(value: value)
            } else {
                right = BinarySearchClass(value: value)
                right?.parent = self
            }
        }
    }
}

extension BinarySearchClass: CustomStringConvertible {
    public var description: String {
        var text = ""
        if let left = left {
            text += "(\(left.description)) <- "
        }
        text += "\(value)"
        if let right = right {
            text += " -> (\(right.description))"
        }
        return text
    }
}

let tree = BinarySearchClass<Int>(array: [5, 5, 7, 10, 1, 3, 8, 5, 6, 7, 7, 4, 4, 5])
//print(tree)



