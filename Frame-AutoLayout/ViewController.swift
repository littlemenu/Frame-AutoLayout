//
//  ViewController.swift
//  Frame-AutoLayout
//
//  Created by 정재훈 on 2019/10/14.
//  Copyright © 2019 Jung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    // @IBOutlet weak var textViewTest: UITextView!
    // @IBOutlet weak var buttonChange: UIButton!
    
    var test: NSLayoutConstraint? = nil
    var test1: NSLayoutConstraint? = nil
    var test2: NSLayoutConstraint? = nil
    
    let textView: UITextView = UITextView()
    let button: UIButton = UIButton(type: .system)
    
    var bool: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        textView.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 200)
        textView.backgroundColor = .systemBlue
        textView.text = "동해물과 백두산이 마르고 닳도록"
        
        button.frame = CGRect(x: 0, y: view.frame.height - 200, width: view.frame.width, height: 100)
        button.setTitle("button", for: .init())
        button.setTitleColor(.systemBlue, for: .init())
        button.isEnabled = true
        button.tintColor = .white
        button.addTarget(self, action: #selector(touchUpInsideChange2(_:)), for: .touchUpInside)
        
        self.view.addSubview(textView)
        self.view.addSubview(button)
        
        // textViewTest.delegate = self
        textView.delegate = self
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        setAutoLayoutFrame(textViewTest: textView, buttonChange: button)
    }
    
    @IBAction func touchUpInsideChange(_ sender: UIButton) {
        
        if bool {
            test?.isActive = false
            test2?.isActive = false
            // test1 = textViewTest.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 500.0)  // 1
            // textViewTest.bottomAnchor.constraint(equalTo: self.buttonChange.topAnchor, constant: -300.0).isActive = true  // 2
            // textViewTest.heightAnchor.constraint(equalToConstant: 500.0).isActive = true
            
            test1 = textView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 500.0)  // 1
            test1?.isActive = true
            
            bool = false
        } else {
            test1?.isActive = false
            // test2 = textViewTest.heightAnchor.constraint(equalToConstant: 100)
            test2 = textView.heightAnchor.constraint(equalToConstant: 100)
            test2?.isActive = true
            
            bool = true
        }
    }
    
    @objc func touchUpInsideChange2(_ sender: UIButton) {
        if bool {
            test?.isActive = false
            test2?.isActive = false
            // test1 = textViewTest.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 500.0)  // 1
            // textViewTest.bottomAnchor.constraint(equalTo: self.buttonChange.topAnchor, constant: -300.0).isActive = true  // 2
            // textViewTest.heightAnchor.constraint(equalToConstant: 500.0).isActive = true
            
            test1 = textView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 500.0)  // 1
            test1?.isActive = true
            
            bool = false
        } else {
            test1?.isActive = false
            // test2 = textViewTest.heightAnchor.constraint(equalToConstant: 100)
            test2 = textView.heightAnchor.constraint(equalToConstant: 100)
            test2?.isActive = true
            
            bool = true
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.endEditing(true)
        }
        return true
    }
    
    func setAutoLayoutFrame(textViewTest: UITextView, buttonChange: UIButton) {
        buttonChange.translatesAutoresizingMaskIntoConstraints = false
        textViewTest.translatesAutoresizingMaskIntoConstraints = false
        
        buttonChange.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        buttonChange.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        textViewTest.backgroundColor = .systemBlue
        
        textViewTest.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        textViewTest.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        textViewTest.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        test = textViewTest.bottomAnchor.constraint(equalTo: self.button.topAnchor)
        test!.isActive = true
        
        // textViewTest.isScrollEnabled = false
    }
}

