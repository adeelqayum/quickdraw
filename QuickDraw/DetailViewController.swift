//
//  DetailViewController.swift
//  QuickDraw
//
//  Created by Adeel Qayum on 11/18/18.
//  Copyright © 2018 Adeel Qayum. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var library = QDLibrary()
    
    @IBOutlet var drawView: DrawView!
    {
        didSet {
            drawView.delegate = self
        }
    }
    
    var document: QDDocument?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        drawView.delegate = self
        self.navigationItem.title = document?.title
    }

    func configureView() {
     
        drawView?.roundBrush = (document?.roundBrush)!
        drawView?.tint = (document?.tint)!
        drawView?.lines = (document?.lines)!
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    
    @IBAction func onEraserBtn(_ sender: UIBarButtonItem) {
        document?.lines.removeAll()
        configureView()
    }
    
    @IBAction func onSquareShapeBtn(_ sender: Any) {
        document?.roundBrush = false
        configureView()
    }
    @IBAction func onRoundShapeBtn(_ sender: Any) {
        document?.roundBrush = true
        configureView()
    }
    
    @IBAction func onBlackColorBtn(_ sender: Any) {
        document?.tint = .black
        configureView()
    }
    @IBAction func onRedColorBtn(_ sender: Any) {
        document?.tint = .red
        configureView()
    }
    @IBAction func onGreenColorBtn(_ sender: Any) {
        document?.tint = .green
        configureView()
    }
    @IBAction func onBlueColorBtn(_ sender: Any) {
        document?.tint = .blue
        configureView()
    }
    
    var detailItem: NSDate? {
        didSet {
            // Update the view.
            configureView()
        }
    }

    
}

extension DetailViewController: DrawViewDelegate {
    func updateLines(_ drawView: DrawView, lines: [QDLine]) {
        document?.lines = lines
    }
}

