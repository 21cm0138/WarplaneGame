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
        ZStack{
//            Image("road")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .position(x: 30, y: 2)
//                .frame(width: 60, height: 25, alignment: .center)
            
//            Image("points")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .position(x: 80, y: 25)
//                .frame(width: 160, height: 25, alignment: .center)


            Image("Plane2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .position(x: 55, y: 9)
                .frame(width: 110, height: 25, alignment: .center)
                
            
        }
        .frame(width: screenWidth, height: screenHeight, alignment: .center)
    }
}

struct FacePlateView_Previews: PreviewProvider {
    static var previews: some View {
        FacePlateView()
    }
}
