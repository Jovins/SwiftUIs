//
//  Home.swift
//  ScrollowRefreshable
//
//  Created by Jovins on 2021/8/26.
//

import SwiftUI

struct Home: View {
    
    @State var posts: [Post] = []
    @State var columns: Int = 2
    @Namespace var animation
    
    var body: some View {
        NavigationView {
            
            StaggeredGrid(columns: self.columns, list: self.posts) { post in
                PostView(post: post)
                    .matchedGeometryEffect(id: post.id, in: animation)
                    .onAppear {
                        print("post = \(post.img)")
                    }
            }
            .padding(.horizontal)
            .navigationBarTitle(Text("ScrollowRefreshable"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.columns += 1
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.columns = max(columns - 1 ,1)
                    } label: {
                        Image(systemName: "minus")
                    }
                }
            }
            .animation(.easeInOut, value: self.columns)
        }
        .onAppear {
            for index in 1...22 {
                self.posts.append(Post(img: "post\(index)"))
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct PostView: View {
    
    var post: Post
    var body: some View {
        Image(post.img)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(8)
    }
}
