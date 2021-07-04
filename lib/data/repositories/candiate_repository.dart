
import 'package:learn/core/constants/api_path.dart';
import 'package:learn/data/http/api.dart';
import 'package:learn/data/http/request_response.dart';

class CandidateRepository{

  Future<RequestResponse> loginCandidate({required String email, required String password}) async{
    Map<String, dynamic> body = {
      'email': email,
      'password': password,
    };

    return httpManager.fetch(ApiPath.LOGIN, body, POST_METHOD, isFormData: true);
  }

}