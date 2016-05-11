import CGtk
import SwiftGtk3
import Foundation

class BuildController: WidgetController {
    let textView: TextView
    init() {
        textView = TextView()
        super.init(orientation: .Vertical)
        let buildButton = Button(label: "Build") 
        buildButton.clicked = buildButtonPressed
        box.add(widget: buildButton)
        box.add(widget: textView, expand: true, fill: true)
    }

    func buildButtonPressed(btn: Button) {
        
        let buffer = gtk_text_view_get_buffer(UnsafeMutablePointer(textView.widgetPointer))!
        print(buffer.pointee)

        let task = NSTask()
        var arguments: [String] = ["/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin/swift-build"]
        arguments += ["--chdir", "/Users/aciid/mycode/swift.org/swift-package-manager"]
        task.launchPath = arguments.removeFirst()
        task.arguments = arguments
        let pipe = NSPipe()
        task.standardOutput = pipe
        task.launch()
        repeat {

            let output = String(data: pipe.fileHandleForReading.availableData, encoding: NSUTF8StringEncoding)!
            gtk_text_buffer_insert_at_cursor(buffer, output, Int32(output.characters.count))
            print(output)
        } while task.isRunning
    }
}
