//
//  animatedBackground.swift
//  golden3
//
//  Created by Zac Palmer on 8/31/22.
//

import SwiftUI

struct animatedBackground: View {
    var body: some View {
        Circle()
            .frame(width:150, height: 150)
            .blur(radius: 50)
            //.forgroundColor(Color.red)
    }
}

struct animatedBackground_Previews: PreviewProvider {
    static var previews: some View {
        animatedBackground()
    }
}
