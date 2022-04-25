//
//  UserDetailProtocols.swift
//  UserApp_Firebase
//
//  Created by Pınar Koçak on 25.04.2022.
//

protocol ViewToPresenterKisiDetayProtocol {
    var kisiDetayInteractor: PresenterToInteractorKisiDetayProtocol? { get set }
    
    func guncelle(person_id: String, person_name: String, person_number: String)
}

protocol PresenterToInteractorKisiDetayProtocol {
    func kisiGuncelle(person_id: String, person_name: String, person_number: String)
}

protocol PresenterToRouterKisiDetayProtocol {
    static func createModule(ref: DetailViewController)
}
