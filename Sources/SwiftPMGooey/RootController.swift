import SwiftGtk3
import CGtk
class RootController: WidgetController {

    let buildController = BuildController()
    let graphController = GraphController()

    var currentController: WidgetController

    init() {
        currentController = buildController 
        super.init(orientation: .Horizontal)

        let leftPanel = Box(orientation: .Vertical)
        let tab1 = Button(label: "Tab One")
        tab1.clicked = { button in
            self.updateChildController(self.buildController)
        }
        leftPanel.add(widget: tab1)
        let tab2 = Button(label: "Tab Two")
        tab2.clicked = { button in
            self.updateChildController(self.graphController)
        }
        leftPanel.add(widget: tab2)
        box.add(widget: leftPanel)

        box.add(widget: currentController.box, expand: true, fill: true)
    }

    //FIXME: this is messed up and leaking memory.
    func updateChildController(_ controller: WidgetController) {
        let oldController = currentController
        g_object_ref(currentController.box.widgetPointer)
        box.remove(widget: oldController.box)
        currentController = controller
        box.add(widget: currentController.box, expand: true, fill: true)
        currentController.box.showAll()
    }
}
