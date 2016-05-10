import SwiftGtk3

class GraphController: WidgetController {
    init() {
        super.init(orientation: .Vertical)
        box.add(widget: Label(text: "Hello from two"))
    }
}
