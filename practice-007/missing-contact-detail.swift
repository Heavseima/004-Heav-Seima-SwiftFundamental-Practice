struct Student {
    let name: String
    var email: String? // Optional 
}

let dara = Student(name: "Dara", email: "dara@school.edu")
let sok = Student(name: "Sok", email: nil)
let students = [dara, sok]

for student in students {
    if let email = student.email {
        print("\(student.name): \(email)")
    } else {
        print("\(student.name): no email on file")
    }
}

let sokContact = sok.email ?? "not provided"
print("Sok's contact: \(sokContact)")

if let length = dara.email?.count {
    print("Dara's email length: \(length)")
}

func sendReminder(to student: Student) {
    guard let email = student.email else {
        print("Cannot remind \(student.name): missing email.")
        return
    }
    print("Reminder sent to \(email).")
}

sendReminder(to: dara)
sendReminder(to: sok)

// String?     → value may be missing
// nil         → no value
// if let      → unwrap if value exists
// ??          → fallback/default value
// ?.          → safely access through an optional
// guard let   → require value, otherwise exit early