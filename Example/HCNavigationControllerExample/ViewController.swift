//
//  ViewController.swift
//  HCNavigationControllerExample
//
//  Created by chen he on 2019/4/2.
//  Copyright © 2019 chen he. All rights reserved.
//

import Cocoa
import HCNavigationController

class ViewController: NSViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func showNavigationController(_ sender: Any) {
        // Do any additional setup after loading the view.
        let windowFrame = NSApp.keyWindow!.frame
        let navigationController = HCNavigationController(frame: windowFrame, rootViewController: nil)
        navigationController.delegate = self
        
        self.navigationController = navigationController
        
        let window = NSWindow(contentViewController: self.navigationController!)
        window.makeKeyAndOrderFront(nil)
    }
    
    @IBAction func Push(_ sender: Any) {
        let vc = TestViewController(nibName: "TestViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func Pop(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}

extension ViewController: HCNavigationControllerDelegate {
    func navigationController(_ navigationController: HCNavigationController, willShow viewController: NSViewController, animated: Bool) {
        print("\(viewController) will show in \(navigationController)")
    }
    
    func navigationController(_ navigationController: HCNavigationController, didShow viewController: NSViewController, animated: Bool) {
        print("\(viewController) did show in \(navigationController)")
    }
}
