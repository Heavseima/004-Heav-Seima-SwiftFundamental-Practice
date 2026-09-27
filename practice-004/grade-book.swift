var gradeBook: [String: Int] = [
    "Dara": 88,
    "Sok": 74
]

gradeBook["Bopha"] = 91

gradeBook["Sok"] = 79

gradeBook.removeValue(forKey: "Dara")

let bophaScore = gradeBook["Bopha", default: 0]
let rithyScore = gradeBook["Rithy", default: 0]

print("Bopha: \(bophaScore)")
print("Rithy: \(rithyScore)")

print("Entries: \(gradeBook.count)")
for (name, score) in gradeBook {
    print("\(name) -> \(score)")
}


/*
 -----------------------------------------------------------------------
 COLLECTION COMPARISON (School App Examples)
 -----------------------------------------------------------------------
 
 1. ARRAY ([T])
    - Keeps Order? YES (indexed sequence: 0, 1, 2...)
    - Allows Duplicates? YES
    - How to Find: By index `array[0]` or linear search `array.contains(x)`
    - School App Example: Student Submission Queue / Attendance Log
      (Order matters for who turned it in first; multiple students can have same scores)
 
 2. SET (Set<T>)
    - Keeps Order? NO (unordered)
    - Allows Duplicates? NO (unique items only)
    - How to Find: Direct lookup `set.contains(x)` (Instant O(1))
    - School App Example: Event Check-in Registry
      (Ignores duplicate badge scans; fast check to see if student already entered)
 
 3. DICTIONARY ([Key: Value])
    - Keeps Order? NO (unordered key-value pairs)
    - Allows Duplicates? Keys: NO | Values: YES
    - How to Find: Key lookup `dict["Dara"]` (Instant O(1))
    - School App Example: Student Grade Book
      (Maps unique Student ID or Name -> Grade/Profile)
 -----------------------------------------------------------------------
 */
