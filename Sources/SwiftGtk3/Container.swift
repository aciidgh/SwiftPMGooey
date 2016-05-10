//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import CGtk

public class Container: Widget {
    var widgets: [Widget] = []

    override public init() {
        super.init()   
    }
 
    public func add(widget: Widget) {
        widgets.append(widget)
        widget.parentWidget = self
        gtk_container_add(UnsafeMutablePointer(widgetPointer), widget.widgetPointer)
    }
    
    public func remove(widget: Widget) {
        if let index = widgets.index(where: { $0 === widget }) {
            gtk_container_remove(UnsafeMutablePointer(widgetPointer), widget.widgetPointer)
            widgets.remove(at: index)
            widget.parentWidget = nil
        }
    }
}
