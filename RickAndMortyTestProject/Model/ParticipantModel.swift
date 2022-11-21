//
//  ParticipantModel.swift
//  RickAndMortyTestProject
//
//  Created by Firdavs Boltayev on 20/11/22.
//

import Foundation


// MARK: - ParticipantModel
struct ParticipantModel: Decodable {
    let id: Int?
    let name, status, species, type: String?
    let gender: String?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

// MARK: - Location
struct Location: Decodable {
    let name: String?
    let url: String?
}
