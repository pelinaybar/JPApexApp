//
//  Predators.swift
//  JPApexApp
//
//  Created by Pelin Aybar on 15.02.2024.
//

import Foundation
class Predators{
    var allApexPredators : [ApexPredator] = []
    var apexPredators:[ApexPredator] = []
    
    init(){ //ilk olarak çalıştır otomatik
        decodeApexPredatorData()
    }
    func decodeApexPredatorData(){
        //datayı url ye çevirdik bölye dosyayı ulaşmayı güvenilir olduğunu söyledik
        //hata yakalama ile kodu çözerken do catch kullandık başarısız olursak hatayı yakala
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json"){
            do{
                let data =  try Data(contentsOf: url) //url içinden al data olarak koy
                let decoder = JSONDecoder() //kodu jsondecoder ile çöz
                decoder.keyDecodingStrategy = .convertFromSnakeCase //bu özellik json verisindeki mesela movie_scnes bizim modelde movieScenes eşlemesi için
                allApexPredators = try decoder.decode([ApexPredator].self, from: data)
                apexPredators = allApexPredators
            }catch{
                print("Error decoding JSON data:\(error)")
            }
        }
    }
    func search (for searchTerm:String)->[ApexPredator]{
        if searchTerm.isEmpty {
            return apexPredators
        }else{
            return apexPredators.filter { predator in
                predator.name.localizedCaseInsensitiveContains(searchTerm)
            }
        }
    }
    func sort (by alphabetical:Bool){ //sıralama alfabeye göre ama öncekinden sonrakine göre
        apexPredators.sort { predator1, predator2 in
            if alphabetical{
                predator1.name < predator2.name
            }else{
                predator1.id < predator2.id
            }
        }
    }
    func filter (by type: PredatorType){
        if type == .all {
            apexPredators = allApexPredators
        }else{
            apexPredators = allApexPredators.filter{ predator in
                predator.type == type
            }
        }
    }
}
