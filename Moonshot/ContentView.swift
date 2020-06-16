//
//  ContentView.swift
//  Moonshot
//
//  Created by KazukiNakano on 2020/06/16.
//  Copyright © 2020 kazu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Decode JSON") {
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor Swift Avenue",
                    "city": "Nashville"
                }
            }
            """

            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: data) {
                print(user.address.street)
            }
        }
    }
}

struct User: Codable {
    var name: String
    var address: Address
}

struct Address: Codable {
    var street: String
    var city: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
