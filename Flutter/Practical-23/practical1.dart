import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ModelClass {
  int count;
  String next;
  dynamic previous;
  List<Result> results;

  ModelClass({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });
}

class Result {
  String name;
  String url;

  Result({required this.name, required this.url});
}


class p1 extends StatefulWidget {
  const p1({Key? key}) : super(key: key);
  @override
  _P1State createState() => _P1State();
}

class _P1State extends State<p1> {
  List<Result> pokemons = [];
  int offset = 0;
  bool isLoading = false, hasMore = true;
  final int limit = 15;
  final ScrollController _controller = ScrollController();
  int totalCount = 0;

  @override
  void initState() {
    super.initState();
    fetchData();
    _controller.addListener(() {
      if (_controller.position.pixels >=
              _controller.position.maxScrollExtent - 100 &&
          !isLoading &&
          hasMore) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> fetchData() async {
    setState(() => isLoading = true);
    final url = 'https://pokeapi.co/api/v2/pokemon?offset=$offset&limit=$limit';
    final res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      final data = json.decode(res.body);
      // Use ModelClass for parsing
      ModelClass model = ModelClass(
        count: data['count'],
        next: data['next'] ?? '',
        previous: data['previous'],
        results: (data['results'] as List)
            .map((e) => Result(name: e['name'], url: e['url']))
            .toList(),
      );
      setState(() {
        pokemons.addAll(model.results);
        offset += limit;
        hasMore = model.next.isNotEmpty;
        totalCount = model.count;
        isLoading = false;
      });
    } else {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pokémon List')),
      body: ListView.builder(
        controller: _controller,
        itemCount: pokemons.length + (hasMore ? 1 : 0),
        itemBuilder: (ctx, i) {
          if (i < pokemons.length) {
            final p = pokemons[i];
            return ListTile(title: Text(p.name), subtitle: Text(p.url));
          } else {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
