import 'dart:convert';

import 'package:http/http.dart' as http;

// dynamic url = Uri.parse('http://rap2api.taobao.org/app/mock/287346/getList');
dynamic url =
    Uri.parse('https://www.devio.org/io/flutter_app/json/home_page.json');

///首页大接口
class HomeDao {
  static homeDao() async {
    final response = await http.get(url);
    Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
    var result = json.decode(utf8decoder.convert(response.bodyBytes));
    return result;
  }
}
