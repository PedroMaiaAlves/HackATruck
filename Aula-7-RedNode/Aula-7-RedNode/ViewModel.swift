//
//  ViewModel.swift
//  Aula-7-RedNode
//
//  Created by Turma01-23 on 27/03/25.
//

import Foundation
class ViewModel: ObservableObject {
    
    @Published var personagem: [Champ] = []
    
    func fetch(){
        
        guard let  url = URL(string: "http://127.0.0.1:1880/get") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let parsed = try JSONDecoder().decode([Champ].self, from: data)
                
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
