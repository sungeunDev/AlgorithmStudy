// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public func example(of description: String, action: () -> Void) {
    print("---Example of \(description)---")
    action()
    print()
}


var exampleTree: BinarySearchTree<Int> {
  var bst = BinarySearchTree<Int>()
  bst.insert(3)
  bst.insert(1)
  bst.insert(4)
  bst.insert(0)
  bst.insert(2)
  bst.insert(5)
  return bst
}

example(of: "building a BST") {
  print(exampleTree)
}


example(of: "finding a node") {
  if exampleTree.contains(5) {
    print("Found 5")
  } else {
    print("Couldn't find 5")
  }
}
