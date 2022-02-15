//
//  DestinyUIView.swift
//  Destiny_NoSB
//
//  Created by Raúl Pavón on 15/02/22.
//

import UIKit

class DestinyUIView: UIView {
    enum DestinyUIViewConstraints {
        enum LbStory {
            static let fontSize: CGFloat = 25
        }
        enum Button {
            static let fontSize: CGFloat = 23
            static let height: CGFloat = 100
        }
        enum StackContainer {
            static let bottom: CGFloat = -15
            static let leading: CGFloat = 20
            static let trailing: CGFloat = -20
        }
    }
    
    private lazy var mainContainer: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imgBackground: UIImageView = {
        let image = UIImageView(image: UIImage(named: GlobalConstants.Images.background))
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var stackContainer: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .fill
        stack.contentMode = .scaleToFill
        stack.distribution = .fillProportionally
        return stack
    }()
    
    private let lbStory: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: DestinyUIViewConstraints.LbStory.fontSize)
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var btChoice1: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: GlobalConstants.Images.btChoice1Background), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: DestinyUIViewConstraints.Button.fontSize)
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    private lazy var btChoice2: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: GlobalConstants.Images.btChoice2Background), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: DestinyUIViewConstraints.Button.fontSize)
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initComponents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func initComponents() {
        addComponents()
        setAutolayout()
    }
    
    private func addComponents() {
        addSubview(mainContainer)
        mainContainer.addSubview(imgBackground)
        mainContainer.addSubview(stackContainer)
        stackContainer.addArrangedSubview(lbStory)
        stackContainer.addArrangedSubview(btChoice1)
        stackContainer.addArrangedSubview(btChoice2)
    }
    
    private func setAutolayout() {
        NSLayoutConstraint.activate([
            mainContainer.topAnchor.constraint(equalTo: topAnchor),
            mainContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imgBackground.topAnchor.constraint(equalTo: mainContainer.topAnchor),
            imgBackground.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor),
            imgBackground.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor),
            imgBackground.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor),
            
            stackContainer.topAnchor.constraint(equalTo: mainContainer.safeAreaLayoutGuide.topAnchor),
            stackContainer.bottomAnchor.constraint(equalTo: mainContainer.safeAreaLayoutGuide.bottomAnchor, constant: DestinyUIViewConstraints.StackContainer.bottom),
            stackContainer.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: DestinyUIViewConstraints.StackContainer.leading),
            stackContainer.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: DestinyUIViewConstraints.StackContainer.trailing),
            
            btChoice1.heightAnchor.constraint(equalToConstant: DestinyUIViewConstraints.Button.height),
            
            btChoice2.heightAnchor.constraint(equalToConstant: DestinyUIViewConstraints.Button.height),
        ])
    }
    
    func setTarget(target: Any?, action: Selector) {
        btChoice1.addTarget(target, action: action, for: .touchUpInside)
        btChoice2.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func updateUI(title: String, choice1: String, choice2: String) {
        lbStory.text = title
        btChoice1.setTitle(choice1, for: .normal)
        btChoice2.setTitle(choice2, for: .normal)
    }
}
