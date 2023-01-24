import 'package:galaxy/app/modules/home/model/all_products_model.dart';
import 'package:galaxy/app/service/base_controller.dart';
import 'package:get/get.dart';

import '../../../service/api_urls.dart';
import '../../../service/dio_client.dart';

class HomeController extends GetxController with BaseController {
  //TODO: Implement HomeController

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  int current = 0;

  ///API
  final products = RxList<AllProducts>();

  getProductList() async {
    showLoading();
    var response = await DioClient()
        .get(url: ApiUrl.allProducts, header: {}).catchError(handleError);
    if (response == null) return;
    print(response);
    products.assignAll(
        (response as List).map((e) => AllProducts.fromJson(e)).toList());
    hideLoading();
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    await getProductList();
    super.onReady();
  }
}
