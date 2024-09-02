//
//  ReadView.swift
//  BookBaram
//
//  Created by 이송미 on 7/1/24.
//

import SwiftUI

struct ReadView: View {
    @State var userBookReview: UserBookReview

    enum Constants {
        static let imageHeightPortion = 0.4
        static let paddingValue = 15.0

        static let size = UIScreen.main.bounds
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: userBookReview.imgUrl)
                    .frame(maxWidth: Constants.size.width,
                           minHeight: Constants.size.height * Constants.imageHeightPortion,
                           alignment: .center)

                HStack {
                    Text(userBookReview.title)
                        .readViewStyle()
                    Text(userBookReview.date.toString())
                        .readViewStyle(alignment: .trailing)
                }
                .padding(.vertical, Constants.paddingValue)

                Text(userBookReview.contents)
                    .readViewStyle()
            }
            .padding(Constants.paddingValue)
        }
        .frame(width: Constants.size.width, height: Constants.size.height)
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
    ReadView(userBookReview: UserBookReview(imgUrl: URL(string: "https://img.freepik.com/premium-vector/job-and-exam-test-vector-illustration_138676-243.jpg")!,
                                            title: "Test",
                                            date: Date.now,
                                            contents: "Test"))
}
#endif
