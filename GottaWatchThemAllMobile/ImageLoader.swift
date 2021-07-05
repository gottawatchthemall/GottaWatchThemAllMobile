//
//  ImageLoader.swift
//  GottaWatchThemAllMobile
//
//  Created by BERTHO on 03/07/2021.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    // ...
    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }

    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        print(data)
        task.resume()
    }
}
