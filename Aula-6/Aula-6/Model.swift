//
//  Model.swift
//  Aula-6
//
//  Created by Turma01-23 on 26/03/25.
//

import Foundation

struct HaPo: Decodable, Identifiable{
    let id: String
    let name: String?
    let image: String?
    let actor: String?
}
