//
//  ViewController.swift
//  SMUIK_2
//
//  Created by Andrei Kovryzhenko on 05.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var buttonOne = CustomButton()
    private var buttonTwo = CustomButton()
    private var buttonThree = CustomButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpConstraint()
    }
    
    private func setUpConstraint() {
        setUpButtonOne()
        setUpButtonTwo()
        setUpButtonThree()
    }
    
    // MARK: Setup buttons
    private func setUpButtonOne() {
        view.addSubview(buttonOne)
        buttonOne.setTitle("First Button", for: .normal)
        
        buttonOne.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonOne.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            buttonOne.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    private func setUpButtonTwo() {
        view.addSubview(buttonTwo)
        buttonTwo.setTitle("Second Medium Button", for: .normal)
        
        buttonTwo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonTwo.topAnchor.constraint(equalTo: buttonOne.bottomAnchor, constant: 6),
            buttonTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    private func setUpButtonThree() {
        view.addSubview(buttonThree)
        buttonThree.setTitle("Third", for: .normal)
        buttonThree.addTarget(self, action: #selector(buttonTaped), for: .touchUpInside)
        
        buttonThree.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonThree.topAnchor.constraint(equalTo: buttonTwo.bottomAnchor, constant: 6),
            buttonThree.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    // MARK: Methods
    @objc func buttonTaped() {
        let newVC = UIViewController()
        newVC.view.backgroundColor = .white
        present(newVC, animated: true)
    }
}

//MARK: Custom Button
class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButton()
    }
    
    // MARK: Button's configuration
    override func tintColorDidChange() {
        if tintAdjustmentMode == .dimmed {
            configuration?.background.backgroundColor = .systemGray2
            imageView?.tintColor = .systemGray3
            titleLabel?.textColor = .systemGray3
        } else {
            configuration?.background.backgroundColor = .systemBlue
            configuration?.baseForegroundColor = .white
        }
    }
    
    private func setUpButton() {
        configuration = UIButton.Configuration.filled()
        setImage(UIImage(systemName: "arrow.right.circle.fill"), for: .normal)
        configuration?.imagePlacement = .trailing
        configuration?.imagePadding = 8
        configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        addTarget(self, action: #selector(scaleDownButton), for: .touchDown)
        addTarget(self, action: #selector(scaleUpButton), for: .touchUpInside)

    }
    
    // MARK: Animate button
    @objc func scaleDownButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1,
                       delay: 0.0,
                       options: .allowUserInteraction,
                       animations: {
            sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        })
    }

    @objc func scaleUpButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1,
                       delay: 0.0,
                       options: .allowUserInteraction,
                       animations: {
            sender.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
