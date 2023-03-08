//
//  ViewController.swift
//  AlamofireExample
//
//  Created by 김태성 on 2023/02/14.
//

import UIKit

class ViewController: UIViewController {

    lazy var requestGetButton: UIButton = {
       let button = UIButton()
        button.setTitle("Request Get", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 20
       return button
    }()
    
    lazy var requestPostButton: UIButton = {
       let button = UIButton()
        button.setTitle("Request Post", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 20
       return button
    }()
    
    lazy var messageTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .systemGray
        textView.textColor = .white
        textView.layer.cornerRadius = 20
        return textView
    }()
    
    lazy var loadingView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView()
        indicatorView.backgroundColor = .darkGray.withAlphaComponent(0.5)
        
        return indicatorView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        // Do any additional setup after loading the view.
    }
    
    func configureView() {
        view.backgroundColor = .white
        view.addSubview(requestGetButton)
        view.addSubview(requestPostButton)

        view.addSubview(messageTextView)
        view.addSubview(loadingView)
        setAutoLayoutConstraints()
        setEvent()
    }
    
    func setAutoLayoutConstraints() {
        messageTextView.translatesAutoresizingMaskIntoConstraints = false
        let centerXOfMessageTextView = NSLayoutConstraint(item: messageTextView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        let centerYOfMessageTextView = NSLayoutConstraint(item: messageTextView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 0.8, constant: 0)
        let widthOfMessageTextView = NSLayoutConstraint(item: messageTextView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.9, constant: 0)
        let heightOfMessageTextView = NSLayoutConstraint(item: messageTextView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.6, constant: 0)
        view.addConstraints([centerXOfMessageTextView, centerYOfMessageTextView, widthOfMessageTextView, heightOfMessageTextView])

        
        requestGetButton.translatesAutoresizingMaskIntoConstraints = false
        let centerXOfRequestGetButton = NSLayoutConstraint(item: requestGetButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        let centerYOfRequestGetButton = NSLayoutConstraint(item: requestGetButton, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.55, constant: 0)
        let widthOfRequestGetButton = NSLayoutConstraint(item: requestGetButton, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.4, constant: 0)
        let heightOfRequestGetButton = NSLayoutConstraint(item: requestGetButton, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.05, constant: 0)
        view.addConstraints([centerXOfRequestGetButton, centerYOfRequestGetButton, widthOfRequestGetButton, heightOfRequestGetButton])
        
        requestPostButton.translatesAutoresizingMaskIntoConstraints = false
        let centerXOfRequestPostButton = NSLayoutConstraint(item: requestPostButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        let centerYOfRequestPostButton = NSLayoutConstraint(item: requestPostButton, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.7, constant: 0)
        let widthOfRequestPostButton = NSLayoutConstraint(item: requestPostButton, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.4, constant: 0)
        let heightOfRequestPostButton = NSLayoutConstraint(item: requestPostButton, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.05, constant: 0)
        view.addConstraints([centerXOfRequestPostButton, centerYOfRequestPostButton, widthOfRequestPostButton, heightOfRequestPostButton])

        
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        let centerXOfLoadingView = NSLayoutConstraint(item: loadingView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        let centerYOfLoadingView = NSLayoutConstraint(item: loadingView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
        let widthOfLoadingView = NSLayoutConstraint(item: loadingView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: 0)
        let heightOfLoadingView = NSLayoutConstraint(item: loadingView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1, constant: 0)
        view.addConstraints([centerXOfLoadingView, centerYOfLoadingView, widthOfLoadingView, heightOfLoadingView])

    }
    
    func setEvent() {
        requestGetButton.addTarget(self, action: #selector(tappedRequestGetButton), for: .touchUpInside)
        requestPostButton.addTarget(self, action: #selector(tappedRequestPostButton), for: .touchUpInside)

    }


}

extension ViewController {
    
    @objc
    func tappedRequestGetButton() {
        loadingView.startAnimating()
        
        NetworkingClinet.shared.request(serviceURL: .testGetURL, httpMethod: .get, type: NetworkTest
            .self) { responseData , error in
            if let responseData = responseData {
                if let message = responseData.0 {
                    self.messageTextView.text = message
                }
                
                if let data = responseData.1 {
                    print(data)
                }
            }
            self.loadingView.stopAnimating()
        }
    }
    
    @objc
    func tappedRequestPostButton() {
        loadingView.startAnimating()
        
        NetworkingClinet.shared.request(serviceURL: .testPostURL, httpMethod: .post, parameter: NetworkTestElement(userID: 1, id: 1, title: "foo", body: "bar"), type: NetworkTest
            .self) { responseData , error in
            if let responseData = responseData {
                if let message = responseData.0 {
                    self.messageTextView.text = message
                }
                
                if let data = responseData.1 {
                    print(data)
                }
            }
            self.loadingView.stopAnimating()
        }
    }
}
