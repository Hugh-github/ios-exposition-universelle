//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    lazy var itemView = MainViewItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemView.button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        guard let secondView = self.storyboard?.instantiateViewController(withIdentifier: "ItemListView") as? ItemListViewController else { return }
        self.navigationController?.pushViewController(secondView, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = itemView
    }
}
