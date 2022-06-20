//
//  Components.swift
//  Expo1900
//
//  Created by seohyeon park on 2022/06/20.
//

import UIKit

class Components: UIView {
    let test = UIView()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .blue
        return stackView
    }()
    
    private func setStackViewLayout() {
        stackView.leadingAnchor.constraint(equalTo: test.trailingAnchor, constant: 15).isActive = true
        stackView.trailingAnchor.constraint(equalTo: test.trailingAnchor, constant: -10).isActive = true
        stackView.centerYAnchor.constraint(equalTo: test.centerYAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: test.bottomAnchor, constant: -5).isActive = true
    }
    
    func testView() -> UIView {
        return test
    }
}
