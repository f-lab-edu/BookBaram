//
//  ReadView.swift
//  BookBaram
//
//  Created by 이송미 on 7/1/24.
//

import SwiftUI

struct ReadView: View {
    @State var userBookReview: UserBookReview

    enum ReadViewConstants {
        static let imageHeight = 300.0
        static let paddingValue = 15.0
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: userBookReview.imgUrl)
                    .frame(maxWidth: .infinity, minHeight: ReadViewConstants.imageHeight, alignment: .center)

                HStack {
                    Text(userBookReview.title)
                        .readViewStyle()
                    Text(userBookReview.date.toString())
                        .readViewStyle(alignment: .trailing)
                }

                Spacer()
                    .frame(height: ReadViewConstants.paddingValue)
                Text(userBookReview.content)
                    .readViewStyle()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
    }
}

extension Text {
    func readViewStyle(font: Font = .body,
                       alignment: Alignment = .leading) -> some View {
        return self.font(font)
            .lineLimit(nil)
            .frame(maxWidth: .infinity, alignment: alignment)
    }
}

#if DEBUG
#Preview {
    ReadView(userBookReview: UserBookReview(title: "This is Title",
                                            date: Date.now,
                                            content: """
                                                       You should always try to avoid long sentences. Below are two examples, as well as some facts about long sentences in general.
                                                     """)
    )
}
#endif
