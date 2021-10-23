//
//  ContentView.swift
//  todo-list
//
//  Created by Mike on 22/10/2021.
//

import SwiftUI

var title: String = "TODO LIST"

var todos = ["id", "Mike", "mike@gmail.com"]

struct ContentView: View {
	@State var name: String = ""
	@State var email: String = ""
	var todos = ["id", "Mike", "mike@gmail.com"]
	@State private var showingAlert = false
	
	
	var body: some View {
		ZStack {
			Color.gray
				.opacity(0.4)
				.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)

			VStack {
				HStack {
					Image("logo")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.frame(width: 50, height: 50)
					
					Text(title)
						.font(.headline)
						.fontWeight(.heavy)
						.foregroundColor(.black)
				}
				
				Spacer()
				VStack {
					Group {
						TextField("Name:", text: $name)
							.padding(14)
							.border(Color.black)
							.padding()

						TextField("Email:", text: $email)
							.padding(14)
							.border(Color.black)
							.padding()
					}
					if(!name.isEmpty) {
						Text("Name: " + name)
					}
					
					if(!email.isEmpty) {
						Text("Email: " + email)
					}
					
					Spacer()
					Button("Save Data", action: {
						showingAlert = true
					})
					.padding()
					.frame(maxWidth: .infinity)
					.cornerRadius(50.0)
					.background(Color.black)
					.foregroundColor(.white)
					.padding()
					.alert(isPresented: $showingAlert) {
						Alert(
							title: Text(name),
							message: Text(email),
							primaryButton: .destructive(Text("Confirmar")) {
								name = ""
								email = ""
							},
							secondaryButton: .cancel()
						)
					}
				}
			}
		}
	}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
