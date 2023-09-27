struct Person {
    let name: String
    var children: [Person] = []
}

extension Person {
    func printHierarchy(indentation: String = "") -> String {
        var result = "\(indentation)--\(name)\n"
        for child in children {
            result += child.printHierarchy(indentation: "\(indentation)|  ")
        }
        return result
    }
}

let persons = [
    Person(name: "Mary",
           children: [Person(name: "Roi",
                             children: [
                               Person(name: "Ali", children: [Person(name: "Chip")]),
                               Person(name: "Rudolf", children: [Person(name: "Judith"), Person(name: "Christine")])
                               ]
                            ),
                      Person(name: "Aaron", children: [Person(name: "Mohammed")])
                     ]),
    Person(name: "Eve", children: [Person(name: "Raphael")])
]

let result = persons.map { $0.printHierarchy() }.joined()

let expectedResult =
"""
|--Mary
|  |--Roi
|  |  |--Ali
|  |  |  |--Chip
|  |  |--Rudolf
|  |  |  |--Judith
|  |  |  |--Christine
|  |--Aaron
|  |  |--Mohammed
|--Eve
|  |--Raphael
"""

if result == expectedResult {
    print("The two strings match perfectly")
} else {
    print(result)
}

