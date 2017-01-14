import Foundation
import XcodeKit

class SourceEditorCommand: NSObject, XCSourceEditorCommand {

    static var numberOfInvocations = 0

    func perform(with invocation: XCSourceEditorCommandInvocation,
                 completionHandler: @escaping (Error?) -> Void ) -> Void {

        SourceEditorCommand.numberOfInvocations += 1

        let lines = invocation.buffer.lines

        switch SourceEditorCommand.numberOfInvocations {
        case 1:
            lines.insert("  func notExistingMethod() {", at: 2)
            lines.insert("  }", at: 3)
        default:
            lines.insert("  var notExistingVar = \"\"", at: 2)
            lines.insert("", at: 3)
        }

        completionHandler(nil)
    }
}
