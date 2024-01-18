import 'package:dio/dio.dart';
import 'package:hackfest_mobile/models/user_model.dart';

class UserRepository{
  Dio dio = Dio(BaseOptions(baseUrl: 'https://0bbf-104-28-245-128.ngrok-free.app'));
  
  Future<UserModel> getUser (String token)async{
    try{
      final response = await dio.get('/users/profile',options: Options(headers:{"Authorization":"Bearer $token"}));
      print(response.data);
      return UserModel.fromJson(response.data['data']);
    }catch(e){
      throw e.toString();
    }
    
  }
}