//
//  Defaults.swift
//  RickAndMortyTestProject
//
//  Created by Firdavs Boltayev on 20/11/22.
//

import Foundation

struct Defaults {
    
    static let defaults = UserDefaults.standard
    
    static func storeParticipan(participan: MultParticipantsModel) {
        
        let encoder = JSONEncoder()
        if let encoder = try? encoder.encode(participan) {
            defaults.set(encoder, forKey: "participan")
        }
    }
    
    static func loadParticipan() -> MultParticipantsModel? {
        
        if let savedParticipanData = defaults.object(forKey: "participan") as? Data {
            
            let decoder = JSONDecoder()
            if let savedParticipan = try? decoder.decode(MultParticipantsModel.self, from: savedParticipanData) {
                return savedParticipan
            }
        }
        return nil
    }
}
