public protocol Queue {
  associatedtype Element

  mutating func enqueue(_ element: Element) -> Bool
  mutating func dequeue() -> Element?
  var isEmpty: Bool { get }
  var peek: Element? { get }
}

// Array-based implementation
public struct QueueArray<T>: Queue {
  private var array: [T] = []
  public init() {}

  public var isEmpty: Bool {
    return array.isEmpty
  }

  public var peek: T? {
    return array.first
  }

  @discardableResult
  public mutating func enqueue(_ element: T) -> Bool {
    array.append(element)
    return true
  }

  @discardableResult
  public mutating func dequeue() -> T? {
    return isEmpty ? nil : array.removeFirst()
  }
}

extension QueueArray: CustomStringConvertible {
  public var description: String {
    return array.description
  }
}


// Doubly linked list implementation
public class QueueLinkedList<T>: Queue {
  private var list = DoublyLinkedList<T>()
  public init() {}

  public var isEmpty: Bool {
    return list.isEmpty
  }

  public var peek: T? {
    return list.first?.value
  }

  @discardableResult
  public func enqueue(_ element: T) -> Bool {
    list.append(element)
    return true
  }

  @discardableResult
  public func dequeue() -> T? {
    guard !list.isEmpty,
    let element = list.first else { return nil }

    return list.remove(element)
  }
}

extension QueueLinkedList: CustomStringConvertible {
  public var description: String {
    return list.description
  }
}
