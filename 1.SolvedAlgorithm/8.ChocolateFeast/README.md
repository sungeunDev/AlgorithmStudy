# Chocolate Feast

- Date: 2018-05-25   
- Language: Swift 
<br>

```swift
func chocolateFeast(n: Int, c: Int, m: Int) -> Int {

    let money = n
    let chocoCost = c
    let needsWraps = m
    
    var eatChoco = money / chocoCost
    var presentWraps = eatChoco
    
    while presentWraps >= needsWraps {
        let moreEat = presentWraps / needsWraps 
        eatChoco += moreEat
        presentWraps = (presentWraps % needsWraps) + moreEat
    }
    
    return eatChoco
}
```

<br>

- [Question Link](https://www.hackerrank.com/challenges/chocolate-feast/problem)
- Source: [HackerRank](https://www.hackerrank.com/)
