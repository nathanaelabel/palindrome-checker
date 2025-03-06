//
//  ViewController.swift
//  Palindrome
//
//  Created by Nathanael Abel on 28/02/25.
//

import UIKit

class ViewController: UIViewController {
    
    let textField: UITextField = {
        let text = UITextField()
        text.placeholder = "Input words:"
        text.borderStyle = .roundedRect  // Tambahkan border agar terlihat lebih baik
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let checkButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Check Palindrome", for: .normal) // Tambahkan teks tombol
        button.addTarget(ViewController.self, action: #selector(checkPalindrome), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(textField)
        view.addSubview(checkButton)
        view.addSubview(resultLabel)
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            textField.widthAnchor.constraint(equalToConstant: 250),
            
            checkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            checkButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabel.topAnchor.constraint(equalTo: checkButton.bottomAnchor, constant: 20),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    @objc func checkPalindrome() {
        guard let text = textField.text, !text.isEmpty else {
            resultLabel.text = "Masukkan teks terlebih dahulu!"
            return
        }
        
        let cleanInput = text.lowercased().replacingOccurrences(of: " ", with: "")
        let reverseInput = String(cleanInput.reversed())
        
        if cleanInput == reverseInput {
            resultLabel.text = "Kata tersebut adalah palindrome!"
        } else {
            resultLabel.text = "Kata tersebut bukan palindrome."
        }
    }
}
