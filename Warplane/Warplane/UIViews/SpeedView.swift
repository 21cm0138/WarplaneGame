//
//  DashbordView.swift
//  Warplane
//
//  Created by cmStudent on 2022/08/02.
//

import SwiftUI

struct SpeedView: View {
    
    @Binding  var speed:Double
    
    var body: some View {
        HStack{
            Text(String(speed))
                .font(.caption)
                .fontWeight(.regular)
                .foregroundColor(Color.green)
                .frame(width: 80, height: 14, alignment: .center)
                .background(
                    Image("marks2")
                        .resizable()
                        .position(x: 26, y: 7)
                        .frame(width: 80, height: 14, alignment: .center)
                        
                )
        }
        
    }
}

struct SpeedView_Previews: PreviewProvider {
    static var previews: some View {
        SpeedView(speed: Binding.constant(0.0))
    }
}
