import 'package:dio/dio.dart';
import 'package:lanars_tech_task/data/models/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'user_repository_impl.g.dart';

@RestApi(baseUrl: "https://randomuser.me/api/")
abstract class UserRepository {
  factory UserRepository(Dio dio, {String baseUrl}) = _UserRepository;

  @GET("/")
  Future<UserModel> fetchUser();
}
