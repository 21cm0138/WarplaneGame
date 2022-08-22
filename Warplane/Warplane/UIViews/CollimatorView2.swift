//
//  CollimatorView2.swift
//  Warplane
//
//  Created by cmStudent on 2022/07/31.
//

import SwiftUI

struct CollimatorView2: View {
    
    @State var size:CGFloat = 30.0

    
    var body: some View {
        ZStack{
            Image("collimator_red")
                .resizable()
                .frame(width: 20, height: 20, alignment: .center)

            
        }
        .frame(width: size, height: size, alignment: .center)
        
        
    }
}

struct CollimatorView2_Previews: PreviewProvider {
    static var previews: some View {
        CollimatorView2()
    }
}
