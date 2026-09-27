

for i in 1...10 {
    print("\(7) x \(i) = \(7*i)")
}

print("=======================================")

for i in 1..<10 {
    print("\(7) x \(i) = \(7*i)")
}

print("=======================================")

let swiftTopics: [String] = ["Variables", "Conditionals", "Loops", "Collections"]

print("Method 1:\n")
for i in 0..<swiftTopics.count {
    print("\(i+1). \(swiftTopics[i])")
}

print("=======================================")

print("Method 2:\n")
/*
    .enumerated() is a built-in method you call on a collection (like an array) when you 
    need to know both the position of an item and the item itself at the same time.
*/
for (index, value) in swiftTopics.enumerated() {
    print("\(index + 1). \(value)")
}