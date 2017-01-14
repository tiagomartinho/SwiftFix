import Foundation
import XcodeKit

class SourceEditorCommand: NSObject, XCSourceEditorCommand {

    func perform(with invocation: XCSourceEditorCommandInvocation,
                 completionHandler: @escaping (Error?) -> Void ) -> Void {

        let lines = invocation.buffer.lines

        lines.insert("  func notExistingMethod() {", at: 2)
        lines.insert("  }", at: 3)

        completionHandler(nil)
    }
}
