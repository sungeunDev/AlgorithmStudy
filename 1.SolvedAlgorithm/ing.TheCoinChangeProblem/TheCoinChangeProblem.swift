import Foundation

// Hepler, if needed
func printMatrix(of list: [[Int]]) {
	var string = ""

		for i in 0..<list.count {
		string = ""

		for j in 0..<list[i].count {
			string += String(list[i][j]) + " "
		}
		print(string)
	}
}

// Logic
func solve(n: Int, c: [Int]) {
	var table: [[Int]] = []

	for i in 0..<c.count {

		// for _ in 1...n {
		// 	table[i].append(0)
		// }

		let line = Array<Int>(repeating: 0, count: n+1)
		table.append(line)
		table[i][0] = 1
	}

	printMatrix(of: table)
}


// Solution 01. Recursive algorithm
func recursive(n: Int, c: [Int]) -> Int {

	// defer {
	// print(n, c)
	// }

	if n == 0 {
		return 1
	} else if c.count == 0 {
		return 0
	} else {
		var i = 0
		if (n-c[0]) >= 0 {
			i = recursive(n: n-c[0], c: c)
		}
		var array = c
		array.removeFirst()
		return i + recursive(n: n, c: array)
	}
}


// Main
// solve(n: 8, c: [2, 3, 5, 8])
print("input => n: 6, c: [1, 2, 3]")
print(recursive(n: 6, c: [1, 2, 3]))

print("input => n: 10, c: [2, 5, 3, 6]")
print(recursive(n: 10, c: [2, 5, 3, 6]))
