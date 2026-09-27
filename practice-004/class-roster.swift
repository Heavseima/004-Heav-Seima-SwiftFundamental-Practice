
var roster: [String] = ["Dara", "Sok", "Bopha"]

roster.append("Rithy")

roster.insert("Vicheka", at: 0)

print("All Data: \(roster)")
print("Count: \(roster.count)")
if let firstName = roster.first {
    print("First: \(firstName)")
}

roster.remove(at: 2)
print("After removing: \(roster)")

let containsDara = roster.contains("Dara")
print("Has Dara: \(containsDara)")

let sortedRoster = roster.sorted()
print("Sorted: \(sortedRoster)")
