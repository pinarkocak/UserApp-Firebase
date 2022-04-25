//
//  UserDetailPresenter.swift
//  UserApp_Firebase
//
//  Created by Pınar Koçak on 25.04.2022.
//

import Foundation

class UserDetailPresenter: ViewToPresenterKisiDetayProtocol {
    var kisiDetayInteractor: PresenterToInteractorKisiDetayProtocol?
    
    func guncelle(person_id: String, person_name: String, person_number: String) {
        kisiDetayInteractor?.kisiGuncelle(person_id: person_id, person_name: person_name, person_number: person_number)
    }
}
