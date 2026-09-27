import Foundation

// MARK: - Student Model

struct Student {
    let id: Int
    var name: String
    var age: Int
    var email: String?
    var scores: [Int]

    var average: Double? {
        guard !scores.isEmpty else {
            return nil
        }

        let total = scores.reduce(0, +)

        return Double(total) / Double(scores.count)
    }

    var grade: String {
        guard let average = average else {
            return "—"
        }

        switch average {
        case 90...100:
            return "A"

        case 80..<90:
            return "B"

        case 70..<80:
            return "C"

        case 50..<70:
            return "D"

        default:
            return "F"
        }
    }
}


// MARK: - Storage

var students: [Int: Student] = [:]


// MARK: - Validation Helpers

func readNewStudentID() -> Int {
    while true {
        print("Student ID: ", terminator: "")

        let input = (readLine() ?? "")
            .trimmingCharacters(in: .whitespaces)

        guard let id = Int(input) else {
            print("Error: ID must be a whole number.")
            continue
        }

        guard id > 0 else {
            print("Error: ID must be greater than 0.")
            continue
        }

        guard students[id] == nil else {
            print("Error: ID \(id) already exists.")
            continue
        }

        return id
    }
}


func readExistingStudentID() -> Int {
    while true {
        print("Student ID: ", terminator: "")

        let input = (readLine() ?? "")
            .trimmingCharacters(in: .whitespaces)

        guard let id = Int(input) else {
            print("Error: ID must be a whole number.")
            continue
        }

        guard id > 0 else {
            print("Error: ID must be greater than 0.")
            continue
        }

        guard students[id] != nil else {
            print("Not found.")
            continue
        }

        return id
    }
}


func readValidName(prompt: String = "Name: ") -> String {
    while true {
        print(prompt, terminator: "")

        let input = (readLine() ?? "")
            .trimmingCharacters(in: .whitespaces)

        guard !input.isEmpty else {
            print("Error: Name cannot be empty.")
            continue
        }

        return input
    }
}


func readValidAge(prompt: String = "Age: ") -> Int {
    while true {
        print(prompt, terminator: "")

        let input = (readLine() ?? "")
            .trimmingCharacters(in: .whitespaces)

        guard let age = Int(input) else {
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


func readValidEmail() -> String? {
    while true {
        print("Email (optional): ", terminator: "")

        let input = (readLine() ?? "")
            .trimmingCharacters(in: .whitespaces)

        if input.isEmpty {
            return nil
        }

        guard input.contains("@") else {
            print("Error: Email must contain @.")
            continue
        }

        return input
    }
}


func readValidScore() -> Int {
    while true {
        print("Score: ", terminator: "")

        let input = (readLine() ?? "")
            .trimmingCharacters(in: .whitespaces)

        guard let score = Int(input) else {
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


func readUpdatedName(currentName: String) -> String {
    while true {
        print("Name [\(currentName)]: ", terminator: "")

        let rawInput = readLine() ?? ""

        // Pressing Enter keeps the old value.
        if rawInput.isEmpty {
            return currentName
        }

        let input = rawInput.trimmingCharacters(in: .whitespaces)

        guard !input.isEmpty else {
            print("Error: Name cannot be empty.")
            continue
        }

        return input
    }
}


func readUpdatedAge(currentAge: Int) -> Int {
    while true {
        print("Age [\(currentAge)]: ", terminator: "")

        let input = (readLine() ?? "")
            .trimmingCharacters(in: .whitespaces)

        // Enter keeps current age.
        if input.isEmpty {
            return currentAge
        }

        guard let age = Int(input) else {
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


func readUpdatedEmail(currentEmail: String?) -> String? {
    while true {
        print(
            "Email [\(currentEmail ?? "not provided")]: ",
            terminator: ""
        )

        let rawInput = readLine() ?? ""

        // Pressing Enter keeps current email.
        if rawInput.isEmpty {
            return currentEmail
        }

        let input = rawInput.trimmingCharacters(in: .whitespaces)

        guard !input.isEmpty else {
            print("Error: Email cannot contain only spaces.")
            continue
        }

        guard input.contains("@") else {
            print("Error: Email must contain @.")
            continue
        }

        return input
    }
}


func readConfirmation(prompt: String) -> Bool {
    while true {
        print(prompt, terminator: "")

        let input = (readLine() ?? "")
            .trimmingCharacters(in: .whitespaces)
            .lowercased()

        switch input {
        case "y":
            return true

        case "n":
            return false

        default:
            print("Error: Please enter y or n.")
        }
    }
}


// MARK: - Display Helpers

func averageText(for student: Student) -> String {
    guard let average = student.average else {
        return "—"
    }

    return String(format: "%.2f", average)
}


func printStudent(_ student: Student) {
    print("""
    ID: \(student.id)
    Name: \(student.name)
    Age: \(student.age)
    Email: \(student.email ?? "not provided")
    Average: \(averageText(for: student))
    Grade: \(student.grade)
    """)
}


func printStudentTable(_ list: [Student]) {
    guard !list.isEmpty else {
        print("No students found.")
        return
    }

    print("ID\tName\tAverage\tGrade")

    for student in list {
        print(
            "\(student.id)\t\(student.name)\t\(averageText(for: student))\t\(student.grade)"
        )
    }
}


// MARK: - 1. Add Student

func addStudent() {
    let id = readNewStudentID()
    let name = readValidName()
    let age = readValidAge()
    let email = readValidEmail()

    let student = Student(
        id: id,
        name: name,
        age: age,
        email: email,
        scores: []
    )

    students[id] = student

    print("Student added.")
}


// MARK: - 2. View All Students

func viewStudents() {
    guard !students.isEmpty else {
        print("No students yet.")
        return
    }

    let sortedStudents = students.values.sorted {
        $0.id < $1.id
    }

    printStudentTable(sortedStudents)
}


// MARK: - 3. Search Student

func searchStudent() {
    guard !students.isEmpty else {
        print("No students yet.")
        return
    }

    while true {
        print("Search by ID or name: ", terminator: "")

        let query = (readLine() ?? "")
            .trimmingCharacters(in: .whitespaces)

        guard !query.isEmpty else {
            print("Error: Search cannot be empty.")
            continue
        }

        // Exact ID search
        if let id = Int(query) {
            if let student = students[id] {
                printStudent(student)
            } else {
                print("Not found.")
            }

            return
        }

        // Partial case-insensitive name search
        let loweredQuery = query.lowercased()

        let matches = students.values
            .filter {
                $0.name.lowercased().contains(loweredQuery)
            }
            .sorted {
                $0.name.lowercased() < $1.name.lowercased()
            }

        guard !matches.isEmpty else {
            print("Not found.")
            return
        }

        for student in matches {
            printStudent(student)
            print()
        }

        return
    }
}


// MARK: - 4. Update Student

func updateStudent() {
    guard !students.isEmpty else {
        print("No students yet.")
        return
    }

    let id = readExistingStudentID()

    guard var student = students[id] else {
        return
    }

    print("Press Enter to keep the current value.")

    student.name = readUpdatedName(
        currentName: student.name
    )

    student.age = readUpdatedAge(
        currentAge: student.age
    )

    student.email = readUpdatedEmail(
        currentEmail: student.email
    )

    students[id] = student

    print("Student updated.")
}


// MARK: - 5. Delete Student

func deleteStudent() {
    guard !students.isEmpty else {
        print("No students yet.")
        return
    }

    let id = readExistingStudentID()

    guard let student = students[id] else {
        return
    }

    let confirmed = readConfirmation(
        prompt: "Delete \(student.name)? (y/n): "
    )

    if confirmed {
        students.removeValue(forKey: id)
        print("Student deleted.")
    } else {
        print("Delete cancelled.")
    }
}


// MARK: - 6. Add Score

func addScore() {
    guard !students.isEmpty else {
        print("No students yet.")
        return
    }

    let id = readExistingStudentID()

    guard var student = students[id] else {
        return
    }

    let score = readValidScore()

    student.scores.append(score)

    students[id] = student

    print("Score added.")
}


// MARK: - 7. Class Report

func classReport() {
    guard !students.isEmpty else {
        print("No students yet.")
        return
    }

    print("\n===== CLASS REPORT =====")

    let sortedStudents = students.values.sorted {
        $0.id < $1.id
    }

    printStudentTable(sortedStudents)

    // Only students who actually have scores are included.
    let averages = students.values.compactMap {
        $0.average
    }

    guard !averages.isEmpty else {
        print("\nClass average: —")
        return
    }

    let total = averages.reduce(0, +)
    let classAverage = total / Double(averages.count)

    print(
        "\nClass average: \(String(format: "%.2f", classAverage))"
    )
}


// MARK: - Filter Helpers

func filterByGrade() {
    guard !students.isEmpty else {
        print("No students yet.")
        return
    }

    while true {
        print("Grade (A/B/C/D/F): ", terminator: "")

        let grade = (readLine() ?? "")
            .trimmingCharacters(in: .whitespaces)
            .uppercased()

        let validGrades = ["A", "B", "C", "D", "F"]

        guard validGrades.contains(grade) else {
            print("Error: Grade must be A, B, C, D, or F.")
            continue
        }

        let matches = students.values
            .filter {
                $0.grade == grade
            }
            .sorted {
                $0.name.lowercased() < $1.name.lowercased()
            }

        if matches.isEmpty {
            print("No students found.")
        } else {
            printStudentTable(matches)
        }

        return
    }
}


func showPassingStudents() {
    guard !students.isEmpty else {
        print("No students yet.")
        return
    }

    let passing = students.values
        .filter { student in
            guard let average = student.average else {
                return false
            }

            return average >= 50
        }
        .sorted {
            ($0.average ?? -1) > ($1.average ?? -1)
        }

    guard !passing.isEmpty else {
        print("No passing students.")
        return
    }

    printStudentTable(passing)
}


func showFailingStudents() {
    guard !students.isEmpty else {
        print("No students yet.")
        return
    }

    let failing = students.values
        .filter { student in
            guard let average = student.average else {
                return false
            }

            return average < 50
        }
        .sorted {
            ($0.average ?? -1) > ($1.average ?? -1)
        }

    guard !failing.isEmpty else {
        print("No failing students.")
        return
    }

    printStudentTable(failing)
}


func sortByName() {
    guard !students.isEmpty else {
        print("No students yet.")
        return
    }

    let sortedStudents = students.values.sorted {
        $0.name.lowercased() < $1.name.lowercased()
    }

    printStudentTable(sortedStudents)
}


func sortByAverage() {
    guard !students.isEmpty else {
        print("No students yet.")
        return
    }

    let sortedStudents = students.values.sorted {
        let firstAverage = $0.average ?? -1
        let secondAverage = $1.average ?? -1

        if firstAverage == secondAverage {
            return $0.name.lowercased() < $1.name.lowercased()
        }

        return firstAverage > secondAverage
    }

    printStudentTable(sortedStudents)
}


// MARK: - 8. Filter & Sort Menu

func filterAndSort() {
    guard !students.isEmpty else {
        print("No students yet.")
        return
    }

    while true {
        print("""
        
        ===== FILTER & SORT =====
        1. Filter by grade
        2. Passing students
        3. Failing students
        4. Sort by name A-Z
        5. Sort by average high-low
        0. Back
        """)

        print("Choose an option: ", terminator: "")

        let choice = (readLine() ?? "")
            .trimmingCharacters(in: .whitespaces)

        switch choice {
        case "1":
            filterByGrade()
            return

        case "2":
            showPassingStudents()
            return

        case "3":
            showFailingStudents()
            return

        case "4":
            sortByName()
            return

        case "5":
            sortByAverage()
            return

        case "0":
            return

        default:
            print("Invalid option.")
        }
    }
}


// MARK: - Main Menu

mainLoop: while true {
    print("""
    
    ===== ACADEMIC MANAGER =====
    1. Add student
    2. View all students
    3. Search student
    4. Update student
    5. Delete student
    6. Add score
    7. Class report
    8. Filter & sort
    0. Exit
    """)

    print("Choose an option: ", terminator: "")

    let choice = (readLine() ?? "")
        .trimmingCharacters(in: .whitespaces)

    switch choice {
    case "1":
        addStudent()

    case "2":
        viewStudents()

    case "3":
        searchStudent()

    case "4":
        updateStudent()

    case "5":
        deleteStudent()

    case "6":
        addScore()

    case "7":
        classReport()

    case "8":
        filterAndSort()

    case "0":
        print("Goodbye!")
        break mainLoop

    default:
        print("Invalid option.")
    }
}