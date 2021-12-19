//
//  TypeOfViewController.swift
//  IOS_Study
//
//  Created by 황윤경 on 2021/12/09.
//

import Foundation
enum TypeOfViewController {
    case tabBar
    case home
    case chatting
    case myPage
}

extension TypeOfViewController {
    func storyboardRepresentation() -> StoryboardRepresentation {
        switch self {
        case .tabBar:
            return StoryboardRepresentation(bundle: nil, storyboardName: Identifiers.tabBarSB, storyboardId: Identifiers.MainTBC)
        case .home:
            return StoryboardRepresentation(bundle: nil, storyboardName: Identifiers.homeSB, storyboardId: Identifiers.homeVC)
        case .chatting:
            return StoryboardRepresentation(bundle: nil, storyboardName: Identifiers.chattingSB, storyboardId: Identifiers.chattingVC)
        case .myPage:
            return StoryboardRepresentation(bundle: nil, storyboardName: Identifiers.myPageSB, storyboardId: Identifiers.myPageVC)
        }
    }
}
