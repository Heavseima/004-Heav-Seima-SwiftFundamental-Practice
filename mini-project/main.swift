import Foundation


// ==========================================================
// MARK: - M1 — Data Model, Add Student, View Students
// ==========================================================

struct Student {
    let id: Int
    var name: String
    var age: Int
    var email: String?
    var scores: [Int] = []

    var average: Double? {
        guard !scores.isEmpty else {
            return nil
        }

        return Double(scores.reduce(0, +)) / Double(scores.count)
    }

    var grade: String {
        guard let average else {
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


var students: [Student] = []


// MARK: - M1 Add Student

func addStudent() {
    let student = Student(
        id: readNewID(),
        name: readName(),
        age: readAge(),
        email: readEmail()
    )

    students.append(student)

    print("Student added.")
}


// MARK: - M1 View Students

func viewStudents() {
    guard !students.isEmpty else {
        print("No students yet.")
        return
    }

    let sortedStudents = students.sorted {
        $0.id < $1.id
    }

    showStudents(sortedStudents)
}



// ==========================================================
// MARK: - M2 — Search, Update, Delete
// ==========================================================


// MARK: - M2 Search Student

func searchStudent() {
    guard !students.isEmpty else {
        print("No students yet.")
        return
    }

    let query = input("Search by ID or name: ")

    guard !query.isEmpty else {
        print("Not found.")
        return
    }

    // Search by exact ID
    if let id = Int(query),
        let index = findStudentIndex(id: id) {

        showStudents([students[index]])
        return
    }

    // Search by part of name
    let results = students.filter {
        $0.name
            .lowercased()
            .contains(query.lowercased())
    }

    if results.isEmpty {
        print("Not found.")
    } else {
        showStudents(results)
    }
}


// MARK: - M2 Update Student

func updateStudent() {
    guard !students.isEmpty else {
        print("No students yet.")
        return
    }

    let index = readExistingStudentIndex()

    print("Press Enter to keep the current value.")

    // Update name
    let newName = input(
        "Name [\(students[index].name)]: "
    )

    if !newName.isEmpty {
        students[index].name = newName
    }


    // Update age
    while true {
        let value = input(
            "Age [\(students[index].age)]: "
        )

        if value.isEmpty {
            break
        }

        guard let age = Int(value) else {
            print("Error: Age must be a whole number.")
            continue
        }

        guard (16...60).contains(age) else {
            print("Error: Age must be between 16 and 60.")
            continue
        }

        students[index].age = age
        break
    }


    // Update email
    while true {
        let currentEmail =
            students[index].email ?? "not provided"

        let newEmail = input(
            "Email [\(currentEmail)]: "
        )

        if newEmail.isEmpty {
            break
        }

        guard newEmail.contains("@") else {
            print("Error: Email must contain @.")
            continue
        }

        students[index].email = newEmail
        break
    }

    print("Student updated.")
}


// MARK: - M2 Delete Student

func deleteStudent() {
    guard !students.isEmpty else {
        print("No students yet.")
        return
    }

    let index = readExistingStudentIndex()

    while true {
        let answer = input(
            "Delete \(students[index].name)? (y/n): "
        ).lowercased()

        if answer == "y" {
            students.remove(at: index)
            print("Student deleted.")
            return
        }

        if answer == "n" {
            print("Delete cancelled.")
            return
        }

        print("Error: Please enter y or n.")
    }
}



// ==========================================================
// MARK: - M3 — Scores, Averages, Grades, Class Report
// ==========================================================


// MARK: - M3 Add Score

func addScore() {
    guard !students.isEmpty else {
        print("No students yet.")
        return
    }

    let index = readExistingStudentIndex()
    let score = readScore()

    students[index].scores.append(score)

    print("Score added.")
}


// MARK: - M3 Class Report

func classReport() {
    guard !students.isEmpty else {
        print("No students yet.")
        return
    }

    print("\n===== CLASS REPORT =====")

    let sortedStudents = students.sorted {
        $0.id < $1.id
    }

    showStudents(sortedStudents)

    let averages = students.compactMap {
        $0.average
    }

    guard !averages.isEmpty else {
        print("\nClass average: —")
        return
    }

    let total = averages.reduce(0, +)

    let classAverage =
        total / Double(averages.count)

    print(
        "\nClass average: \(String(format: "%.2f", classAverage))"
    )
}



// ==========================================================
// MARK: - M4 — Filter and Sort
// ==========================================================

func filterAndSort() {
    guard !students.isEmpty else {
        print("No students yet.")
        return
    }

    print("""
    
    ===== FILTER & SORT =====
    1. Filter by grade
    2. Passing students
    3. Failing students
    4. Sort by name A-Z
    5. Sort by average high-low
    0. Back
    """)

    let choice = input("Choose an option: ")

    switch choice {

    // Filter by grade
    case "1":
        let grade =
            input("Grade (A/B/C/D/F): ")
                .uppercased()

        guard ["A", "B", "C", "D", "F"]
            .contains(grade) else {

            print("Invalid grade.")
            return
        }

        let result = students.filter {
            $0.grade == grade
        }

        showStudents(result)


    // Passing only
    case "2":
        let result = students.filter {
            guard let average = $0.average else {
                return false
            }

            return average >= 50
        }

        showStudents(result)


    // Failing only
    case "3":
        let result = students.filter {
            guard let average = $0.average else {
                return false
            }

            return average < 50
        }

        showStudents(result)


    // Sort name A-Z
    case "4":
        let result = students.sorted {
            $0.name.lowercased()
            <
            $1.name.lowercased()
        }

        showStudents(result)


    // Sort average high-low
    case "5":
        let result = students.sorted {
            ($0.average ?? -1)
            >
            ($1.average ?? -1)
        }

        showStudents(result)


    case "0":
        return


    default:
        print("Invalid option.")
    }
}



// ==========================================================
// MARK: - M5 — Validation and Error Handling
// ==========================================================
//
// Validation used throughout the program:
//
// ID:
// - Must be whole number
// - Must be > 0
// - Must be unique
//
// Name:
// - Cannot be empty
//
// Age:
// - Must be whole number
// - Must be 16...60
//
// Email:
// - Optional
// - Must contain @ when provided
//
// Score:
// - Must be whole number
// - Must be 0...100
//
// Menu:
// - Only 0...8 accepted
//
// Invalid input:
// - Shows specific error message
// - Validation loops ask again
// - Program does not crash
//
// Missing email:
// - Uses "not provided"
//
// Missing scores:
// - Average and grade display "—"
//


// MARK: - Main Menu

func showMenu() {
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
}


func run() {
    while true {
        showMenu()

        let option = input("Choose an option: ")

        switch option {

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
            return

        default:
            print("Invalid option.")
        }
    }
}


run()