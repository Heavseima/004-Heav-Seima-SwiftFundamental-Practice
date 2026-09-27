struct Student {
    let id: Int
    var name: String
    var gpa: Double

    func summary() -> String {
        return "\(id) - \(name) (GPA \(gpa))"
    }

    // mutating keyword allows its own method to change its own properties
    mutating func updateGPA(to newGPA: Double) {
        gpa = newGPA
    }
}

let original = Student(id: 1001, name: "Dara", gpa: 3.75)

var copy = original

copy.updateGPA(to: 3.90)

print("Original: \(original.summary())")
print("Copy: \(copy.summary())")