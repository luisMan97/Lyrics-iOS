//
//  LyricsListView.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___ All rights reserved.
//

import SwiftUI

struct LyricsListView: View {
    
    @ObservedObject var viewModel: LyricsListViewModel
    @ObservedObject var searchBar: SearchBar = SearchBar()
    @Environment(\.presentationMode) private var presentationMode
    
    @State private var domain: LyricsList.Sone.Domain?
    
    var body: some View {
        VStack(spacing: 8) {
            if viewModel.listSongs.isEmpty {
                Text("Aún no tienes canciones guardas")
                    .foregroundColor(Color(.systemGray))
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
    
                Text("Realiza una busqueda para guardar tus canciones")
                    .foregroundColor(Color(.systemGray))
                    .font(.system(.body, design: .rounded))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Button("Realizar busqueda...") {
                    presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(.colorGreen)
            } else {
                List(viewModel.listSongs.filter({ searchBar.text.isEmpty || $0.title.localizedStandardContains(searchBar.text) || $0.artist.localizedStandardContains(searchBar.text) }), id: \.id) { song in
                    HStack {
                        Text("\(song.title) - \(song.artist)")
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                    }.onTapGesture {
                        domain = song
                    }
                }.padding(.top)
                .add(searchBar)
            }
        }.navigationBarTitle("Historial de canciones buscadas", displayMode: .inline)
        .sheet(item: $domain) { domain in
            VStack {
                VStack {
                    HandleBar()
                        .padding(.top, 2)
                    
                    Text("\(domain.title) - \(domain.artist)")
                        .font(.system(.title, design: .rounded))
                        .multilineTextAlignment(.center)
                        .lineLimit(0)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                    Divider()
                        .frame(height: 1)
                        .background(Color.colorPrimary)
                }.frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.colorPrimary)
                    
                ScrollView(.vertical, showsIndicators: false) {
                    Text(domain.lyrics)
                        .padding()
                }
            }
        }
        .onAppear {
            viewModel.getLyricsList()
        }
    }
    
}

struct LyricsListView_Previews: PreviewProvider {
    static var previews: some View {
        LyricsListBuilder.createModule()
    }
}
