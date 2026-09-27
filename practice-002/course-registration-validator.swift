func register(name: String, age: Int, hasPaid: Bool) {

    guard !name.isEmpty else {
        print("Error: Name is required.")
        return
    }

    guard age >= 16 else {
        print("Error: \(name) is too young to register.")
        return
    }
    
    guard hasPaid else {
        print("Error: \(name) has not paid the fee.")
        return
    }

    print("\(name) is registered.")
}


register(name: "Dara", age: 20, hasPaid: true)
register(name: "Sok", age: 15, hasPaid: true)
register(name: "Vicheka", age: 19, hasPaid: false)
register(name: "", age: 22, hasPaid: true)