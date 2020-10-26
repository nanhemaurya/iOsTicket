//
//  Apis.swift
//  Nestap Ticket Test
//
//  Created by SNMBoy on 23/10/20.
//

import Foundation




class APIs {
    
    let authorization = "JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjEwMzYyMzQ2LCJqdGkiOiJhZjQzZGM2ZTBlMzA0MTUzYTE3ODgwMGE5NmE3OGQwOSIsInVzZXJfaWQiOjJ9.tlNdeHByTkuSIAgEdpMrSrNEedY85KiQi9E2J-R_mCU"
    
    
    
    func getTickets(result: @escaping( _ tickets:[TicketModel])->()) {
        let url = URL(string: "http://13.250.25.252:49999/api/profile/3/ticket/")!
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [
            "Authorization": authorization,
          "Content-Type": "application/json"
        ]

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
//                let dat = NSString(data: data!, encoding:String.Encoding.utf8.rawValue)! as String
//                let dataX = Data(dat.utf8)
                let tickets = try JSONDecoder().decode([TicketModel].self, from: data!)
                DispatchQueue.main.async {
                    result(tickets)
                }
            } catch { print(error) }
            
        }
        .resume()
    }
    
    func getTicket(ticketId:Int,result: @escaping( _ ticket:TicketModel)->()) {
        let url = URL(string: "http://13.250.25.252:49999/api/profile/3/ticket/\(ticketId)/")!
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [
            "Authorization": authorization,
          "Content-Type": "application/json"
        ]

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                let tickets = try JSONDecoder().decode(TicketModel.self, from: data!)
                DispatchQueue.main.async {
                    result(tickets)
                }
            } catch { print(error) }
            
            
        }
        .resume()
    }
    
    
    
    
}
