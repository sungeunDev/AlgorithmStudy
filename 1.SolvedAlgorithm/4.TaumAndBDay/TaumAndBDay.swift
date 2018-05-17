import Foundation

func taumBday(b: Int, w: Int, bc: Int, wc: Int, z: Int) -> Int {

print(b, w, bc, wc, z)

/*
    if bc < wc + z && wc > z && bc > z {
	print("첫번째 케이스")
        return (b+w) * bc + z * w
    }    
    else if wc < bc + z && bc > z && wc > z {
        print("두번째 케이스")
        return (b+w) * wc + z * b
    } else {
        print("세번째 케이스")
        return b * bc + w * wc
    }
*/

if bc <= z && wc <= z {
	print("첫번째 케이스")
	return b * bc + w * wc
}
else if (bc <= z && z <= wc && bc + z <= wc) || (z <= bc && bc <= wc && bc + z <= wc) {
	print("두번째 케이스")
	return (b + w) * bc + w * z
} else if (wc <= z && z <= bc && wc + z <= bc) || (z <= wc && wc <= bc && wc + z <= bc) {
	print("세번째 케이스")
	return (b + w) * wc + b * z
} else {
return b * bc + w * wc
}

}

let num = Int(readLine()!)!

for _ in 0..<num {
	let bw = readLine()!.split(separator: " ").map{ String($0) }
	
	let b = Int(bw[0])!
	let w = Int(bw[1])!

	let price = readLine()!.split(separator: " ").map{ String($0) }
	let bc = Int(price[0])!
	let wc = Int(price[1])!
	let z = Int(price[2])!

let result = taumBday(b: b, w: w, bc: bc, wc: wc, z: z)
print(result)
}
