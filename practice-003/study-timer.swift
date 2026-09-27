
var totalMinutes = 0
var sessionCount = 0

while totalMinutes < 100 {
    sessionCount += 1
    totalMinutes += 25
    print("Session \(sessionCount): \(totalMinutes) minutes")
}

print("Goal reached in \(sessionCount) sessions.")

var countdown = 0

repeat {
    print("\(countdown)...")
    countdown -= 1
} while countdown > 0

print("Break time!")