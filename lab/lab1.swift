import Foundation

struct Student {
    let name: String
    let score: Int
    
    var isPassing: Bool {
        return score >= 50
    }
}

func analyzeScores(for students: [Student]) {
    print("===== SCORE ANALYZER =====")
    print("Students: \(students.count)")
    
    guard !students.isEmpty else {
        print("No student data available.")
        return
    }
    
    let totalScore = students.reduce(0) { $0 + $1.score }
    let average = Double(totalScore) / Double(students.count)
    print("Class average: \(String(format: "%.2f", average))\n")
    
    print("--- Results ---")
    for student in students {
        let status = student.isPassing ? "PASS" : "FAIL"
        print("\(student.name): \(student.score) \(status)")
    }
    print()
    
    if let highest = students.max(by: { $0.score < $1.score }), let lowest = students.min(by: { $0.score < $1.score }) {
        print("Highest: \(highest.name) (\(highest.score))")
        print("Lowest: \(lowest.name) (\(lowest.score))")
    }
    print()
    
    let passingNames = students
        .filter { $0.isPassing }
        .map { $0.name }
        .joined(separator: ", ")
    print("Passing: \(passingNames)\n")
    
    print("--- Ranking ---")
    let sortedStudents = students.sorted { $0.score > $1.score }
    for (index, student) in sortedStudents.enumerated() {
        print("\(index + 1). \(student.name) - \(student.score)")
    }
}

let classData = [
    Student(name: "Dara", score: 88),
    Student(name: "Sok", score: 45),
    Student(name: "Bopha", score: 92),
    Student(name: "Rithy", score: 67),
    Student(name: "Vicheka", score: 73),
    Student(name: "Sophea", score: 39)
]

analyzeScores(for: classData)