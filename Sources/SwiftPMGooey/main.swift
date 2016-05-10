import SwiftGtk3

let app = Application(applicationId: "com.ankit.im")


app.run { window in
    window.title = "Hello World"
    window.defaultSize = Size(width: 400, height: 400)
    let rootController = RootController()
    window.add(widget: rootController.box)
}

