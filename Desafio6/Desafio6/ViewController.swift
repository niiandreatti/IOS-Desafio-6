//
//  ViewController.swift
//  Desafio6
//
//  Created by Nicolas Santana on 24/04/23.
//
import JGProgressHUD
import UIKit

class ViewController: UIViewController {

    //MARK: life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }

    //Mark: Itens
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Clique aqui", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    //Mark: Helpers
    func configureUI(){
        view.addSubview(button)
        configureLayouts()
        
    }
    
    func configureLayouts(){
        let button = [
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(button)
    }
    
    //MARK: func JGProgress(Objc)

    func showexemple(){
        let hub = JGProgressHUD()
        hub.textLabel.text = "Loading"
        hub.detailTextLabel.text = "Plese wait"
        hub.show(in: view)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            hub.indicatorView = JGProgressHUDSuccessIndicatorView()
            hub.detailTextLabel.text = nil
            hub.textLabel.text = "Done!"
            hub.dismiss(afterDelay: 1.0)
        }
        
    }
    
    //MARK: Objc
    
    @objc func buttonTapped(sender: UIButton){
        sender.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() , execute:  {
            self.showexemple()
        })
    }
}

