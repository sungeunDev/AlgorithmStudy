import Foundation

// function declaration
func countApplesAndOranges(s: Int, t: Int, a: Int, b: Int, apples: [Int], oranges: [Int]) -> Void {

var appleCount = 0
var orangeCount = 0

for apple in apples {
	if apple >= s-a && apple <= t-a {
	appleCount += 1
	}
} 

for orange in oranges {
        if orange >= s-b && orange <= t-b {
        orangeCount += 1
        }
}

print(appleCount)
print(orangeCount)
}

let num = 5
var input: [String] = []

for _ in 0..<num {
	let inputText = readLine()!
	input.append(inputText)
}

// seperating variables from input
func separate(str: String) -> [Int]{
return str.split(separator: " ").map{ Int($0)! }
}

// variable declaration
let s = separate(str: input[0])[0]
let t = separate(str: input[0])[1]

let a = separate(str: input[1])[0]
let b = separate(str: input[1])[1]

let m = separate(str: input[2])[0]
let n = separate(str: input[2])[1]

let apples: [Int]  = separate(str: input[3])
let oranges: [Int] = separate(str: input[4])


// function call
countApplesAndOranges(s: s, t: t, a: a, b: b, apples: apples, oranges: oranges)
