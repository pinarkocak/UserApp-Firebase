//
//  MainPageInteractor.swift
//  UserApp_Firebase
//
//  Created by Pınar Koçak on 25.04.2022.
//

import Foundation
import Firebase

class MainPageInteractor: PresenterToInteractorAnaSayfaProtocol {
    var anaSayfaPresenter: InteractorToPresenterAnaSayfaProtocol?
    
    var refUsers = Database.database().reference().child("kisiler") //name of db table
    
    func fetchAllPeople() {
        
        refUsers.observe(.value, with: { snapshot in
            var list = [Person]()
            
            if let allData = snapshot.value as? [String:Any] {
                for line in allData {
                    if let data = line.value as? NSDictionary {
                        let person_id = line.key
                        let person_name = data["kisi_ad"] as? String ?? ""
                        let person_number = data["kisi_tel"] as? String ?? ""
                        
                        let person = Person(kisi_id: person_id, kisi_ad: person_name, kisi_tel: person_number)
                        list.append(person)
                    }
                }
            }
            
            self.anaSayfaPresenter?.sendDataToPresenter(personList: list)
        })
    
    }
    
    func searchPerson(search: String) {
        /*refUsers.queryOrdered(byChild: "kisi_ad")
                .queryEqual(toValue: search)*/
        
          refUsers.observe(.value, with: { snapshot in
            var list = [Person]()
            
            if let allData = snapshot.value as? [String:Any] {
                for line in allData {
                    if let data = line.value as? NSDictionary {
                        let person_id = line.key
                        let person_name = data["kisi_ad"] as? String ?? ""
                        let person_number = data["kisi_tel"] as? String ?? ""
                        
                        if person_name.lowercased().contains(search.lowercased()) {
                            let person = Person(kisi_id: person_id, kisi_ad: person_name, kisi_tel: person_number)
                            list.append(person)
                        }
                    }
                }
            }
            
            self.anaSayfaPresenter?.sendDataToPresenter(personList: list)
        })
    }
    
    func deletePerson(person_id: String) {
        refUsers.child(person_id).removeValue()
    }
}

