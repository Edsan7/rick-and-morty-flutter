import 'package:dio/dio.dart';

const kTitleApp = 'Rick and Morty!';
const kBaseUrl = 'https://rickandmortyapi.com/api/';
const kInitialPage = 'character/?page=1';
const kInitialSearch = 'character/?page=1&name=';


final kDioOptions = BaseOptions(
  baseUrl: kBaseUrl,
  connectTimeout: 5000,
  receiveTimeout: 3000,
  contentType: 'application/json; charset=utf-8'
);