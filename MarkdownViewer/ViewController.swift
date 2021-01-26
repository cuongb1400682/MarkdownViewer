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
        richTextEdit.font = .systemFont(ofSize: 14)
        plainTextEdit.font = .sanFranciscoMono
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

extension ViewController: NSTextViewDelegate {
    func textDidChange(_ notification: Notification) {
        let tree = Node(markdown: plainTextEdit.string)
        richTextEdit.string = tree.description
    }
}

