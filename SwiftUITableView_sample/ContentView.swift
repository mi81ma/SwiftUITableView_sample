//
//  ContentView.swift
//  SwiftUITableView_sample
//
//  Created by masato on 8/9/2020.
//  Copyright © 2020 Masato Miyai. All rights reserved.
//

import SwiftUI

struct Fruit: Identifiable {
    var id: Int
    let name: String
    let image: Image
}

struct ContentView: View {

    let fruits: [[Fruit]] = [[
        .init(id: 0, name: "Apple", image: Image("apple")),
        .init(id: 1, name: "Avocado", image: Image("avocado" )),
        .init(id: 2, name: "Banana", image: Image("banana")),
        .init(id: 3, name: "Cherry", image: Image("cherry" )),
        .init(id: 4, name: "Grapes", image: Image("grapes"))
        ],
                             [
                                .init(id: 0, name: "Apple", image: Image("apple")),
                                .init(id: 1, name: "Avocado", image: Image("avocado" )),
                                .init(id: 2, name: "Banana", image: Image("banana")),
                                .init(id: 1, name: "Avocado", image: Image("avocado" )),
                                .init(id: 2, name: "Banana", image: Image("banana"))
        ],
                             [
                                .init(id: 0, name: "Apple", image: Image("apple")),
                                .init(id: 1, name: "Avocado", image: Image("avocado" )),
                                .init(id: 2, name: "Banana", image: Image("banana")),
                                .init(id: 1, name: "Avocado", image: Image("avocado" )),
                                .init(id: 2, name: "Banana", image: Image("banana"))
        ]
    ]


    var body: some View {
        NavigationView {
            List{
                ForEach(fruits.startIndex...(fruits.endIndex - 1), id: \.self) {
                    section in

                    Section(header: Text(self.switchHeaderTitle(section: section))
                        .font(.system(size: 30))
                        .fontWeight(.heavy)
                    ) {

                        ForEach(self.fruits[section]) { fruit in
                            FruitAndVegetableRow(fruit: fruit, generation: self.switchHeaderTitle(section: section))


                        }
                    }
                }
            }.navigationBarTitle(Text("Fruits & Vegetables"))
        }
    }

    // switchHeaderTitle: this function for changing TableView Section name
    func switchHeaderTitle(section: Int) -> String {
        switch section {
            case 0:
                return "Fruits"
            case 1:
                return  "Vegetables"
            case 2:
                return "Fruits & Vegetables"
            default:
                return ""
        }
    }
}

// Cell view struct for easy to read
struct FruitAndVegetableRow: View {

    let fruit: Fruit
    let generation: String

    var body: some View {
        HStack {
            NavigationLink(destination: FruitDetail(fruit: fruit, generation: generation)) {
                fruit.image
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
                Text(fruit.name)
                    .font(.headline)
                    .padding(.leading, 20)
            }
        }
    }
}

// Make New View when pushing cell
struct FruitDetail: View {

    let fruit: Fruit
    let generation: String

    var body: some View {
        NavigationView {
            VStack {
                // VSTack elemest 01
                fruit.image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 350, alignment: .top)
                    .cornerRadius(20)
                    .padding(.init(top: 0, leading: 50, bottom: 0, trailing: 50))

                // VSTack elemest 02
                HStack {
                    Text(fruit.name)
                        .font(.system(size: 30, weight: .heavy))
                        .padding(.top, -90)
                        .foregroundColor(.white)
                        .padding(.trailing, 10)
                }
                .frame(width: 330, height: 60, alignment: .trailing)

                // VSTack elemest 03
                HStack {
                    // HSTack elemest 01
                    Text("Category: ")
                        .font(.system(size: 30, weight: .medium))
                    // HSTack elemest 02
                    Text(generation)
                        .font(.system(size: 40, weight: .heavy))
                }
                .frame(width: 350, height: 40, alignment: .leading)
                .padding(.leading, 20)
                Spacer()
            }.padding(.top, -80)
        }.navigationBarTitle(Text("Fruit"), displayMode: .inline)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
