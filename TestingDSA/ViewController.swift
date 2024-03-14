//
//  ViewController.swift
//  TestingDSA
//
//  Created by Nunu Nugraha on 14/03/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let linkedList = LinkedList<Int>()
        linkedList.insertAtTheAnd(value: 100)
        linkedList.insertAtTheAnd(value: 200)
        linkedList.insertAtTheAnd(value: 245)
        linkedList.insertAtTheAnd(value: 500)
        
        // temukan data 245
        linkedList.findData(value: 245)
    }
    
}
