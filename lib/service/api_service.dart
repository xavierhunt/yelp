import 'package:retrofit/http.dart';
import 'package:yelp_task/models/list_of_businesses.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

@RestApi(
  baseUrl: 'https://api.yelp.com/v3/',
)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;
  //The yelp API GET request needs to include an HTTP header for the API key.
  @GET('businesses/search?location=Auckland&sort_by=best_match&limit=20')
  Future<ListOfBusinesses> getBusinesses(
      @Header('Authorization') String apiKey);
}
