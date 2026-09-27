import Foundation

enum EnrollmentError: Error {
    case courseNotFound(String)
    case courseFull(String)
    case alreadyEnrolled(String)
}

class Course {
    let code: String
    let title: String
    let capacity: Int
    var enrolledStudents: Set<String> = []
    
    var seatsLeft: Int {
        return capacity - enrolledStudents.count
    }
    
    init(code: String, title: String, capacity: Int) {
        self.code = code
        self.title = title
        self.capacity = capacity
    }
    
    func enroll(student: String) throws {
        if enrolledStudents.contains(student) {
            throw EnrollmentError.alreadyEnrolled(student)
        }
        if seatsLeft <= 0 {
            throw EnrollmentError.courseFull(code)
        }
        enrolledStudents.insert(student)
    }
}

class Registrar {
    // Dictionary mapping course code -> Course model
    var courses: [String: Course] = [:]
    
    func addCourse(_ course: Course) {
        courses[course.code] = course
    }
    
    func requestEnrollment(student: String, courseCode: String) {
        guard let course = courses[courseCode] else {
            print("Rejected \(student): \(courseCode) does not exist")
            return
        }
        
        do {
            try course.enroll(student: student)
            print("Enrolled \(student) in \(courseCode)")
        } catch EnrollmentError.alreadyEnrolled {
            print("Skipped: \(student) is already enrolled")
        } catch EnrollmentError.courseFull(let code) {
            print("Rejected \(student): \(code) is full")
        } catch {
            print("Failed to enroll \(student)")
        }
    }
    
    func printRoster(for courseCode: String) {
        guard let course = courses[courseCode] else { return }
        let roster = course.enrolledStudents.sorted().joined(separator: ", ")
        print("\n\(course.title): \(roster)")
        print("Seats left: \(course.seatsLeft)")
    }
}

let registrar = Registrar()
registrar.addCourse(Course(code: "SWE101", title: "Swift Fundamentals", capacity: 2))
registrar.addCourse(Course(code: "UX110", title: "Intro to UX", capacity: 30))

registrar.requestEnrollment(student: "Dara", courseCode: "SWE101")
registrar.requestEnrollment(student: "Sok", courseCode: "SWE101")
registrar.requestEnrollment(student: "Dara", courseCode: "SWE101")
registrar.requestEnrollment(student: "Bopha", courseCode: "SWE101")
registrar.requestEnrollment(student: "Rithy", courseCode: "CS999")

registrar.printRoster(for: "SWE101")