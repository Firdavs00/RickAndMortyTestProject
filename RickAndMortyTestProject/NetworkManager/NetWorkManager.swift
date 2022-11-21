//
//  NetWork.swift
//  RickAndMortyTestProject
//
//  Created by Firdavs Boltayev on 19/11/22.
//

import Foundation

class NetWorkManager {
    
    var page = 1

    func getMultParticipant(complation: @escaping(MultParticipantsModel) -> Void) {
        
        guard let url = URL(string: "\(Constants.BASE_URL)character?page=\(page)") else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url){ (data, _, error) in
            
            if let error = error {
                print("Error -> \(error.localizedDescription)")
            }
            
            guard let jsonData = data else { return }
            do {
              
                let decodeData = try JSONDecoder().decode(MultParticipantsModel.self, from: jsonData)
                
                complation(decodeData)

            } catch {
                print("Error decoding data.")
            }
        }
        dataTask.resume()
    }
    
    var allParticipan: ParticipantModel?
    func getParticipant(id: Int, complation: @escaping(ParticipantModel) -> Void) {
//    https://rickandmortyapi.com/api/character/2
        guard let url = URL(string: "\(Constants.BASE_URL)character/\(id)") else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let error = error {
                print("Error -> \(error.localizedDescription)")
            }
            
            guard let jsonData = data else { return }
            
            do {
                let decodeData = try JSONDecoder().decode(ParticipantModel.self, from: jsonData)
//                print("decodeData==> \(decodeData)")
                complation(decodeData)
                self.allParticipan = decodeData
                print("decodeData==> \(self.allParticipan)")
                
            } catch {
                print("Error decoding data.")
            }
        }
        dataTask.resume()
    }
}
