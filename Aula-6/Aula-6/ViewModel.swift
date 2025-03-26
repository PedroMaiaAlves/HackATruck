//
//  ViewModel.swift
//  Aula-6
//
//  Created by Turma01-23 on 26/03/25.
//

import Foundation
class ViewModel: ObservableObject {
    
    @Published var personagem: [HaPo] = []
    
    func fetch(){
        
        guard let  url = URL(string: "https://hp-api.onrender.com/api/characters/house/gryffindor") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let parsed = try JSONDecoder().decode([HaPo].self, from: data)
                
                DispatchQueue.main.async {
                    self?.personagem = parsed
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
