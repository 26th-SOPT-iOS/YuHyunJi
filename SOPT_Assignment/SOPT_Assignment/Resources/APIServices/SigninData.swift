//
//  SigninData.swift
//  SOPT_Assignment
//
//  Created by hjyoo on 2020/05/16.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import Foundation

struct SigininData: Codable {
    var status: Int
    var success: Bool
    var message: String
    var data: TokenData?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case success = "success"
        case message = "message"
        case data = "data"
    }
    //data를 받을 때 key 값이 있는 경우, 없는 경우를 모두 처리하기 위해 필요
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(TokenData.self, forKey: .data)) ?? nil
    }
}

struct TokenData: Codable {
    var jwt: String
}
