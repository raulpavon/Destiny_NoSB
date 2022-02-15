//
//  DestinyFactory.swift
//  Destiny_NoSB
//
//  Created by Raúl Pavón on 15/02/22.
//

import Foundation

protocol DestinyFactory {
    func makeDestinyViewController(destinyCoordinator: DestinyCoordinator) -> DestinyViewController
}

class DestinyFactoryImp: DestinyFactory {
    func makeDestinyViewController(destinyCoordinator: DestinyCoordinator) -> DestinyViewController {
        let destinyViewController = DestinyViewController(factory: self, destinyCoordinator: destinyCoordinator)
        return destinyViewController
    }
}
