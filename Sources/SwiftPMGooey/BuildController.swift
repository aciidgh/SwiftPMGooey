import SwiftGtk3

class BuildController: WidgetController {
    init() {
        super.init(orientation: .Vertical)
        box.add(widget: Label(text: "Hello"))
    }
}
