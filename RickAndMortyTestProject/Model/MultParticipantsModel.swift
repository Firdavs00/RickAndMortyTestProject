//
//  MultCharactersModel.swift
//  RickAndMortyTestProject
//
//  Created by Firdavs Boltayev on 19/11/22.
//

import Foundation

struct MultParticipantsModel:  Codable {

    let results: [Results]?
}

struct Results: Codable {
    
    let id: Int?
    let name: String?
    let status: String?
    let image: String?
    let created: String?
    let species: String?
    let origin: Origin?
}

struct Origin: Codable {
    
    let name: String?
}
