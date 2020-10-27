//
//  ViewController.swift
//  Nestap Ticket Test
//
//  Created by SNMBoy on 22/10/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{
    
    var tickets:[TicketModel] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIs().getTickets{(tickets) in

            self.tickets = tickets
            print(tickets)
            self.tableView.reloadData()
        }
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
        
        
        // Register table cell class from nib
        let cellNib = UINib(nibName: "ListViews", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "tableViewCell")
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tickets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell",for: indexPath) as! ListViews
        let ticket = tickets[indexPath.row]
        cell.title.text = getTicketCategory(category_type: ticket.category_type)
            //"categoryID "+String(ticket.category_id!)
        
        
        cell.dateTime.text = ticket.created_at
        cell.titleRef.text = "\(ticket.ticket_number)"
        return cell
        
    }
        
    
    


}


extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ticket = tickets[indexPath.row]
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "TicketDetails") as! TicketDetails
        newViewController.modalPresentationStyle = .fullScreen
        newViewController.modalTransitionStyle = .coverVertical
        newViewController.modalPresentationCapturesStatusBarAppearance = true
        newViewController.ticketId = ticket.id
        self.present(newViewController, animated: true, completion: nil)
    }
}


