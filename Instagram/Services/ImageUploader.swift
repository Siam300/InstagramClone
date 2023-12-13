//
//  ImageUploader.swift
//  Instagram
//
//  Created by Auto on 12/13/23.
//

import UIKit
import Firebase
import FirebaseStorage

struct ImageUploader {
    static func uploadImage(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil } //error: 'nil' is incompatible with return type 'String'
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        
        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            return nil //error: 'nil' is incompatible with return type 'String'
        }
    }
}
