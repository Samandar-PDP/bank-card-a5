import 'package:flutter/cupertino.dart';
import 'package:full_retrofit/api_service.dart';
import 'package:full_retrofit/bank_card.dart';

class Repository {
  final _api = ApiService(buildDioClient("https://6663e14f932baf9032a93ab0.mockapi.io/"));
  Future<List<BankCard>> getMyCards() async {
    try {
      return await _api.getMyCards();
    } catch(e) {
      debugPrint(e.toString());
      return [];
    }
  }
  Future<bool> deleteCard(String id) async {
    final response = await _api.deleteCard(id);
    return response.response.statusCode == 200;
  }
  Future<bool> createCard(BankCard card) async {
    final response = await _api.createCard(card);
    return response.response.statusCode == 201;
  }
}