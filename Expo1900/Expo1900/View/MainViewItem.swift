//
//  MainViewItem.swift
//  Expo1900
//
//  Created by dhoney96 on 2022/06/20.
//

import UIKit

class MainViewItem: UIView {
    //let contentView = UIView()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.spacing = 15
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let subStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "poster")
        return image
    }()
    
    private let visitorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let venueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let periodLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .white
        return scroll
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("한국의 출품작 보러가기", for: .normal)
        button.setTitleColor(UIColor.link, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let leftFlagImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "flag")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let rightFlagImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "flag")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureScrollView()
        updateText()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureScrollView()
        updateText()
    }
    
    func configureScrollView() {
        addScrollView()
        addStackView()
        
        configureScrollViewLayout()
        configureStackViewLayout()
        configureImageViewLayout()
    }
    
    private func addScrollView() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)
    }
    
    private func addStackView() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(visitorLabel)
        stackView.addArrangedSubview(venueLabel)
        stackView.addArrangedSubview(periodLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(subStackView)
        
        subStackView.addArrangedSubview(leftFlagImageView)
        subStackView.addArrangedSubview(button)
        subStackView.addArrangedSubview(rightFlagImageView)
    }
    
    private func configureScrollViewLayout() {
        scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 5).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
    }
    
    private func configureStackViewLayout() {
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -50).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leadingAnchor, constant: 15).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor, constant: -15).isActive = true
        stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        subStackView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        subStackView.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.8).isActive = true
    }
    
    private func configureImageViewLayout() {
        imageView.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.4).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.6).isActive = true
        
        leftFlagImageView.widthAnchor.constraint(equalTo: subStackView.widthAnchor, multiplier: 0.2).isActive = true
        rightFlagImageView.widthAnchor.constraint(equalTo: leftFlagImageView.widthAnchor).isActive = true
    }
    
    private func checkExpositionData() -> Exposition? {
        do {
            let expositionData = try DataManager().expositionParse(fileName: "exposition_universelle_1900")
            return expositionData
        } catch {
            print(ParsingError.decodingError)
            return nil
        }
    }
    
    func updateText() {
        guard let expositionData = checkExpositionData() else { return }
        
        let title = expositionData.title.replacingOccurrences(of: "(", with: "\n(")
        
        titleLabel.text = title
        visitorLabel.text = "방문객 : \(expositionData.visitors.formatNumber())명"
        venueLabel.text = "개최지 : \(expositionData.location)"
        periodLabel.text = "개최 기간: \(expositionData.duration)"
        descriptionLabel.text = expositionData.description
    }
    
}