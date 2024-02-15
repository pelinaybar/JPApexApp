//
//  Predators.swift
//  JPApexApp
//
//  Created by Pelin Aybar on 15.02.2024.
//

import Foundation
class Predators{
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
                apexPredators = try decoder.decode([ApexPredator].self, from: data)
                
            }catch{
                print("Error decoding JSON data:\(error)")
            }
        }
    }
}
