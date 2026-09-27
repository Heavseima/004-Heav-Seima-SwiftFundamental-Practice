class Person {
    var name: String

    init(name: String) {
        self.name = name
    }

    func introduce() -> String {
        return "Hi, I'm \(name)."
    }
}

class Teacher: Person {
    var subject: String

    init(name: String, subject: String) {
        self.subject = subject
        super.init(name: name)
    }

    override func introduce() -> String {
        return "Hi, I'm \(name) and I teach \(subject)."
    }
}

let teacherA = Teacher(name: "Mr. Sok", subject: "Swift")

let teacherB = teacherA

teacherB.name = "Ms. Sophea"

print(teacherA.introduce())
print(teacherB.introduce())


// struct
// → value type
// → copies are independent
// → no class inheritance
// → changing method needs mutating

// class
// → reference type
// → variables can share same object
// → supports inheritance
// → can override methods
// → uses super for parent class