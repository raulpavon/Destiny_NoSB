//
//  DestinyViewController.swift
//  Destiny_NoSB
//
//  Created by Raúl Pavón on 15/02/22.
//

import UIKit

class DestinyViewController: UIViewController {
    
    weak var destinyCoordinator: DestinyCoordinator?
    private let factory: DestinyFactory
    var storyManager = StoryManager()
    
    private lazy var destinyUIView: DestinyUIView = {
        let view = DestinyUIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    required init(factory: DestinyFactory, destinyCoordinator: DestinyCoordinator) {
        self.factory = factory
        self.destinyCoordinator = destinyCoordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        initComponents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func initComponents() {
        addComponents()
        setAutolayout()
        setTarget()
    }
    
    private func addComponents() {
        view.addSubview(destinyUIView)
    }
    
    private func setAutolayout() {
        NSLayoutConstraint.activate([
            destinyUIView.topAnchor.constraint(equalTo: view.topAnchor),
            destinyUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            destinyUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            destinyUIView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setTarget() {
        destinyUIView.setTarget(target: self, action: #selector(choiceMade(_:)))
    }
    
    @objc private func choiceMade(_ sender: UIButton) {
        storyManager.nextStory(userChoice: sender.currentTitle ?? "")
        updateUI()
    }
    
    private func updateUI() {
        let title = storyManager.getStoryTitle()
        let choice1 = storyManager.getChoice1()
        let choice2 = storyManager.getChoice2()
        destinyUIView.updateUI(title: title, choice1: choice1, choice2: choice2)
    }
}
