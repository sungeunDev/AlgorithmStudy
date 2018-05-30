// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public func example(of description: String, action: () -> Void) {
    print("---Example of \(description)---")
    action()
    print()
}

example(of: "using a stack") {
  var stack = Stack<Int>()
  stack.push(1)
  stack.push(2)
  stack.push(3)
  stack.push(4)

  print(stack)

  if let poppedElement = stack.pop() {
    assert(4 == poppedElement, "poppedElement isn't 4")
    print("Popped: \(poppedElement)")
  }
}


example(of: "initializing a stack from an array") {
  let array = ["A", "B", "C", "D"]
  var stack = Stack(array)
  print(stack)

  stack.pop()
  print(stack)
}


example(of: "initializing a stack from an array literal") {
  var stack: Stack = [1.0, 2.0, 3.0, 4.0]
  print(stack)
  stack.pop()
  print(stack)
}
