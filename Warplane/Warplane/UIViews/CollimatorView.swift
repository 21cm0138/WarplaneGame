//
//  CollimatorView.swift
//  Warplane
//
//  Created by cmStudent on 2022/07/29.
//

import SwiftUI

struct CollimatorView: View {
    
    @State var size:CGFloat = 30.0

    
    var body: some View {
        ZStack{
            Image("collimator_green")
                .resizable()
                .frame(width: 20, height: 20, alignment: .center)
            
            
//            VStack{}
//                .frame(width: size, height: 2, alignment: .center)
//                .background(Color.green)
//                .position(x: size / 2, y: 1)
//            VStack{}
//                .frame(width: size, height: 2, alignment: .center)
//                .background(Color.green)
//                .position(x: size / 2, y: size - 1)
//            VStack{}
//                .frame(width: 2, height: size, alignment: .center)
//                .background(Color.green)
//                .position(x: 1, y: size/2)
//            VStack{}
//                .frame(width: 2, height: size, alignment: .center)
//                .background(Color.green)
//                .position(x: size - 1, y: size / 2)
//
//            VStack{}
//                .frame(width: size / 2, height: 2, alignment: .center)
//                .background(Color.green)
//                .position(x: size / 2, y: size / 2)
//            VStack{}
//                .frame(width: 2, height: size / 2, alignment: .center)
//                .background(Color.green)
//                .position(x: size / 2, y: size / 2)
            
        }
        .frame(width: size, height: size, alignment: .center)
        
        
    }
}

struct CollimatorView_Previews: PreviewProvider {
    static var previews: some View {
        CollimatorView()
    }
}
