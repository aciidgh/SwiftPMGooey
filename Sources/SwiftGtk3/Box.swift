//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import CGtk

public class Box: Container {
    public init(orientation: Orientation = .Vertical) {
        super.init()
        widgetPointer = gtk_box_new(orientation.toGtkOrientation(), 8)
    }

    public func add(widget: Widget, expand: Bool = false, fill: Bool = false, padding: UInt32 = 8) {
        widgets.append(widget)
        widget.parentWidget = self
        gtk_box_pack_start(UnsafeMutablePointer(widgetPointer), widget.widgetPointer, expand.toGBoolean(), fill.toGBoolean(), padding)
    }
    
    override public func remove(widget: Widget) {
        if let index = widgets.index(where: { $0 === widget }) {
            gtk_container_remove(UnsafeMutablePointer(widgetPointer), widget.widgetPointer)
            widgets.remove(at: index)
            widget.parentWidget = nil
        }
    }
}
