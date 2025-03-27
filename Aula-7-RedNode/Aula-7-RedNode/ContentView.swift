//
//  ContentView.swift
//  Aula-7-RedNode
//
//  Created by Turma01-23 on 27/03/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var champ = ViewModel()
    var body: some View {
        NavigationStack{
            VStack{
                VStack{
                    ZStack{
                        Image("lol")
                            .resizable()
                            .opacity(0.2)
                        Image("jg")
                            .resizable()
                            .frame(width:150 ,height: 200)
                            .padding(60)
                    }.ignoresSafeArea()
                     .frame(width: 400,height: 200)
                     .padding(.top, 80)
                }
                Spacer()
                ScrollView {
                    VStack(spacing: 10) {
                        ZStack {
                            Color.dourado
                                .ignoresSafeArea()
                            
                            VStack {
                                ForEach(champ.personagem, id:\.self) { p in
                                    HStack(alignment: .center) {
                                        NavigationLink(destination: NovaUIView(perso: p)){
                                            AsyncImage(url: URL(string: p.foto!)) { phase in
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
                                            Text(p.nome ?? "Nome desconhecido")
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
                champ.fetch()
            }.ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
