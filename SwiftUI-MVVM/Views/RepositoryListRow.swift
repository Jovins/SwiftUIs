//
//  RepositoryListRow.swift
//  SwiftUI-MVVM
//
//  Created by Jovins on 2021/7/28.
//

import SwiftUI

struct RepositoryListRow: View {
    
    @State var repository: Repository
    
    var body: some View {
        
        NavigationLink(destination: RepositoryDetailView(viewModel: .init(repository: repository))) {
            Text(repository.fullName)
        }
    }
}

#if DEBUG
struct RepositoryListRow_Previews : PreviewProvider {
    static var previews: some View {
        RepositoryListRow(repository:
            Repository(
                id: 1,
                fullName: "foo",
                owner: User(id: 1, login: "bar", avatarUrl: URL(string: "baz")!)
            )
        )
    }
}
#endif
