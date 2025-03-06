//
//  PalindromeAlternative.swift
//  
//
//  Created by Nathanael Abel on 28/02/25.
//

import SwiftUI

// Alternative using SwiftUI
struct PalindromeAlternative: View {
    @State private var inputText: String = ""
    @State private var resultText: String = ""
    
    var body: some View {
        VStack {
            Text("Palindrome Checker")
            
            TextField("Masukkan kata: ", text: $inputText)
                .padding()
            
            Button(action: checkPalindrome) {
                Text("Check")
                    .padding()
            }
            
            Text(resultText)
                .padding()
        }
        Spacer()
    }
    
    func checkPalindrome() {
        let cleanInput = inputText.lowercased().replacingOccurrences(of: " ", with: "")
        let reverseInput = String(cleanInput.reversed())
        
        if cleanInput.isEmpty {
            resultText = "Masukkan kata terlebih dahulu"
        } else if (cleanInput == reverseInput) {
            resultText = "Kata adalah palindrome!"
        } else {
            resultText = "Kata tersebut bukan palindrome"
        }
    }
}

struct PalindromeAlternative_Previews: PreviewProvider {
    static var previews: some View {
        PalindromeAlternative()
    }
}
