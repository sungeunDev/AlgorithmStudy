public class Node<Value> {

    public var value: Value
    public var next: Node?
    public var previous: Node?

    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
        next.previous = self
    }

    public init(value: Value) {
      self.value = value
    }
}

extension Node: CustomStringConvertible {

    public var description: String {
        guard let next = next else { return "\(value)"}
        return "\(value) -> " + String(describing: next) + " "
    }
}

// double linked list
// previous: Node

// node custom string
