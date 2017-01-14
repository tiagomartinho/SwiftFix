class ClassToFix {

}

class Foo {

    func bar() {
        let classToFix = ClassToFix()
        classToFix.notExistingMethod()

        classToFix.notExistingVar = "some string"
    }
}
