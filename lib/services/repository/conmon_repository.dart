import 'package:mor_flutter_project/services/api/base_api.dart';

class CommonRepository {
  APIDataStore apiDataStore = APIDataStore();

  // Future<List<ProvinceModel>?> getListGroup() async {
  //   try {
  //     final response = await apiDataStore.requestAPI(
  //       ApiURL.getListGroup,
  //       options: buildCacheOptions(const Duration(days: 30)),
  //     );

  //     final json = JSON(response['data'])
  //         .listValue
  //         .map((e) => ProvinceModel.fromJson(e))
  //         .toList();

  //     return json;
  //   } catch (e) {
  //     throw ErrorFromServer.unknownError();
  //   }
  // }
}
