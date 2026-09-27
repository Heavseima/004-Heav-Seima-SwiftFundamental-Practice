func average(of scores: [Int]) -> Double {
    guard !scores.isEmpty else { return 0.0 }
    let total = Double(scores.reduce(0, +))
    return total / Double(scores.count)
}

func letterGrade(for average: Double) -> String {
    switch average {
    case 90...: return "A"
    case 80...: return "B"
    case 70...: return "C"
    case 50...: return "D"
    default:    return "F"
    }
}

func printReport(_ name: String, scores: [Int]) {
    let avg = average(of: scores)
    let grade = letterGrade(for: avg)
    print("\(name): average \(avg), grade \(grade)")
}

printReport("Dara", scores: [80, 90, 85])
printReport("Sok", scores: [60, 70, 65])


// ====================================================================
// STYLE 1: The Default (One Name Provided)
// --------------------------------------------------------------------
// - Swift automatically uses the parameter name for two different jobs.
// - External: It acts as the label you type when calling the function.
// - Internal: It acts as the local variable name used inside the body.
// ====================================================================

// ====================================================================
// STYLE 2: Explicit Labels (Two Names Provided)
// --------------------------------------------------------------------
// - The first word is the external Argument Label (readability outside).
// - The second word is the internal Parameter Name (logic inside).
// - This lets you read the function call like a natural sentence.
// ====================================================================

// ====================================================================
// STYLE 3: Omitted Labels (Underscore Used)
// --------------------------------------------------------------------
// - An underscore '_' is placed where the external label usually goes.
// - This tells Swift to hide the label entirely when calling it.
// - You can pass values directly into the function with no labels.
// ====================================================================
