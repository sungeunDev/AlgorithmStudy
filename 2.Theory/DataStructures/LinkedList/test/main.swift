// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public func example(of description: String, action: () -> Void) {
    print("---Example of \(description)---")
    action()
    print()
}

example(of: "creating of linking nodes") {
    let node1 = Node(value: 1)
    let node2 = Node(value: 2)
    let node3 = Node(value: 3)

    node1.next = node2
    node2.next = node3

    print(node1)
}

example(of: "push") {
    var list = LinkedList<Int>()
    list.push(1)
    list.push(2)
    list.push(3)

    print(list)
}

example(of: "append") {
    var list = LinkedList<Int>()
    list.append(1)
    list.append(2)
    list.append(3)

    print(list)
}

example(of: "inserting at a particular index") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)

    print("Before inserting: \(list)")
    var middleNode = list.node(at: 1)!
    for i in 0...4 {
        middleNode = list.insert(i, after: middleNode)
    }
    print("After inserting: \(list)")

    let poppedValue = list.pop()
    print("After popping list: \(list)")
    print("Popped value: " + String(describing: poppedValue))
}


example(of: "removing the last node") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)

  print("Before removing last node: \(list)")
  let removedValue = list.removeLast()

  print("After removing last node: \(list)")
  print("Removed value: " + String(describing: removedValue))
}


example(of: "removing a node after a particular node") {
  var list = LinkedList<Int>()
  list.push(3)
  list.push(2)
  list.push(1)

  print("Before removing at particular index: \(list)")
  let index = 1
  let node = list.node(at: index - 1)!
  let removedValue = list.remove(after: node)

  print("After removing at index \(index): \(list)")
  print("Removed value: " + String(describing: removedValue))
}

example(of: "using collection") {
  var list = LinkedList<Int>()
  for i in 0...9 {
    list.append(i)
  }

  print("List: \(list)")
  print("First element: \(list[list.startIndex])")
  print("Array containing first 3 elements: \(Array(list.prefix(3)))")
  print("Array containing last 3 elements: \(Array(list.suffix(3)))")

  let sum = list.reduce(0, +)
  print("Sum of all values: \(sum)")
}


example(of: "linked list cow") {
  var list1 = LinkedList<Int>()
  list1.append(1)
  list1.append(2)

  // print("List1 uniquely referenced: \(isKnownUniquelyReferenced(&list1.head))")
  var list2 = list1
  // print("List1 uniquely referenced: \(isKnownUniquelyReferenced(&list1.head))")

  print("List1: \(list1)")
  print("List2: \(list2)")

  print("After appending 3 to list2")
  list2.append(3)
  print("List1: \(list1)")
  print("List2: \(list2)")
}
