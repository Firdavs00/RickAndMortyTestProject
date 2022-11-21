//
//  MultCharactersModel.swift
//  RickAndMortyTestProject
//
//  Created by Firdavs Boltayev on 19/11/22.
//

import Foundation

// MARK: - MultParticipantsModel

struct MultParticipantsModel:  Codable {

    let results: [Results]?
}

// MARK: - Results

struct Results: Codable {
    
    let id: Int?
    let name: String?
    let status: String?
    let image: String?
    let created: String?
    let species: String?
    let origin: Origin?
}

// MARK: - Origin

struct Origin: Codable {
    
    let name: String?
}
