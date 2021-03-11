//
//  Apollo.swift
//  GitHubProfileViewer
//
//  Created by Lahiru Pinto on 3/7/21.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
        
    private(set) lazy var apollo: ApolloClient = {
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let network = RequestChainNetworkTransport(
            interceptorProvider: LegacyInterceptorProvider(store: store),
            endpointURL: URL(string: Constants.GITHUB_GRAPHQL_URL)!,
            additionalHeaders: [
                "Authorization": "Bearer \(Constants.GITHUB_TOKEN)"
            ]
        )
        return .init(networkTransport: network, store: store)
    }()
    
}
