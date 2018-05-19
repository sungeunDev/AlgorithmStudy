# Super Reduced String

- Date: 2018-05-17   
- Language: Swift 
<br>

```swift
    func superReducedString(s: String) -> String {
        var array: [Character] = []
        for cha in s {
            
            if array.isEmpty {
                array.append(cha)
                continue
            } else {
                if cha == array.last! {
                    array.removeLast()
                    continue
                } else {
                    array.append(cha)
                }
            }
        }
     
        if array.isEmpty {
            return "String"
        } else {
            return String(array)
        }
    }

//        ** 참고사항 - <알파벳 배열 만들기>
//        let alphabets: [Character] = (0..<26).map {
//            Character(UnicodeScalar("a".unicodeScalars.first!.value + $0)!)
//        }
```

<br>

- [Question Link](https://www.hackerrank.com/challenges/reduced-string/problem)
- Source: [HackerRank](https://www.hackerrank.com/)
