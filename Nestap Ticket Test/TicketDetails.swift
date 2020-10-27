//
//  TicketDetails.swift
//  Nestap Ticket Test
//
//  Created by SNMBoy on 22/10/20.
//

import UIKit

class TicketDetails: UIViewController{
    
    var ticketId: Int?
    var ticket:TicketModel? = nil
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var closeBtn: UILabel!
    @IBOutlet weak var navBarTitle: UILabel!
    
    @IBOutlet weak var ticketCategoryType: UILabel!
    @IBOutlet weak var raisedBy: UILabel!
    @IBOutlet weak var createdAt: UILabel!
    @IBOutlet weak var noFiles: UILabel!
    @IBOutlet weak var imageCollections: UICollectionView!
    @IBOutlet weak var commentSection: UITableView!
    @IBOutlet weak var commentSectionHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.isHidden = true
        
        let tvTitleOnClick = UITapGestureRecognizer(target: self, action: #selector(TicketDetails.tapFunction))
        closeBtn.isUserInteractionEnabled = true
        closeBtn.addGestureRecognizer(tvTitleOnClick)
        
//        navBarTitle.text = "\(String(ticketId!))"
        
        if let id = ticketId{
            APIs().getTicket(ticketId: id){ (ticket) in
                print(ticket)
                self.ticket = ticket
                self.mainView.isHidden = false
                self.ticketCategoryType.text = getTicketCategory(category_type: ticket.category_type)
                self.raisedBy.text = ticket.submitted_by_profile?.profile_name
                self.createdAt.text = ticket.created_at
                
                if ticket.attachments != nil {
                    self.noFiles.isHidden = true
                    self.imageCollections.dataSource = self
                
                    let cellNib = UINib(nibName: "ImageCollectionViewCell", bundle: nil)
                    self.imageCollections.register(cellNib, forCellWithReuseIdentifier: "imageViewCell")
                }
                
                if ticket.comments != nil {
                    self.commentSection.dataSource = self
                    self.commentSection.delegate = self
                    
                    self.commentSectionHeight.constant = CGFloat(Double(ticket.comments!.count) * 120)
                    
                    let cellNibx = UINib(nibName: "TicketCommentCellTableViewCell", bundle: nil)
                    self.commentSection.register(cellNibx, forCellReuseIdentifier: "commentSection")
                }
            }
        }
        
        
        
    }
    
    
    @objc func tapFunction(sender:UITapGestureRecognizer){
        self.dismiss(animated: true)
    }
}

extension TicketDetails:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
}

extension TicketDetails:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (ticket?.comments!.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = commentSection.dequeueReusableCell(withIdentifier: "commentSection",for: indexPath) as! TicketCommentCellTableViewCell
        
        cell.comment?.text = ticket?.comments?[indexPath.row].comment
        cell.commentDate?.text = ticket?.comments?[indexPath.row].created_at
        cell.commentedName?.text = ticket?.comments?[indexPath.row].commented_by.name
        
        return cell
    }
    
    
}


extension TicketDetails:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.ticket?.attachments?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.imageCollections.dequeueReusableCell(withReuseIdentifier: "imageViewCell", for: indexPath) as! ImageCollectionViewCell
        
        cell.imageView.imageFromURL(urlString: (self.ticket?.attachments?[indexPath.row].path)!)
        
        
        return cell
    }
    
    
}
extension UIImageView {
    public func imageFromURL(urlString: String) {

        let activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        activityIndicator.startAnimating()
        if self.image == nil{
            self.addSubview(activityIndicator)
        }

        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in

            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                activityIndicator.removeFromSuperview()
                self.image = image
            })

        }).resume()
    }
}
