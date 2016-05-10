//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import CGtk

public class ButtonBox: Box {
    override public init(orientation: Orientation = .Horizontal) {
        super.init()
        widgetPointer = gtk_button_box_new(orientation.toGtkOrientation())
    }
}
