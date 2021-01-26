import Cocoa

extension NSFont {
    public static var defaultFontSize: CGFloat {
        return 18
    }
    
    public static var sanFranciscoMono: NSFont {
        guard let font = NSFont(name: "SFMono-Regular", size: defaultFontSize)
        else {
            return NSFont.systemFont(ofSize: defaultFontSize)
        }
        
        return font
    }
}
