// find day of the programmer - the 256day of the year
let dayOfTheProgrammer = 256

// test input
let input1 = 2017
let input2 = 2016

// Helper, if needed
func find(leap year: Int) -> Bool {
  // Julian calenday system 1700-1917)
  // Gregorian calendar system - Leap Year 1919 ~
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
  } else if year % 4 == 0 {
    if year % 100 == 0 {
      return false
    } else {
      return true
    }
  } else {
    return false
  }
}

// Logic - HackerRank version
func solveVerHackerRank(year: Int) -> String {

    guard year != 1918 else { return "26.09.1918" }

    if find(leap: year) {
        return "12.09.\(year)"
    } else {
        return "13.09.\(year)"
    }
}


// addtional helper - 응용버전
func changeDoubleDigit(_ num: Int) -> String {
  if num < 10 {
    return "0\(num)"
  } else {
    return String(num)
  }
}

// Logic - 응용버전
func solve(year: Int, after day: Int) -> String {

// make calendar
  var dayOfMonth = Array<Int>(repeating: 0, count: 13)

  for month in stride(from: 1, to: dayOfMonth.count, by: 1) {
    switch month {
    case 1, 3, 5, 7, 8, 10, 12:
      dayOfMonth[month] = 31
    case 4, 6, 9, 11:
      dayOfMonth[month] = 30
    case 2:
      dayOfMonth[month] = 28
    default:
      print("error this case")
    }
  }

  if year == 1918 {
    return "26.09.1918"
  } else if find(leap: year) {
    dayOfMonth[2] = 29
  }

// find after day & month
  let month = (day / 30) + 1

  var sum = 0
  for idx in 1..<month {
    sum += dayOfMonth[idx]
  }

  let monthStr = changeDoubleDigit(month)
  let dayStr = changeDoubleDigit(day - sum)

  return "\(dayStr).\(monthStr).\(year)"
}
// output form - dd.mm.yyyy


// Main
print(solve(year: input1, after: dayOfTheProgrammer))
print(solve(year: input2, after: dayOfTheProgrammer))

print(solve(year: 1800, after: dayOfTheProgrammer))
print(solve(year: 1918, after: dayOfTheProgrammer))
