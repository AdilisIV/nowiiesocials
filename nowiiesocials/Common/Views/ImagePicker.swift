//
//  ImagePicker.swift
//  nowiiesocials
//
//  Created by user on 24.06.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//

import SwiftUI
import Combine

class ImagePicker: ObservableObject {
    static let shared: ImagePicker = ImagePicker()
    
    private init() {}
    
    let view = ImagePicker.View()
    let coordinator = ImagePicker.Coordinator()
    
    let willChange = PassthroughSubject<Image?, Never>()
    @Published var image: Image? {
        didSet {
            if image != nil {
                willChange.send(image)
            }
        }
    }
}


extension ImagePicker {
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            
            ImagePicker.shared.image = Image(uiImage: image)
            
            picker.dismiss(animated: true, completion: nil)
        }
    }
}

extension ImagePicker {
    struct View: UIViewControllerRepresentable {
        
        func makeCoordinator() -> Coordinator {
            return ImagePicker.shared.coordinator
        }
        
        func makeUIViewController(context: Context) -> UIImagePickerController {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = context.coordinator
            return imagePickerController
        }
        
        func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
            
        }
        
    }
}
