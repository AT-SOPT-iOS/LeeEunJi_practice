//
//  ItemModel.swift
//  SOPT_Week1
//
//  Created by 이은지 on 4/26/25.
//

import UIKit

struct ItemModel {
    let itemImg: UIImage
    let name: String
    let price: String
    var heartIsSelected: Bool
}

extension ItemModel {
    static func dummy() -> [ItemModel] {
        return [
            ItemModel(itemImg: .퉁퉁이, name: "퉁퉁퉁사후르", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .itemImg11, name: "오쏘몰", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .itemImg1, name: "애플워치", price: "5000", heartIsSelected: true),
            ItemModel(itemImg: .itemImg2, name: "가방", price: "5000", heartIsSelected: true),
            ItemModel(itemImg: .itemImg3, name: "헤드셋", price: "5000", heartIsSelected: true),
            ItemModel(itemImg: .itemImg4, name: "틴트", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .itemImg5, name: "카메라", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .itemImg6, name: "로션", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .itemImg7, name: "락스", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .itemImg8, name: "가방", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .itemImg9, name: "헤드셋", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .itemImg10, name: "틴트", price: "5000", heartIsSelected: false)
        ]
    }
}
