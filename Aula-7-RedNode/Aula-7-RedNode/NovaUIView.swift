//
//  NovaUIView.swift
//  Aula-7-RedNode
//
//  Created by Turma01-23 on 27/03/25.
//


import SwiftUI

struct NovaUIView: View {
    @State private var perso: Champ
    
    init(perso: Champ) {
        _perso = State(initialValue: perso)
    }
    
    var body: some View {
        ZStack{
            Color.dourado
            VStack{
                AsyncImage(url: URL(string: perso.foto!)){ phase in
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
                        Text(perso.nome!).font(.title).foregroundStyle(.white)
                        VStack{
                            Text(perso.cidade!).font(.subheadline)
                            Spacer().frame(height: 10)
                            Text(perso.descricao!).font(.subheadline)
                        }.foregroundStyle(.white)
                        
                    }
                }
            }.ignoresSafeArea()
        }.ignoresSafeArea()
    }
}
