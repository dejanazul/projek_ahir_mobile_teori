import 'dart:convert';

import 'package:projek_ahir_mobile_teori/features/ticket/models/ticket_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl =
      'https://app.ticketmaster.com/discovery/v2/events.json?classificationName=music&dmaId=324&apikey=PNFUu7sW56rWaCgI9U8QH1aoJPzApXSP&size=';

  Future<List<TicketModel>> fetcTicket({int size = 10}) async {
    final Uri uri = Uri.parse("baseUrl$size"); //api mati
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final embeded = jsonData['_embedded'] ?? {};
      final eventJson = embeded['events'] as List<dynamic>? ?? [];
      return eventJson
          .map(
            (json) => TicketModel.fromJson(json as Map<String, dynamic>),
          )
          .toList();
    } else {
      throw Exception('Failed to load data at API SERVICE');
    }
  }
}
