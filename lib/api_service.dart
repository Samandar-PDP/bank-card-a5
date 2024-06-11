import 'package:flutter/material.dart';
import 'package:full_retrofit/bank_card.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService (Dio dio, {String baseUrl}) = _ApiService;

  @GET("cards")
  Future<List<BankCard>> getMyCards();

  @DELETE("cards/{id}")
  Future<HttpResponse> deleteCard(@Path("id") String id);

  @POST('cards')
  Future<HttpResponse> createCard(@Body() BankCard card);
}
Dio buildDioClient(String base) {
  final dio = Dio()..options = BaseOptions(baseUrl: base);
  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90));
  return dio;
}