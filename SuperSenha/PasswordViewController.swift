//
//  PasswordViewController.swift
//  SuperSenha
//
//  Created by Felipe Almeida on 06/07/2022.
//  Copyright © 2022 Curso iOS. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController {
    
    
    @IBOutlet weak var tvPassword: UITextView!
    
    var numberOfCharacter: Int = 10
    var numberOfPasswords: Int = 1
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useEspecialCharacters: Bool!
    
    var passwordGenerator: PasswordGenerator!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Total de senhas: \(numberOfPasswords)"
        passwordGenerator = PasswordGenerator(numberOfCharacter: numberOfCharacter, useLetters: useLetters, useNumbers: useNumbers, useCapitalLetters: useCapitalLetters, useSpecialCharacters: useEspecialCharacters)
        
        generatePasswords()
        }
    
    func generatePasswords() {
        tvPassword.scrollRangeToVisible(NSRange(location: 0, length: 0))
        tvPassword.text = ""
        let passwords = passwordGenerator.generate(total: numberOfPasswords)
        for password in passwords {
            tvPassword.text.append(password + "\n\n")
        }
     }
    
    @IBAction func generate(_ sender: UIButton) {
        generatePasswords()
    }
    
    

    
}
