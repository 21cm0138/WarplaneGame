//
//  MissileView.swift
//  Warplane
//
//  Created by cmStudent on 2022/08/02.
//

import SwiftUI

struct MissileView: View {
    var body: some View {
        VStack{
            Image("missile")
                .resizable()
                .frame(width: 7, height: 7, alignment: .center)
        }
 
    }
}

struct MissileView_Previews: PreviewProvider {
    static var previews: some View {
        MissileView()
    }
}
