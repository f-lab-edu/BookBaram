//
//  ReadView.swift
//  BookBaram
//
//  Created by 이송미 on 7/1/24.
//

import SwiftUI

struct ReadView: View {
    enum ReadViewConstants {
        static let imageHeight = 300.0
        static let paddingValue = 15.0
    }

    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: "https://shorturl.at/4R3io"))
                .backgroundStyle(.black)
                .frame(maxWidth: .infinity, maxHeight: ReadViewConstants.imageHeight, alignment: .center)

            HStack {
                Text("title")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("2024/07/01")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }

            Spacer()
                .frame(height: ReadViewConstants.paddingValue)
            Text("multiple lines\nmultiline")
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
    }
}

#Preview {
    ReadView()
}
