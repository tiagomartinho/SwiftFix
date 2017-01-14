class MissingMethod {

}

class Foo {

    func bar() {
        let missingMethod = MissingMethod()
        missingMethod.notExistingMethod()
    }
}
