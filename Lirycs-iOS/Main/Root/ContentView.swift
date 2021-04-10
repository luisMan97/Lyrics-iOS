//
//  ContentView.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var managedContext
    
    init() {
        UINavigationBar().setup(backgroundColor: .colorPrimary)
    }
    
    var body: some View {
        LyricsSearchBuilder.createModule(managedContext: managedContext)
            .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
