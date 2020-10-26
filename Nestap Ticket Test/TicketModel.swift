//
//  TicketModel.swift
//  Nestap Ticket Test
//
//  Created by SNMBoy on 22/10/20.
//

import Foundation

enum TicketCategoriesEnum:UInt8 {
    typealias RawValue = UInt8

    case TCC_ELECTRICITY = 1
    case TCC_PLUMBER = 2
    case TCC_HOUSE_KEEPING = 3
    case TCC_SECURITY = 4
    case TCC_GARDENER = 5
    
}

func getTicketCategory(category_type:UInt8) -> String {
       let type = TicketCategoriesEnum(rawValue: category_type)
        switch (type) {
           case .TCC_ELECTRICITY:
           return "Electricity"
        case .TCC_PLUMBER:
           return "Plumber"
        case .TCC_HOUSE_KEEPING:
           return "House Keeping"
        case .TCC_SECURITY:
           return "Security"
        case .TCC_GARDENER:
           return "Gardener"

        case .none:
           return "Unknown"
       }
   }

// MARK: - TicketModel
struct TicketModel:Codable {
    var id: Int
        var version: Int?
        var created_at: String
        var description: String?
        var assigned_to_profile_id: Int?
        var status: UInt8
        var priority: UInt8?
        var due_date: String?
        var category_id: Int?
        var unit_id: Int
        var submitted_by_profile_id: Int
        var ticket_number: String
        var category_type: UInt8
        var comments:[Comments]?
        var attachments: [Attachments]?
        var assigned_to_profile : Assigned_to_profile?
        var submitted_by_profile : Submitted_by_profile?
}



//// MARK: - AssignedToProfile
//struct AssignedToProfile:Codable {
//    let id: Int
//    let name, profileName: String
//}
//
//// MARK: - Comment
//struct Comment:Codable{
//    let id: Int
//    let createdAt, comment: String
//    let profileID: Int
//    let commentedBy: AssignedToProfile
//    let attachments: String?
//}

struct Submitted_by_profile : Codable {
    let id : Int?
    let name : String?
    let entity_type : Int?
    let profile_name : String?
}

struct Assigned_to_profile : Codable {
    let id : Int?
    let name : String?
    let entity_type : Int?
    let profile_name : String?
}

struct Attachments:Codable {
    let id:Int
    let created_at:String
    let upload:String
    let profile_id:Int
    let attached_by: Assigned_to_profile
    let path:String
}

struct Comments:Codable {
    let id:Int
    let comment:String
    let profile_id:Int
    let created_at:String
    let commented_by:Assigned_to_profile
    
}
