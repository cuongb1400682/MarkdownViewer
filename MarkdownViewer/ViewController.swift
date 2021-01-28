//
//  ViewController.swift
//  MarkdownViewer
//
//  Created by Nguyen Tan Cuong on 25/1/21.
//  Copyright © 2021 Nguyen Tan Cuong. All rights reserved.
//

import Cocoa
import CommonMark

class ViewController: NSViewController {
    @IBOutlet var plainTextEdit: NSTextView!
    @IBOutlet var richTextEdit: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        richTextEdit.font = .defaultFont
        plainTextEdit.font = .sanFranciscoMono
    }

    override var representedObject: Any? {
        didSet {
        }
    }
}

extension ViewController: NSTextViewDelegate {
    func textDidChange(_ notification: Notification) {
        let tree = Node(markdown: plainTextEdit.string)
        
        if let renderedText = tree.elements[safe: 0]?.render(.defaultFont) {
            richTextEdit.textStorage?.setAttributedString(renderedText)
            print(renderedText)
        }
    }
}

