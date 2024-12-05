import 'package:dio/dio.dart';
import 'package:lanars_tech_task/data/models/pexels_api_model.dart';
import 'package:retrofit/retrofit.dart';

part 'photo_list_repository_impl.g.dart';

@RestApi(baseUrl: "https://api.pexels.com/v1/")
abstract class PhotoListRepository {
  factory PhotoListRepository(Dio dio, {String baseUrl}) = _PhotoListRepository;

  @GET("curated")
  Future<PexelsResponseModel> fetchPhotosListData({
    @Query("per_page") int perPage = 50,
  });
}
