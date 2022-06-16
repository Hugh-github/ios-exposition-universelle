//
//  RootViewController.swift
//  Expo1900
//
//  Created by seohyeon park on 2022/06/16.
//

import UIKit

class RootViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
    
    func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
