import CGtk
import SwiftGtk3

class BuildController: WidgetController {
    init() {
        super.init(orientation: .Vertical)
        let buildButton = Button(label: "Build") 
        box.add(widget: buildButton)
        let textView = TextView()
        box.add(widget: textView, expand: true, fill: true)
    }
}
