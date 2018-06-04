# BinarySearchTree

## ㅁ Binary Tree Data Structure
> ![Binary Tree Data Structure](https://koenig-media.raywenderlich.com/uploads/2016/07/BinaryTree.png)

- A binary tree is a tree where each node has 0, 1, or 2 children. The important bit is that 2 is the max – that’s why it’s binary.

### ㅇ 용어
- Left Child 
> -. The left child descends from the left side.  
> -. The value of a left child must be less than the value of its parent.  
> 
> ![left](https://koenig-media.raywenderlich.com/uploads/2016/08/BinaryTree-2.png)


- Right Child
> -. The value of a right child must be greater than or equal to the value of its parent.  
>  
> ![right](https://koenig-media.raywenderlich.com/uploads/2016/08/BinaryTree-2-1.png)

### ㅇ Traversal algorithms
- In-order traversal

![in-order traversal](https://github.com/sungeunDev/AlgorithmStudy/blob/master/2.Theory/DataStructures/BinarySearchTree/image/in-order.png)
> // 0 - 1 - 5 - 7 - 8 - 9
> 
>In-order raversal visits the nodes of a binary tree in the following order, starting from the root node. 
>  
> - If the current node has a left child, recursively visit this child first.  
> - Then visit the node itself.  
> - If the current node has a right child, recursively visit this child.  


- Pre-order traversal

![pre-order traversal](https://github.com/sungeunDev/AlgorithmStudy/blob/master/2.Theory/DataStructures/BinarySearchTree/image/pre-order.png)
> // 7 - 1 - 0 - 5 - 9 - 8   
> 
>Pre-order traversal always visits the current node first, then recursively visits the left and right child.  

- Post-order traversal

![pre-order traversal](https://github.com/sungeunDev/AlgorithmStudy/blob/master/2.Theory/DataStructures/BinarySearchTree/image/post-order.png)
> // 0 - 5 - 1 - 8 - 9 - 7
> 
>Post-order traversal only visits the current node after the left and right child have been visited recursively. In other words, given any node, you’ll visit its children before visiting itself. An interesting consequence of this is that the root node is always visited last.

<br>

## ㅁ Binary Search Trees (BST)
- BST is a data structures that facilitates fast lookup, addition, and removal operations.
- average complexity : O(log n).  
  -. BST is considerably faster than linear data structures such as arrays and linked lists.  

### ㅇ Removing elements
- Case 1. Leaf node

- Case 2. Nodes with one child
> -. Reconnect that one child with the rest of the tree

- Case 3. Nodes with two children
> -. There are two child nodes to reconnect, but the parent node only has space for one child.   
> -. Replace the node you removed with smallest node in its right subtree.   
> -. Base on the rules of the BST, this is the **leftmost** node of the right subtree.




<br>

## ㅁ Source
- [Raywenderlich - Swift Algorithm Club: Swift Binary Search Tree Data Structure](https://www.raywenderlich.com/139821/swift-algorithm-club-swift-binary-search-tree-data-structure)

-------------------------------------------

## Etc
#### - private(set): 
- [The Swift Programming Language (Swift 4.1) - Access Control](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AccessControl.html)
- [번역](http://minsone.github.io/mac/ios/swift-access-control-summary)
```
Getters와 Setters
상수와 변수, 속성 그리고 서브스크립트를 위한 getter와 setter는 자동적으로 상수, 변수, 속성 또는 서브스크립트가와 같은 접근 레벨을 받는다.
setter는 대응하는 getter보다 더 낮은 접근 수준을 가지며, 변수, 속성, 또는 서브스크립트의 읽기-쓰기 범위를 제한한다. 
var 또는 subscript 소개자 앞에 private(set) 또는 internal(set)으로 낮은 접근 수준을 할당한다.
이 규칙은 저장 속성 뿐만 아니라 계산 속성에도 적용된다. 심지어 저장 속성을 위한 명시적인 getter와 setter를 쓰지 않더라도 말이다. 
Swift는 계속 저장 속성의 백업 저장공간을 접근하기 위한 암시적인 getter와 setter로 종합한다. 

계산 속성에 명시적인 setter와 같은 방법으로 private(set)과 internal(set)이 합쳐진 setter의 접근 수준을 변경하는데 사용한다.
```


#### - Assertion
- **assert()**
- assertionFailure()
- **precondition()**
- preconditionFailure()
- fatalError()

- assert VS. precondition : [Link](http://seorenn.blogspot.kr/2016/05/swift-assertion.html)
```
< 정리 > 
assert() 와 assertionFailure() 함수는 디버그 모드(-Onone)에서만 동작(Evaluation)한다. 
즉 assert() 와 assertionFailure() 는 릴리즈 모드(-Ofast)에서는 아무런 역할을 하지 않는다.
precondition() 과 preconditionFailure() 함수는 디버그(-Onone)나 릴리즈(-Ofast) 모드를 가리지 않고 항상 체크한다. 
즉, 릴리즈로 빌드된 경우에도 예외상황이 발생한 위치와 함께 메시지도 확인 가능하다.

따라서 assert() 의 경우 개발 과정에서 마구 쓰더라도 실제 프로덕션 단계의 앱의 성능에는 영향을 끼치지 않으니 걱정할 필요가 없다라고 결론 낼 수 있다.
```


#### - dropFirst()
- Returns a subsequence containing all but the first element of the sequence

```swift
let numbers = [1, 2, 3, 4, 5]
print(numbers.dropFirst())
// Prints "[2, 3, 4, 5]"
``` 
