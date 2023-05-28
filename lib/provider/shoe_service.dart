import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shoe_app/models/shoe.dart';

class ShoeService {
  Future<List<Shoe>> getAll() async {
    final uri = Uri.parse('https://shoes-collections.p.rapidapi.com/shoes');
    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': '3378455a21mshe80f088828759f6p133541jsn77ce84169137'
    });

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final shoes = json
          .map((e) => Shoe(
                descreption: e['description'],
                id: e['id'],
                imageUrl: e['image'],
                name: e['name'],
                price: e['price'].toString(),
                rating: e['rating']['rate'].toString(),
              ))
          .toList();
      return shoes;
    }
    throw 'error';
  }
}
