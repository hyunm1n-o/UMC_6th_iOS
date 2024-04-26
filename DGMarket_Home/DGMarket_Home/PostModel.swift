//
//  PostModel.swift
//  DGMarket_Home
//
//  Created by 오현민 on 4/27/24.
//

import Foundation

struct PostModel {
    let imageName: String
    let title: String
    let category: String
    let chatNum: Int
    let dibsNum: Int
    let price: Int
}

extension PostModel {
    static let list: [PostModel] = [
        PostModel(imageName: "1", title: "[급구] 50만원 제공! 쿵야 레스토랑에서 시식 알바 구함니다. ^^", category: "당근알바 • 이벤트", chatNum: 0, dibsNum: 0, price: 0),
        PostModel(imageName: "2", title: "에어팟맥스 실버", category: "강북구 • 번동", chatNum: 1, dibsNum: 6, price: 370000),
        PostModel(imageName: "3", title: "에어팟 맥스 스페이스그레이 S급 판매합니다.", category: "강북구 • 송중동", chatNum: 3, dibsNum: 15, price:500000),
        PostModel(imageName: "4", title: "[S급] 에어팟 맥스 스페이스그레이 풀박 판매합니다.", category: "성북구 • 장위동", chatNum: 2, dibsNum: 1, price:550000),
        PostModel(imageName: "5", title: "아이폰 15프로 블랙티타늄 256기가 새상품", category: "도봉구 • 창제2동", chatNum: 5, dibsNum: 33, price:1700000),
        PostModel(imageName: "6", title: "아이폰15 128g 옐로우 자급제 판매합니다.", category: "강북구 • 수유1동", chatNum: 0, dibsNum: 1, price:1300000),
        PostModel(imageName: "7", title: "급처 네고가능 아이폰15 512기가+애케플", category: "성북구 • 석관동", chatNum: 3, dibsNum: 0, price:1750000),
    ]
}
