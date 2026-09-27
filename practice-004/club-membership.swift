var codingClub: Set<String> = ["Dara", "Sok", "Bopha"]
let mathClub: Set<String> = ["Sok", "Rithy", "Bopha"]

codingClub.insert("Dara")

let inBoth = codingClub.intersection(mathClub).sorted()

let allMembers = codingClub.union(mathClub).sorted()

print("Coding club size: \(codingClub.count)")
print("In both clubs: \(inBoth)")
print("All members: \(allMembers)")