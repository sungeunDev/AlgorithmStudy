public struct LinkedList<Value> {

    public var head: Node<Value>?
    public var tail: Node<Value>?

    public init() { }

    public var isEmpty: Bool {
        return head == nil
    }

    // head-first insertion : inserting at head
    public mutating func push(_ value: Value) {
      copyNodes()
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }

    // tail-end insertion : inserting at tail
    public mutating func append(_ value: Value) {
      copyNodes()
        guard !isEmpty else { return push(value) }

        tail!.next = Node(value: value)
        tail = tail!.next
    }

    // returns a node at given index
    public func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0

        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }

        return currentNode
    }

    // insert after a node
    @discardableResult
    public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
      copyNodes()
        guard tail !== node else {
            append(value)
            return tail!
        }

        node.next = Node(value: value, next: node.next)
        return node.next!
    }

    @discardableResult
    public mutating func pop() -> Value? {
      copyNodes()
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }

    @discardableResult
    public mutating func removeLast() -> Value? {
      copyNodes()
      // if head is nil, nothing to remove, so return nil.
      guard let head = head else {
        return nil
      }

      // if the list only consists of one node, removeLast is functionally equivalent to pop.
      guard head.next != nil else {
        return pop()
      }

      var prev = head
      var current = head

      // if the number of nodes is two or more, find last node and remove
      while let next = current.next {
        prev = current
        current = next
      }

      prev.next = nil
      tail = prev

      return current.value
    }


    @discardableResult
    public mutating func remove(after node: Node<Value>) -> Value? {
      copyNodes()
      defer {
        if node.next === tail {
          tail = node
        }
        node.next = node.next?.next
      }
      return node.next?.value
    }



}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}

extension LinkedList: Collection {

  public struct Index: Comparable {

    public var node: Node<Value>?

    static public func ==(lhs: Index, rhs: Index) -> Bool {
        switch (lhs.node, rhs.node) {
        case let (left?, right?):
          return left.next === right.next
        case (nil, nil):
          return true
        default:
          return false
        }
    }

    static public func <(lhs: Index, rhs: Index) -> Bool {
      guard lhs != rhs else {
        return false
      }
      let nodes = sequence(first: lhs.node) { $0?.next }
      return nodes.contains { $0 === rhs.node }
    }
  }

  public var startIndex: Index {
    return Index(node: head)
  }

  public var endIndex: Index {
    return Index(node: tail?.next)
  }

  public func index(after i: Index) -> Index {
    return Index(node: i.node?.next)
  }

  public subscript(position: Index) -> Value {
    return position.node!.value
  }

  // Value sementics and copy-on-write
  private mutating func copyNodes() {

    // O(n) overhead on every mutating call is unacceptable.
    // The first is to avoid copying when the nodes only have one owner.
    guard !isKnownUniquelyReferenced(&head), 
    var oldNode = head else { return }

    head = Node(value: oldNode.value)
    var newNode = head

    while let nextOldNode = oldNode.next {
      newNode!.next = Node(value: nextOldNode.value)
      newNode = newNode!.next

      oldNode = nextOldNode
    }

    tail = newNode
  }


}
