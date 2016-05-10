//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import CGtk

public class Box: Container {
    public init(orientation: Orientation = .Vertical) {
        super.init()
        widgetPointer = gtk_box_new(orientation.toGtkOrientation(), 8)
    }
}
