//
//  StorageManager.swift
//  Check-in
//
//  Created by dgsw8th16 on 11/28/23.
//

import Foundation
import Security

final class StorageManager {
    static let shared = StorageManager()
    private init() {}
    
    private let service = Bundle.main.bundleIdentifier
    private let account = "Service"
    
    private lazy var query: [CFString: Any]? = {
        guard let service = self.service else { return nil }
        return [kSecClass: kSecClassGenericPassword,
                kSecAttrService: service,
                kSecAttrAccount: account]
    }()
    
    func createTokens(_ token: GoogleLoginModel) -> Bool {
        guard let data = try? JSONEncoder().encode(token),
              let service = self.service else {
            return false
        }
        
        let query: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                                    kSecAttrService: service,
                                    kSecAttrAccount: account,
                                    kSecAttrGeneric: data]
        
        return SecItemAdd(query as CFDictionary, nil) == errSecSuccess
    }
    
    func readTokens() -> GoogleLoginModel? {
        guard let service = self.service else {
            return nil
        }
        let query: [CFString: Any] = [kSecClass: kSecClassGenericPassword,
                                kSecAttrService: service,
                                kSecAttrAccount: account,
                                 kSecMatchLimit: kSecMatchLimitOne,
                           kSecReturnAttributes: true,
                                 kSecReturnData: true]
        var item: CFTypeRef?
    
        if SecItemCopyMatching(query as CFDictionary, &item) != errSecSuccess {
            return nil
        }
        
        guard let existingItem = item as? [String: Any],
              let data = existingItem[kSecAttrGeneric as String] as? Data,
              let tokens = try? JSONDecoder().decode(GoogleLoginModel.self, from: data) else {
            return nil
        }
        
        return tokens
                                      
        
    }
    
}


