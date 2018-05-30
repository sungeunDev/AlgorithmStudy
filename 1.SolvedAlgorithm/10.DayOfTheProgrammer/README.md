# DayOfTheProgrammer

- Date: 2018-05-30 
- Language: Swift 
<br>

```swift
// Helper, if needed
func find(leap year: Int) -> Bool {
// leap year - divisible by 400, by 4 and not divisible by 100.
    
    if year < 1918 {
        if year % 4 == 0 {
            return true
        } else {
         return false   
        }
  }
    
  if year % 400 == 0 {
    return true
  } else if year % 100 != 0 && year % 4 == 0 {
    return true
  } else {
    return false
  }
}

// Logic
func solve(year: Int) -> String {
    
    guard year != 1918 else { return "26.09.1918" }
    
    if find(leap: year) {
        return "12.09.\(year)"
    } else {
        return "13.09.\(year)"
    }   
}
```

- Note: 
> 문제 잘 읽기! 특히, **범위**

<br>

- [Question Link](https://www.hackerrank.com/challenges/day-of-the-programmer/problem)
- Source: [HackerRank](https://www.hackerrank.com/)
