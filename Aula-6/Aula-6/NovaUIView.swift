//
//  NovaUIView.swift
//  Aula-6
//
//  Created by Turma01-23 on 26/03/25.
//

import SwiftUI

struct NovaUIView: View {
    @State private var perso: HaPo
    
    init(perso: HaPo) {
        _perso = State(initialValue: perso)
    }
    
    var body: some View {
        ZStack{
            Color.vinho
            VStack{
                AsyncImage(url: URL(string: perso.image!)){ phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 100, height: 100)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 400)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    case .failure:
                        Text("Falha ao carregar a imagem")
                            .frame(width: 100, height: 100)
                    @unknown default:
                        EmptyView()
                    }
                    
                    VStack{
                        Text(perso.name!).font(.title).foregroundStyle(.white)
                        HStack{
                            Text("Ator:").foregroundStyle(.white)
                            Text(perso.actor!).font(.subheadline)
                        }.foregroundStyle(.white)
                    }
                }
            }.ignoresSafeArea()
        }.ignoresSafeArea()
    }
}
