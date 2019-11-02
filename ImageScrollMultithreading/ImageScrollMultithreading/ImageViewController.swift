//
//  ImageViewController.swift
//  ImageScrollMultithreading
//
//  Created by IOS on 02/11/19.
//  Copyright © 2019 IOS. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController,UIScrollViewDelegate{

    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.minimumZoomScale = 1/10
            scrollView.maximumZoomScale = 2.0
            scrollView.delegate = self
            scrollView.addSubview(imageView)
        }
    }
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    var imageView = UIImageView()
     var imageURL:URL?{
        didSet{
            image = nil
        fetchimage()
        }
    }
     
     var image:UIImage? {
         get{
             return imageView.image
         }
         set{
             imageView.image = newValue
             imageView.sizeToFit()
             scrollView?.contentSize = imageView.frame.size
             spinner?.stopAnimating()
         }
     }
    //getting image from  URL  and run it from another thread
    func fetchimage(){
        if let url = imageURL{
            spinner?.startAnimating()
            DispatchQueue.global(qos: .userInitiated).async {
                let urlContent = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    if let imageData = urlContent ,url == self.imageURL{
                        self.image = UIImage(data: imageData)
                    }
                }
            }
        }
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if imageView.image == nil {
            fetchimage()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       // if imageURL == nil {
         //   imageURL = DemoURLs.sby
       // }
        
        
    }
    

 

}
