//
//  CustomSearchBar.swift
//  SearchBar
//
//  Created by Kaio Guanais on 2020-10-22.
//

import SwiftUI

struct CustomSearchBar: View {
    @ObservedObject var searchData: SearchUser
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                    .foregroundColor(.gray)
                
                TextField("Search", text: $searchData.query)
                    .autocapitalization(.none)
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            
            if !searchData.searchedUser.isEmpty {
                ScrollView(.vertical, showsIndicators: true) {
                    LazyVStack(alignment: .leading, spacing: 12) {
                        ForEach(searchData.searchedUser, id: \.self) {  user in
                            VStack(alignment: .leading, spacing: 6) {
                                HStack {
                                    Text(user.login)
                                    Spacer()
                                }
                                
                                Divider()
                            }
                            .padding(.horizontal)
                            .onAppear {
                                // stopping search until 3rd page
                                if user.node_id ==
                                    searchData.searchedUser.last?.node_id &&
                                    searchData.page <= 3 {
                                    
                                    searchData.page += 1
                                    searchData.find()
                                }
                                    
                            }
                        }
                    }
                    .padding(.top)
                }
                .frame(width: 240)
            }
        }
        .background(Color.gray.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding()
    }
}
