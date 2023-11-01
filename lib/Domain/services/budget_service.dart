import 'package:http/http.dart' as http;
import 'package:main/Data/env/env.dart';
import 'package:main/Domain/models/budget.dart';
import 'dart:convert';

class BudgetService {
  Future<Budget> getBudget(int tripId, String token) async {
    var url = Uri.parse('$backendUrl/trip/budget/$tripId');
    var response;
    try {
      response = await http.get(url,
          headers: {'Content-Type': 'application/json', 'Authorization': token});
    } on Exception catch (e) {
      print(e);
      throw Exception('Failed to load budget');
    }
    if (response.statusCode == 200) {
      return Budget.fromJson(
          (jsonDecode(response.body) as Map<String, dynamic>));
    }
    if (response.statusCode == 401) {
      throw Exception('Please login to view your budget');
    }
    if (response.statusCode == 500) {
      throw Exception("Server error. It's not you, it's us");
    }
    if (response.statusCode == 404) {
      //return a blank budget
      return Budget(id: 0, amount: 0, expenses: []);
    }
    throw Exception('Network Error');
  }

  //create budget
  /**
   * request
   * POST http://localhost:3000/trip/budget HTTP/1.1
Content-Type: application/json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsImZpcnN0TmFtZSI6IkFtYXNoaSIsImxhc3ROYW1lIjoiU2FuZHVuaSIsImVtYWlsIjoiYW1hc2hpQGdtYWlsLmNvbSIsImlzQWRtaW4iOmZhbHNlLCJpYXQiOjE2OTg3NDA2MjIsImV4cCI6MTcwMTMzMjYyMn0.ifmeCVyapr2wx18c9jiCYYYLYEJy4PPl92rSy_zK5u4

{
  "tripId": 1,
  "expenses": [
    {
      "category": "Food",
      "expense_name": "Lunch",
      "amount": 500.00,
      "date" : "10/10/2023"
    },
    {
      "category": "Transportation",
      "expense_name": "Taxi",
      "amount": 100.00,
      "date" : "10/10/2023"
    }
  ]
}

response
TTP/1.1 201 Created
X-Powered-By: Express
Content-Type: application/json; charset=utf-8
Content-Length: 567
ETag: W/"237-DwhIR2q5ALRUpn64aFz6wcKQGUI"
Date: Tue, 31 Oct 2023 09:27:33 GMT
Connection: close

{
  "message": "Budget created successfully",
  "budget": {
    "id": 3,
    "tripID": 1,
    "updatedAt": "2023-10-31T09:27:33.667Z",
    "createdAt": "2023-10-31T09:27:33.245Z",
    "amount": 600
  },
  "expenses": [
    {
      "id": 8,
      "category": 1,
      "expense_name": "Lunch",
      "amount": "500",
      "date": "2023-10-09T18:30:00.000Z",
      "budget_id": 3,
      "userID": 2,
      "updatedAt": "2023-10-31T09:27:33.648Z",
      "createdAt": "2023-10-31T09:27:33.648Z"
    },
    {
      "id": 9,
      "category": 2,
      "expense_name": "Taxi",
      "amount": "100",
      "date": "2023-10-09T18:30:00.000Z",
      "budget_id": 3,
      "userID": 2,
      "updatedAt": "2023-10-31T09:27:33.662Z",
      "createdAt": "2023-10-31T09:27:33.662Z"
    }
  ]
}
   */
  Future<Budget> createBudget(Map<String, dynamic> budget, String token) async {
    var url = Uri.parse('$backendUrl/trip/budget');
    var response;
    try {
      response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': token
          },
          body: jsonEncode(budget));
    } on Exception catch (e) {
      print(e);
      throw Exception('Network Error');
    }
    if (response.statusCode == 201) {
      return Budget.fromJson(
          (jsonDecode(response.body) as Map<String, dynamic>));
    }
    if (response.statusCode == 401) {
      throw Exception('Please login to create a budget');
    }
    if (response.statusCode == 500 || response.statusCode == 404) {
      throw Exception("Server error. It's not you, it's us");
    }
    throw Exception('Network Error');
  }

  /**
   * request
   * PUT http://localhost:3000/trip/budget HTTP/1.1
Content-Type: application/json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsImZpcnN0TmFtZSI6IkFtYXNoaSIsImxhc3ROYW1lIjoiU2FuZHVuaSIsImVtYWlsIjoiYW1hc2hpQGdtYWlsLmNvbSIsImlzQWRtaW4iOmZhbHNlLCJpYXQiOjE2OTg3NDA2MjIsImV4cCI6MTcwMTMzMjYyMn0.ifmeCVyapr2wx18c9jiCYYYLYEJy4PPl92rSy_zK5u4

{
    "trip":{
      "id":4
    },
  "expenses": [
    {
      "expense_name": "Taxi",
      "amount": 4334,
      "category": "Transportation",
      "date" : "10/10/2023"
    },
    {
      "expense_name": "Hotel fare",
      "amount": 5000,
      "category": "Accomodation",
      "date" : "10/11/2023"
    },
    {
      "expense_name": "Park Tickets",
      "amount": 5000,
      "category": "Tickets",
      "date" : "10/12/2023"
    }
  ]
}

response
HTTP/1.1 201 Created
X-Powered-By: Express
Content-Type: application/json; charset=utf-8
Content-Length: 34
ETag: W/"22-lXM8Uz2GUyXTKE4UlnpCc0IKN8s"
Date: Tue, 31 Oct 2023 09:29:07 GMT
Connection: close

{
  "message": "Updated successfully"
}
   */
  Future<Budget> updateBudget(Map<String, dynamic> budget, String token) async {
    var url = Uri.parse('$backendUrl/trip/budget');
    var response;
    try {
      response = await http.put(url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': token
          },
          body: jsonEncode(budget));
    } on Exception catch (e) {
      print(e);
      throw Exception('Network Error');
    }
    if (response.statusCode == 201) {
      return Budget(amount: 0, expenses: [], id: 0);
    }
    if (response.statusCode == 401) {
      throw Exception('Please login to update your budget');
    }
    if (response.statusCode == 500 || response.statusCode == 404) {
      throw Exception("Server error. It's not you, it's us");
    }
    throw Exception('Network Error');
  }

  
}