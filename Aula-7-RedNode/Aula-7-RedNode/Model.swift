//
//  Model.swift
//  Aula-7-RedNode
//
//  Created by Turma01-23 on 27/03/25.
//

import Foundation

struct Champ: Decodable, Hashable{
    let nome: String?
    let cidade: String?
    let foto: String?
    let descricao: String?
}
