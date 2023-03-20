import Foundation
import Security

class KeychainService {

    static func saveValue(key: String, value: String) -> OSStatus {
        guard let data = value.data(using: .utf8) else {
            return errSecInvalidData
        }

        let query: [String: Any] = [
            kSecClass as String: kSecClassInternetPassword,
            kSecAttrServer as String: "wildtour.ml",
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]

        var status = SecItemAdd(query as CFDictionary, nil) as OSStatus
        if (status == errSecDuplicateItem) {
            print("Dublicate.. Deleting old.")

            print(deleteValue(key: key))
            status = SecItemAdd(query as CFDictionary, nil) as OSStatus
        }

        guard status == errSecSuccess else {
            print("Error status is \(status)")
            return status
        }
        return status
    }

    static func deleteValue(key: String) -> OSStatus {
        let query: [String: Any] = [kSecClass as String: kSecClassInternetPassword, kSecAttrServer as String: "wildtour.ml"]
        return SecItemDelete(query as CFDictionary) as OSStatus
    }

    static func getByKey(key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassInternetPassword,
            kSecAttrServer as String: "wildtour.ml",
            kSecAttrAccount as String: key,
            kSecReturnData as String: true
        ]

        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)

        guard status == errSecSuccess, let data = result as? Data else {
            return nil
        }

        return String(data: data, encoding: .utf8)
    }
}
