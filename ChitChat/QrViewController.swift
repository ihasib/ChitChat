//
//  QrViewController.swift
//  ChitChat
//
//  Created by S M Hasibur Rahman on 25/7/23.
//

import UIKit

class QrViewController: UIViewController {
    @IBOutlet weak var qrImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        qrImageView.image = generateQRCode(from: "HASIB")
        view.backgroundColor = .red
    }

    func generateQRCode(from text: String) -> UIImage? {
        let data = text.data(using: .ascii)

        let filter = CIFilter(name: "CIQRCodeGenerator")!
        filter.setValue(data, forKey: "inputMessage")
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let im = UIImage(ciImage: filter.outputImage!.transformed(by: transform))
        return im
    }
}
