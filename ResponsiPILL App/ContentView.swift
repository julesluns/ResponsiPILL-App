//
//  ContentView.swift
//  ResponsiPILL App
//
//  Created by Julia Luna on 6/14/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var name = ""
    @State private var textTitle = "What is your name?"
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("myBlue"), Color(.white)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            NavigationStack {
            VStack {
                
                Text("ResponsiPILL")
                    .font(.largeTitle)
                Text("\(textTitle)")
                    .font (.title)
                    .padding(.top)
                
                //textfield
                TextField("", text: $name)
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .border(Color.purple, width: 1)
                    .padding()
                
                //button
                Button("Submit") {
                    print(name)
                    textTitle = "Welcome to ResponsiPILL, \(name)!"
                    
                }
                .font(.title2)
                .buttonStyle(.borderedProminent)
                .tint(.black)
                
                //description
                Text("About ResponsiPILL")
                    .font(.headline)
                    .padding(.top)
                
                Text("ResponsiPILL is your pill buddy designed to simplify medication management and enhance your overall healthcare experience. With its intuitive features and comprehensive functionality, ResponsiPILL ensures you never miss a dose!")
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding([.top, .leading, .trailing])
                
                Text("How to Use ResponsiPILL")
                    .font(.headline)
                    .padding(.top)
                
                Text("In the next screens, you will be prompted to the Information page which contains detailed descriptions of standard medications and common side effects, the Reminder page which ensures you stay on track with your medication regimen through timely, personalized reminders, and the Journal Page where you can reflect on how your medications affect you and record your health care journey!")
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding([.top, .leading, .trailing])
                
            }

                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        NavigationLink(destination: Information()) {
                            Text("Information")
                            //                            .padding([.top, .leading])
                        }
                        Spacer()
                        
                        NavigationLink(destination: Reminders()) {
                            Text("Reminders")
                            //                                .padding([.top, .leading, .trailing])
                            
                        }
                        Spacer()
                        
                        NavigationLink(destination: Journal()) {
                            Text("Hi Journal")
                            //                                .padding([.top, .trailing])
                        }
                        Spacer()
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
