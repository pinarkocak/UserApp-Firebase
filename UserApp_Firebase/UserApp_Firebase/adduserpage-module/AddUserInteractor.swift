//
//  AddUserInteractor.swift
//  UserApp_Firebase
//
//  Created by Pınar Koçak on 25.04.2022.
//

import Foundation
import Firebase

class AddUserInteractor: PresenterToInteractorKisiKayitProtocol {
    var refUsers = Database.database().reference().child("kisiler") //name of db table
    
    func kisiEkle(person_name: String, person_number: String) {
        let newUser = ["kisi_id":"","kisi_ad":person_name,"kisi_tel":person_number]
        refUsers.childByAutoId().setValue(newUser)
    }
}

