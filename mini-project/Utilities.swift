import Foundation

// M1 utilities: input, lookup, formatting, display, and new-student validation.
func input(_ message: String) -> String {
    print(message, terminator: "")
    return readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
}

func findStudentIndex(id: Int) -> Int? { students.firstIndex { $0.id == id } }

func averageText(_ student: Student) -> String {
    guard let average = student.average else { return "—" }
    return String(format: "%.2f", average)
}

func showStudents(_ list: [Student]) {
    guard !list.isEmpty else {
        print("No students found.")
        return
    }
    print("\nID\tName\tAverage\tGrade")
    for student in list {
        print("\(student.id)\t\(student.name)\t\(averageText(student))\t\(student.grade)")
    }
}

func readNewID() -> Int {
    while true {
        let value = input("Student ID: ")
        guard let id = Int(value) else {
            print("Error: ID must be a whole number.")
            continue
        }
        guard id > 0 else {
            print("Error: ID must be greater than 0.")
            continue
        }
        guard findStudentIndex(id: id) == nil else {
            print("Error: ID \(id) already exists.")
            continue
        }
        return id
    }
}

func readName() -> String {
    while true {
        let name = input("Name: ")
        guard !name.isEmpty else {
            print("Error: Name cannot be empty.")
            continue
        }
        return name
    }
}

func readAge() -> Int {
    while true {
        let value = input("Age: ")
        guard let age = Int(value) else {
            print("Error: Age must be a whole number.")
            continue
        }
        guard (16...60).contains(age) else {
            print("Error: Age must be between 16 and 60.")
            continue
        }
        return age
    }
}

func readEmail() -> String? {
    while true {
        let email = input("Email (optional): ")
        if email.isEmpty { return nil }
        guard email.contains("@") else {
            print("Error: Email must contain @.")
            continue
        }
        return email
    }
}


// M2 utilities: validation for operations on an existing student.

func readExistingStudentIndex() -> Int {
    while true {
        let value = input("Student ID: ")
        guard let id = Int(value) else {
            print("Error: ID must be a whole number.")
            continue
        }
        guard id > 0 else {
            print("Error: ID must be greater than 0.")
            continue
        }
        guard let index = findStudentIndex(id: id) else {
            print("Not found.")
            continue
        }
        return index
    }
}


// M3 utilities: score validation before adding scores or calculating reports.

func readScore() -> Int {
    while true {
        let value = input("Score: ")
        guard let score = Int(value) else {
            print("Error: Score must be a whole number.")
            continue
        }
        guard (0...100).contains(score) else {
            print("Error: Score must be between 0 and 100.")
            continue
        }
        return score
    }
}
