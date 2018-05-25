let money = 10
let chocoCost = 2
let needsWraps = 5

func chocolateFeast(n: Int, c: Int, m: Int) -> Int {
    var eatChoco = money / chocoCost // 5개
    var presentWraps = eatChoco // 5개

    while presentWraps >= needsWraps {
    let moreEat = presentWraps / needsWraps // 5/5 = 1
        eatChoco += moreEat // 6
        presentWraps = (presentWraps % needsWraps) + moreEat // 1
    }
    
    return eatChoco
}


print(chocolateFeast(n: money, c: chocoCost, m: needsWraps))
