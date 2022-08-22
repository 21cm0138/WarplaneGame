//
//  FacePlateView.swift
//  Warplane
//
//  Created by cmStudent on 2022/07/30.
//

import SwiftUI

struct FacePlateView: View {
    private let screenWidth = UIScreen.main.bounds.width
    private  let screenHeight = UIScreen.main.bounds.height
    var body: some View {
        VStack{

            Image("Plane")
                .resizable()
                .frame(width: 110, height: 38.5, alignment: .center)
                
        }
        .frame(width: screenWidth, height: screenHeight, alignment: .center)
    }
}

struct FacePlateView_Previews: PreviewProvider {
    static var previews: some View {
        FacePlateView()
    }
}
