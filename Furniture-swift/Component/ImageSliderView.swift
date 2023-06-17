//
//  ImageSliderView.swift
//  Furniture-swift
//
//  Created by Kemal Maulana on 18/06/23.
//

import SwiftUI

struct ImageSliderView: View {
    @State private var currentIndex = 0
    var slides: [String] = ["estate2", "estate3", "estate4", "estate5", "estate6"]
    
    var body: some View {
        ZStack(alignment: .bottomLeading, content: {
            ZStack(alignment: .trailing, content: {
                Image(slides[currentIndex])
                    .resizable()
                    .frame(width: .infinity, height: 180)
                    .scaledToFit()
                    .cornerRadius(15)
            })
            HStack {
                ForEach(0..<slides.count) { index in
                    Circle()
                        .fill(self.currentIndex == index ? Color("kPrimary") : Color("kSecondary"))
                        .frame(width: 10, height: 10)
                }
            }
            .padding()
        })
        .padding(.horizontal)
        .onAppear { Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
            if(self.currentIndex + 1 == self.slides.count) {
                self.currentIndex = 0
            } else {
                self.currentIndex += 1
            }
        }}
        
    }
}

struct ImageSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSliderView()
    }
}
