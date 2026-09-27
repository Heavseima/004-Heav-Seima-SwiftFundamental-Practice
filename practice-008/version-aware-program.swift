#if compiler(>=6.0)
let compilerMessage = "Compiled with Swift 6 or newer"
#else
let compilerMessage = "Compiled with an older Swift version"
#endif

let studentCount = 0

if studentCount == 0 {
    print("Runtime check: no students yet")
} else {
    print("Runtime check: students found")
}

print(compilerMessage)

#if os(macOS)
print("Running on macOS")
#elseif os(Linux)
print("Running on Linux")
#endif