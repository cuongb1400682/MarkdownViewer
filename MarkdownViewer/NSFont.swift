import Cocoa

extension NSFont {
    var bold: NSFont {
        let boldFontDesc = fontDescriptor.withSymbolicTraits(.bold)
        
        if let newFont = NSFont(descriptor: boldFontDesc, size: 0) {
            return newFont
        } else {
            return self
        }
    }
    
    var italic: NSFont {
        let italicFontDesc = fontDescriptor.withSymbolicTraits(.italic)
        
        if let newFont = NSFont(descriptor: italicFontDesc, size: 0) {
            return newFont
        } else {
            return self
        }
    }
    
    static var defaultFontSize: CGFloat {
        return 18
    }
    
    static var sanFranciscoMono: NSFont {
        guard let font = NSFont(name: "SFMono-Regular", size: defaultFontSize)
        else {
            return NSFont.systemFont(ofSize: defaultFontSize)
        }
        
        return font
    }
    
    static var defaultFont: NSFont {
        return .systemFont(ofSize: NSFont.defaultFontSize)
    }
}
