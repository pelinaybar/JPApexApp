//
//  ApexPredator.swift
//  JPApexApp
//
//  Created by Pelin Aybar on 15.02.2024.
//

//JSON dosyasını bir modele dönüştürdük ve kodu çözmek için decodable yaptık
import Foundation
import SwiftUI

struct ApexPredator : Decodable, Identifiable {
    
    let id: Int
    let name: String
    let type : PredatorType
    let latitude: Double
    let longitude: Double
    let movies:[String]
    let movieScenes:[movieScene]
    let link:String
    
    var image:String{
        name.lowercased().replacingOccurrences(of: " ", with: " ")
    }
    
    struct movieScene : Decodable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }
    
    enum PredatorType: String, Decodable {
        case land
        case air
        case sea
        
        var background: Color{
            switch self {
            case .land:
                .brown
            case .air:
                .teal
            case .sea:
                .blue
            }
        }
    }
}


