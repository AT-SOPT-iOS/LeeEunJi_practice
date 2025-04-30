//
//  ChatModel.swift
//  SOPT_Week1
//
//  Created by 이은지 on 4/26/25.
//

import UIKit

// 데이터 모델 만들기
struct ChatModel {
    let profileImg: UIImage
    let name: String
    let place: String
    let message: String
    let itemImg: UIImage
}

// 더미데이터
extension ChatModel {
    static func dummy() -> [ChatModel] {
        return [
            ChatModel(profileImg: .profileImage1, name: "김가현", place: "광진구", message: "내말에답장해줘", itemImg: .itemImg1),
            ChatModel(profileImg: .profileImage2, name: "김현수", place: "여의도", message: "마크내사랑", itemImg: .itemImg2),
            ChatModel(profileImg: .profileImage3, name: "서주영", place: "잠실", message: "마크내꺼", itemImg: .itemImg3),
            ChatModel(profileImg: .profileImage4, name: "권석기", place: "회기", message: "나는 민경훈", itemImg: .itemImg4),
            ChatModel(profileImg: .profileImage5, name: "김나연", place: "미국", message: "타코팔러가야돼", itemImg: .itemImg5),
            ChatModel(profileImg: .profileImage6, name: "정정욱", place: "중국", message: "보쌈정식13000원", itemImg: .itemImg6),
            ChatModel(profileImg: .profileImage7, name: "서상원", place: "일본", message: "잠실의주인은두산이다", itemImg: .itemImg7),
            ChatModel(profileImg: .profileImage8, name: "임재현", place: "태국", message: "뒷풀이갈게", itemImg: .itemImg8),
            ChatModel(profileImg: .profileImage9, name: "이은지", place: "명왕성", message: "은지야술먹자", itemImg: .itemImg9),
            ChatModel(profileImg: .profileImage10, name: "성현주", place: "안드로메다", message: "응애~", itemImg: .itemImg10),
            ChatModel(profileImg: .profileImage11, name: "김한열", place: "뭘보슈", message: "생일추카해한열오빠", itemImg: .itemImg11)
        ]
    }
}
