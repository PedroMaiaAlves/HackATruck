//
//  Modo2UIView.swift
//  Aula3-Desafio2
//
//  Created by Turma01-23 on 21/03/25.
//

import SwiftUI



struct Modo2UIView: View {
    
    @State private var nome: String = "Pedro"
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.azul // Aqui usei a cor azul como exemplo, pois 'Color.azul' não existe por padrão.
                    .ignoresSafeArea()
                
                Spacer()
                
                ZStack {
                    VStack {
                        Text("Modo 2")
                            .font(.title)
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    Spacer()
                    Rectangle()
                        .frame(width: 250, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    VStack {
                        VStack {
                            Text("\(nome)")
                                .foregroundStyle(.white)
                                .font(.title)
                                .opacity(0.5)
                        }
                        Text("Bem vindo, \(nome)")
                            .foregroundStyle(.white)
                            .font(.title)
                        ZStack{
                            Rectangle()
                                .frame(width: 100, height: 30)
                                .foregroundStyle(.blue)
                            NavigationLink(destination: Modo2_2UIView(nome: nome)) {
                                Text("Acessar tela")
                                    .foregroundStyle(.white)
                                    .frame(width: 200, height: 60)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Modo 2") // Título da navegação
            .navigationBarTitleDisplayMode(.inline) // Opção para o título aparecer de forma inline
        }
    }
}

#Preview {
    Modo2UIView()
}
