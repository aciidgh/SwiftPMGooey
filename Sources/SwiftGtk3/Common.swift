//
//  Copyright © 2016 Tomas Linhart. All rights reserved.
//

import CGtk

public enum Orientation {
    case Horizontal
    case Vertical

    public func toGtkOrientation() -> GtkOrientation {
        switch self {
        case .Horizontal:
            return GTK_ORIENTATION_HORIZONTAL
        case .Vertical:
            return GTK_ORIENTATION_VERTICAL
        }
    }
}

extension gboolean {
    func toBool() -> Bool {
        return self >= 1
    }
}

extension Bool {
    func toGBoolean() -> gboolean {
        return self ? 1 : 0
    }
}

extension Int {
    func toBool() -> Bool {
        return self >= 1
    }
}
