//
//  Home.swift
//  SearchBar
//
//  Created by Kaio Guanais on 2020-10-22.
//

import SwiftUI

struct Home: View {
    @StateObject var searchData = SearchUser()
    
    var body: some View {
        VStack {
            CustomSearchBar(searchData: searchData)
            
            Spacer()
        }
        .onChange(of: searchData.query) { newData in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                if newData == searchData.query {
                    print("Search \(newData)")
                    
                    if searchData.query != "" {
                        searchData.page = 1
                        searchData.find()
                    }
                    else {
                        // Removing all searched data
                        searchData.searchedUser.removeAll()
                    }
                }
            }
        }
    }
}

