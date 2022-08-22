//
//  HightView.swift
//  Warplane
//
//  Created by cmStudent on 2022/08/02.
//

import SwiftUI

struct HightView: View {
    var body: some View {
        HStack{
            Text("11245.00")
                .font(.caption)
                .fontWeight(.regular)
                .foregroundColor(Color.green)
                .frame(width: 80, height: 14, alignment: .center)
                .background(
                    Image("marks1")
                        .resizable()
                        .position(x: 53, y: 7)
                        .frame(width: 80, height: 14, alignment: .center)
                        
                )
        }
                
        
    }
}

struct HightView_Previews: PreviewProvider {
    static var previews: some View {
        HightView()
    }
}
