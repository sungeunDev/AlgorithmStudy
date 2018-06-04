public struct BinarySearchTree<Element: Comparable> {

  public private(set) var root: BinaryNode<Element>?

  public init() {}
}


extension BinarySearchTree: CustomStringConvertible {
  public var description: String {
    return root?.description ?? "empty tree"
  }
}


extension BinarySearchTree {

  // <insert>
  // exposed to users
  public mutating func insert(_ value: Element) {
    root = insert(from: root, value: value)
  }

  // as a private helper method
  private func insert(from node: BinaryNode<Element>?, value: Element)
    -> BinaryNode<Element> {

      // This is a recursive method, so it requires a base case for terminating recursion.
    guard let node = node else { return BinaryNode(value: value) }

    if value < node.value {
      node.leftChild = insert(from: node.leftChild, value: value)
    } else {
      node.rightChild = insert(from: node.rightChild, value: value)
    }

    return node
  }

  // <find>
  // 클로저가 이해안됨 ㅠㅜ
  public func contains(_ value: Element) -> Bool {

// O(log n)
    var current = root
    while let node = current {
      if node.value == value {
        return true
      }

      if value < node.value {
        current = node.leftChild
      } else {
        current = node.rightChild
      }
    }
    return false

// 비효율적. O(n)
  //   guard let root = root else { return false }
  //
  //   var found = false
  //   root.traverseInOrder {
  //     if $0 == value {
  //       found = true
  //     }
  //   }
  //   return found
  }


// 제거 파트 다시 보기!!!!!
  // <remove>
  public mutating func remove(_ value: Element) {
    root = remove(node: root, value: value)
  }


  private func remove(node: BinaryNode<Element>?, value: Element)
    -> BinaryNode<Element>? {

      guard let node = node else { return nil }

      if value == node.value {
        if node.leftChild == nil && node.rightChild == nil {
          return nil
        }

        if node.leftChild == nil {
          return node.rightChild
        }

        if node.rightChild == nil {
          return node.leftChild
        }

        node.value = node.rightChild!.min.value
        node.rightChild = remove(node: node.rightChild, value: value)

      } else if value < node.value {
        node.leftChild = remove(node: node.leftChild, value: value)
      } else {
        node.rightChild = remove(node: node.rightChild, value: value)
      }
      return node
    }

}
