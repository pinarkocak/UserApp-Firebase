//
//  UserDetailInteractor.swift
//  UserApp_Firebase
//
//  Created by Pınar Koçak on 25.04.2022.
//

import Foundation
import Firebase

class UserDetailInteractor: PresenterToInteractorKisiDetayProtocol {
    var refUsers = Database.database().reference().child("kisiler") //name of db table
    
    func kisiGuncelle(person_id: String, person_name: String, person_number: String) {
        let updatedUser = ["kisi_ad":person_name,"kisi_tel":person_number]
        refUsers.child(person_id).updateChildValues(updatedUser)
    }
}
