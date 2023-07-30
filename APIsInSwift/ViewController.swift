//
//  ViewController.swift
//  Networking
//
//  Created by Ahmed Elgendy on 20.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    let tokenManager = TokenManager()
    lazy var client = AlamofireHTTPClient(tokenManager: tokenManager)
    lazy var respository = ProductsRepository(client: client)
    lazy var authRespository = AuthenticationRepository(client: client, tokenManager: tokenManager)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.startAnimating()
        Task {
            do {
                try await authRespository.login(username: "mor_2314", password: "83r5^_")
                let result = try await respository.updateProduct(
                    with: UpdateProductParams(
                        id: 7,
                        title: "Coursera project",
                        price: 13.5,
                        description: "APIs in Swift",
                        category: nil
                    )
                )
                print("Result", result)
            } catch {
                print("Error:", error.localizedDescription)
            }
            activityIndicatorView.stopAnimating()
        }
    }
}
