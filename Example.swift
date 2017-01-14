class ClassToFix {

  var notExistingVar = ""

  func notExistingMethod() {
  }
}

class Foo {

    func bar() {
        let classToFix = ClassToFix()
        classToFix.notExistingMethod()

        classToFix.notExistingVar = "some string"
    }
}
