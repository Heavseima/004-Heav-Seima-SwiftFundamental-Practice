let score1 = 80
let score2 = 90
let score3 = 85

// Total
let total = score1 + score2 + score3

// Average
let average = Double(total) / 3.0

// Round down average to whole number 
let roundedAverage = Int(average)

let label = "Total: " + String(total)

// Output
print("Total: \(total)")
print("Average: \(average)")
print("Rounded average: \(roundedAverage)")
print("Label -> \(label)")