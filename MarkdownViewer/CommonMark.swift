import CommonMark
import Cocoa

protocol RenderableMarkdownElement {
    func render(_ font: NSFont) -> NSAttributedString
}

extension Inline: RenderableMarkdownElement {
    func render(_ font: NSFont) -> NSAttributedString {
        switch self {
        case .text(text: let text):
            return NSAttributedString(
                string: text,
                attributes: [
                    .font: font
                ]
            )
        case .emphasis(children: let children):
            let joinedText = children.map { $0.render(font.bold) }.join()
            let attributedText = NSMutableAttributedString(attributedString: joinedText)
            attributedText.addAttribute(
                .font,
                value: font.bold,
                range: NSRange(location: 0, length: attributedText.length)
            )
            return attributedText
        case .strong(children: let children):
            let joinedText = children.map { $0.render(font.italic) }.join()
            let attributedText = NSMutableAttributedString(attributedString: joinedText)
            attributedText.addAttribute(
                .font,
                value: font.italic,
                range: NSRange(location: 0, length: attributedText.length)
            )
            return attributedText
        default:
            print("No supporting for inline element: \(self)")
            return NSAttributedString()
        }
    }
}

extension Block: RenderableMarkdownElement {
    func render(_ font: NSFont) -> NSAttributedString {
        switch self {
        case .paragraph(text: let inlineChildren):
            return inlineChildren.map { $0.render(font) }.join()
        default:
            print("No supporting for block element: \(self)")
            return NSAttributedString()
        }
    }
}
