//
//  InfoViewController.swift
//  Navigation
//
//  Created by Сергей Белкин on 03.06.2022.
//

import UIKit

class InfoViewController: UIViewController {
    private lazy var alertButton: UIButton = {
    let alertButton = UIButton(frame: CGRect(x: 110, y: 400, width: 200, height: 80))
    alertButton.backgroundColor = .red
    alertButton.layer.cornerRadius = 12
    alertButton.setTitle("Нажмите для проверки", for: .normal)
    alertButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    alertButton.setTitleColor(.white, for: .normal)
    alertButton.addTarget(self, action: #selector(self.alertButtonAction), for: .touchUpInside)
    
        return alertButton
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(self.alertButton)
    }
    
    @objc func alertButtonAction() {
        let alert = UIAlertController(title: "Done", message: "Проверка прошла успешно", preferredStyle: .alert)
        
        let firstAction = UIAlertAction (title: "Информация", style: .default, handler:{_ in print("Кнопка 1 работает")})
        let secondAction = UIAlertAction (title: "Вернуться назад", style: .cancel, handler: {_ in print("Кнопка 2 работает")})
        
        alert.addAction(firstAction)
        alert.addAction(secondAction)
        
        
        present(alert, animated: true, completion: nil)
    }
}
