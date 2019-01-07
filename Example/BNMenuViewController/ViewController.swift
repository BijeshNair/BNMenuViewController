//
//  ViewController.swift
//  BNMenuViewController
//
//  Created by musthop on 01/03/2019.
//  Copyright (c) 2019 musthop. All rights reserved.
//

import UIKit
import BNMenuViewController

class ViewController: UIViewController, BNMenuDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func buttonTestClicked(_ sender: Any) {
        let modalController = BNMenuViewController()
        modalController.modalPresentationStyle = .overCurrentContext
        modalController.delegate = self
        modalController.arrayList = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"]
        modalController.arrayIcons = ["1", "2", "3", "4", "5", "6"]
        modalController.iconSize = CGSize(width: 45, height: 45)
        modalController.itemTextColor = .white
        modalController.itemTextFont = UIFont(name: "Baskerville-SemiBoldItalic", size: 20)!
        present(modalController, animated: false, completion: nil)
    }
    
    // MARK: - BNMenuDelegate
    func clickedAtIndex(i: Int) {
        print(i)
    }
    
}

