import SwiftUI

// Helper extension to use hex color values in SwiftUI
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1.0)
    }
}

struct ContentView: View {
    @State private var name: String = ""
    @State private var submittedNames: [(String, String?)] = []
    @State private var selectedImage: String?
    @State private var backgroundImage: String = "Image 4"

    var body: some View {
        ZStack {
            // Background
            Image(backgroundImage)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                Spacer()

                ZStack {
                    Image("Image 16")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 97.04, height: 133)
                        .offset(y: 298)

                    Text("مبروك الفوز !")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.black)
                        .padding()
                        .offset(y: 110)
                }

                // Second Image 22 between Image 17 and Image 18
                HStack {
                    Image("Image 17")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 96.96, height: 95)
                        .padding(.leading, 32) // Adjust padding as needed
                        .offset(y: 195)

                    Spacer()

                    Image("Image 18")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 96.63, height: 86.13)
                        .padding(.trailing, 34) // Adjust padding as needed
                        .offset(y: 199)
                }
                .padding(.horizontal, 20) // Adjust horizontal padding to fit design

                Spacer()

                ScrollView {
                    VStack(spacing: 5) {
                        ForEach(submittedNames, id: \.0) { submittedName, avatar in
                            ZStack {
                                HStack {
                                    if let avatar = avatar {
                                        Image(avatar)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 40, height: 40)
                                            .padding(.leading, 10)
                                    }
                                    Text(submittedName)
                                        .font(.system(size: 18))
                                        .foregroundColor(.black)
                                        .padding(.leading, 20)
                                }
                                .frame(width: 300, height: 40)
                                .background(Color.white)
                                .cornerRadius(8)
                                .shadow(radius: 3)
                            }
                        }
                    }
                    .padding(.top, 10)
                }
                .offset(y: -79)

                // Add the last three winners' names over Image 21
                if submittedNames.count >= 3 {
                    HStack(spacing: 20) {
                        ForEach(submittedNames.suffix(3).reversed(), id: \.0) { submittedName, _ in
                            ZStack {
                                Image("Image 21")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 40) // Adjust the size as needed
                                
                                Text(submittedName)
                                    .font(.system(size: 14))
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .padding(.top, 10)
                    .offset(y: -100)
                }

                // Share Button with Image 19 and "مشاركة" text
                Button(action: {
                    // Share action here
                }) {
                    ZStack {
                        Image("Image 19")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 260, height: 40)
                            .offset(x: 146, y: 50) // Move the image up by 20 points

                        Text("مشاركة")
                            .font(.system(size: 11, weight: .bold))
                            .foregroundColor(.black)
                            .offset(x: 146, y: 50) // Move the text up by 20 points
                    }
                }
                .padding(.bottom, 20)  // Adjust padding as needed
                
                Spacer()

                Button(action: {
                    // Any action for start game
                }) {
                    ZStack {
                        Image("Image 10")
                                              .resizable()
                                              .aspectRatio(contentMode: .fit)
                                              .frame(width: 304, height: 40)
                                              .offset(y: 300)  // Moved up from 340 to 320
                        
                        Image("Image 11")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250, height: 44)
                            .offset(x: -6, y: -20) // Move the image up by 20 points

                        Text("العب مرة اخرى!")
                            .font(.system(size: 11, weight: .bold))
                            .foregroundColor(.white)
                            .offset(x: -6, y: -20) // Move the text up by 20 points
                    }
                }
                .padding(.bottom, 80)  // Adjust padding as needed
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
