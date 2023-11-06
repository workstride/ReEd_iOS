//
//  PostViewModel.swift
//  ReEd
//
//  Created by 김건우 on 11/5/23.
//
import Foundation

struct PostViewModel {
    let id: Int
    let title: String
    let content: String
    // 다른 필드 추가

    init(post: Post) {
        self.id = post.id
        self.title = post.title
        self.content = post.content
        // 다른 필드 초기화
    }
}
