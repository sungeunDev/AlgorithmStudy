public struct LinkedList<Value> {

    public var head: Node<Value>?
    public var tail: Node<Value>?

    public init() { }

    public var isEmpty: Bool {
        return head == nil
    }

    // head-first insertion : inserting at head
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }

    // tail-end insertion : inserting at tail
    public mutating func append(_ value: Value) {
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
        guard tail !== node else {
            append(value)
            return tail!
        }

        node.next = Node(value: value, next: node.next)
        return node.next!
    }

    @discardableResult
    public mutating func pop() -> Value? {
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

}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}


// count
