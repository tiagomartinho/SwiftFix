import Foundation
import XcodeKit

class SourceEditorCommand: NSObject, XCSourceEditorCommand {

    private static var numberOfInvocations = 0

    func perform(with invocation: XCSourceEditorCommandInvocation,
                 completionHandler: @escaping (Error?) -> Void ) -> Void {

        SourceEditorCommand.numberOfInvocations += 1

        let lines = invocation.buffer.lines

        switch SourceEditorCommand.numberOfInvocations {
        case 1:
            lines.insert("", at: 1)
            lines.insert("    func notExistingMethod() {", at: 2)
            lines.insert("    }", at: 3)
            lines.insert("", at: 4)
        case 2:
            lines.insert("", at: 1)
            lines.insert("    var notExistingVar = \"\"", at: 2)
        case 3:
            let personTemplate = "Person(name: \(placeholder("name")), age: \(placeholder("age")))"
            lines.insert("        let uninitializedVariablePerson = \(personTemplate)", at: 18)
        default:
            break
        }

        completionHandler(nil)
    }

    private func placeholder(_ name: String) -> String {
        let openTag = "<#"
        let closeTag = "#>"
        return openTag + name + closeTag
    }
}
