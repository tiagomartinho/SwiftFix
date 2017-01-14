class ClassToFix {
    func doSomething(with person: Person) {
    }
}

class Foo {
    func bar() {
        let classToFix = ClassToFix()
        classToFix.notExistingMethod()

        classToFix.notExistingVar = "some string"

        classToFix.doSomething(with: uninitializedVariablePerson)
    }
}

struct Person {
    let name: String
    let age: Int
}
