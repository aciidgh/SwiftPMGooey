import SwiftGtk3

let app = Application(applicationId: "com.ankit.im")


app.run { window in
    window.title = "Hello World"
    window.defaultSize = Size(width: 400, height: 400)
    window.resizable = true
    
    let buttonBox = ButtonBox(orientation: .Vertical)

    let label = Label()
    label.selectable = true
    buttonBox.add(widget: label)
    
    let button = Button(label: "Press")
    button.label = "Press Me"
    button.clicked = { [unowned label] _ in
        label.text = "Oh, you pressed the button."
        
        let newWindow = Window(windowType: .TopLevel)
        newWindow.title = "Just a window"
        newWindow.defaultSize = Size(width: 200, height: 200)
        
        let labelPressed = Label(text: "Oh, you pressed the button.")
        newWindow.add(widget: labelPressed)
        
        newWindow.showAll()
    }
    
    buttonBox.add(widget: button)
    
    let calendarButton = Button(label: "Calendar")
    calendarButton.clicked = { _ in
        let newWindow = Window(windowType: .TopLevel)
        newWindow.title = "Just a window"
        newWindow.defaultSize = Size(width: 200, height: 200)
        
        let calendar = Calendar()
        calendar.year = 2000
        calendar.showHeading = true
        
        newWindow.add(widget: calendar)
        
        newWindow.showAll()
    }
    
    buttonBox.add(widget: calendarButton)
    
    let imageButton = Button(label: "Image")
    imageButton.clicked = { _ in
        let newWindow = Window(windowType: .TopLevel)
        newWindow.title = "Just a window"
        newWindow.defaultSize = Size(width: 200, height: 200)
        
        let image = Image(filename: "GTK.png")
        
        newWindow.add(widget: image)
        
        newWindow.showAll()
    }
    
    buttonBox.add(widget: imageButton)
    
    let textView = TextView()
    textView.backspace = { _ in
        print("backspace")
    }
    textView.copyClipboard = { _ in
        print("copyClipboard")
    }
    textView.cutClipboard = { _ in
        print("cutClipboard")
    }
    textView.pasteClipboard = { _ in
        print("pasteClipboard")
    }
    textView.selectAll = { _, select in
        print(select ? "everything is selected" : "everything is unselected")
    }
    
    buttonBox.add(widget: textView)
    
    window.add(widget: buttonBox)
}

