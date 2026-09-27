let scores: [Int] = [78, 92, -5, 64, 101, 88, -1, 70]

var valueScore = 0
var totalScore = 0 

for score in scores {

    if score == -1 { 
        print("End marker found. Stopping.")
        print("Value scores: \(valueScore)")
        print("Total: \(totalScore)")
        break 
    }

    if !(score >= 0 && score <= 100) {
        print("\(score) skipped (invalid)")
        continue
    }

    valueScore += 1
    totalScore += score
    print("\(score) accepted")

}
