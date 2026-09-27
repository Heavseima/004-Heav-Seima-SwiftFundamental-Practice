let score = 45
let attendance = 70
let gpa = 2.1


var grade = ""

if score >= 90 {
    grade = "A"
} else if score >= 80 {
    grade = "B"
} else if score >= 70 {
    grade = "C"
} else if score >= 50 {
    grade = "D"
} else {
    grade = "F"
}

var message = "" 

switch grade {
    case "A" :
        message = "Excellent!"
    case "B", "C" :
        message = "Good work, keep going!"
    case "D" :
        message = "You passed. Aim higher next time."
    case "F" :
        message = "Please see your instructor."
    default :
        message = "Meet your instructor"
} 

print("Score: \(score)")
print("Grade: \(grade)")
print("Pass: \(score >= 50 ? "Pass" : "Fail")")
print("Message: \(message)")
print("Scholarship: \(gpa >= 3.5 && attendance >= 90 ? "Eligible" : "not Eligible")")
print("Warning: \(score < 50 && attendance < 75 ? "at Risk" : "None")")