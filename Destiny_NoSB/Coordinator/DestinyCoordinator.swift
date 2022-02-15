//
//  DestinyCoordinator.swift
//  Destiny_NoSB
//
//  Created by Raúl Pavón on 15/02/22.
//

import Foundation
import UIKit

class DestinyCoordinator {
    var navigationController: UINavigationController
    private let factory =  DestinyFactoryImp()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let destinyViewController = factory.makeDestinyViewController(destinyCoordinator: self)
        navigationController.setViewControllers([destinyViewController], animated: false)
    }
}
