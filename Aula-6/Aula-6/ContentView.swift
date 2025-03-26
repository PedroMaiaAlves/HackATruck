//
//  ContentView.swift
//  Aula-6
//
//  Created by Turma01-23 on 26/03/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var personView = ViewModel()
    
    var body: some View {
        NavigationStack{
            VStack {
                VStack{
                    ZStack{
                        Image("fundo-grif")
                            .resizable()
                        Image("pngwing.com 1")
                            .resizable()
                            .frame(width:150 ,height: 200)
                            .padding(60)
                    }.ignoresSafeArea()
                     .frame(width: 400,height: 200)
                }
                Spacer()
                ScrollView {
                    VStack(spacing: 10) {
                        ZStack {
                            Color.vinho
                                .ignoresSafeArea()
                            
                            VStack {
                                ForEach(personView.personagem) { p in
                                    HStack(alignment: .center) {
                                        NavigationLink(destination: NovaUIView(perso: p)){
                                            AsyncImage(url: URL(string: p.image!)) { phase in
                                                switch phase {
                                                case .empty:
                                                    ProgressView()
                                                        .frame(width: 100, height: 100)
                                                case .success(let image):
                                                    image
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 100, height: 100)
                                                        .clipShape(Circle())
                                                case .failure:
                                                    Text("Falha ao carregar a imagem")
                                                        .frame(width: 100, height: 100)
                                                @unknown default:
                                                    EmptyView()
                                                }
                                            }
                                            .padding(.trailing, 10)
                                            Text(p.name ?? "Nome desconhecido")
                                                .font(.headline)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                        }
                                    }.tint(.white)
                                    .padding(.horizontal, 15)
                                }
                            }
                            .padding(.vertical, 10)
                        }
                    }
                    .padding(.top, 10)
                }
            }.onAppear(){
                personView.fetch()
            }
        }
    }
}

#Preview {
    ContentView()
}
