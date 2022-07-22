//
//  ContentView.swift
//  SwiftUI Beginner
//
//  Created by MacBook Pro on 7/7/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TextView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}

struct TextView: View {
    @State private var slider: Float = 100.0
    
    @State var email: String = ""
    
    @State private var selectorIndex = 0
    @State private var strOS = ["iOS", "macOS","tvOS","watchOS"]
    
    var strengths = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"]
    @State private var selectedStrength = 0
    @State var minimumSelectedDate = Date()
    @State var maximumSelectedDate = Date()
    @State var testDate = Date()
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    Group {
                        // Image view
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipped()
                            .cornerRadius(150)
                            .padding(.bottom, 40)
                        
                        // Text with Different ways
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam")
                            .foregroundColor(Color.red)
                            .multilineTextAlignment(.leading)
                            .padding(15)
                            .lineSpacing(15)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(3)
                        
                        // for fixed size text
                        Text("Hello World!")
                            .padding(.leading)
                            .fixedSize(horizontal: false, vertical: false)
                        
                        // for dynamic text size
                        Text ("Dynamic Text")
                            .font(.custom("", size: 14))
                            .fontWeight(.bold)
                        
                        // for speacing between latters
                        Text ("Hello!!, How are you?")
                            .kerning(7)
                        
                        // for text foreground & back ground color
                        Text ("Text for Color Expample")
                            .foregroundColor(.white)
                            .background(Color.black)
                        
                        
                        // for text style
                        Text("Text Style")
                            .bold()
                            .italic()
                        // Textfield with bottom line & image
                        HStack {
                            
                            Image("home")
                                .padding(.leading, (UIScreen.main.bounds.width * 20) / 414)
                            
                            TextField("Email", text: $email)
                                .frame(height: (UIScreen.main.bounds.width * 40) / 414, alignment: .center)
                                .padding(.leading, (UIScreen.main.bounds.width * 10) / 414)
                                .padding(.trailing, (UIScreen.main.bounds.width * 10) / 414)
                                .font(.system(size: (UIScreen.main.bounds.width * 15) / 414, weight: .regular, design: .default))
                                .imageScale(.small)
                                .keyboardType(.emailAddress)
                                .autocapitalization(UITextAutocapitalizationType.none)
                        }
                        seperator()
                        
                        // Button with Action & Tap
                        Button(action: {
                            print("Done Tap!")
                        }) {
                            Text("Done!")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 140, height: 50)
                                .background(Color(red: 85.0/255.0, green: 84.0/255.0, blue: 166.0/255.0, opacity: 1.0))
                                .clipped()
                                .cornerRadius(5.0)
                                .shadow(color: Color(red: 85.0/255.0, green: 84.0/255.0, blue: 166.0/255.0, opacity: 1.0), radius: 5, x: 0, y: 5)
                        }
                    }
                    Group {
                        // Segment Control
                        
                        // Date Picker
                        Section {
                            Picker(selection: $selectedStrength, label: Text("Strength")) {
                                ForEach(0 ..< strengths.count) {
                                    Text(self.strengths[$0])
                                }
                            }
                        }
                        // for minimum date
                        DatePicker("Minimum Date",
                                   selection: $minimumSelectedDate,
                                   in: Date()...,
                                   displayedComponents: [.date]).padding()
                        // for maximum date
                        DatePicker("Maximum Date",
                                   selection: $maximumSelectedDate,
                                   in: ...Date(),
                                   displayedComponents: [.date]).padding()
                        TabView {
                            ContentView()
                                .tabItem ( { VStack {
                                    Image("ic_home")
                                    Text("Home")
                                }
                                }).tag(0)
                            ContentView()
                                .tabItem ( { VStack {
                                    Image("ic_controls")
                                    Text("Controls")
                                }
                                }).tag(1)
                        }.environment(\.colorScheme, .light)
                    }
                }
            }
        }
    }
}

//MARK:- Seperator (Bottom line view)
struct seperator: View {
    var body: some View {
        VStack {
            //            Divider().background(lightGreyColor)
            Divider()
            Divider().frame(width: 100, height: 1, alignment: .center).background(Color.red)
        }.padding()
            .frame(height: 1, alignment: .center)
        //        The Horizontal Divider is displayed as a horizontal line to divide views.
        //        Inside a HStack the divider is displayed as a vertical line.
        //        The color of the divider can be changed using the .background modifier
        //        The size of the divider can be changed with the frame modifier.
    }
}
