import SwiftGtk3

class RootController: WidgetController {

    override init() {
        super.init()

        let tab1 = Button(label: "Tab One")
        box.add(widget: tab1)

        let tab2 = Button(label: "Tab Two")
        box.add(widget: tab2)
    }
}
