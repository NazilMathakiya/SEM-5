import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieSearchScreen extends StatefulWidget {
  const MovieSearchScreen({super.key});

  @override
  State<MovieSearchScreen> createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends State<MovieSearchScreen> {
  final TextEditingController _controller = TextEditingController();
  List<dynamic> _movies = [];
  bool _isLoading = false;
  String? _error;

  Future<void> _searchMovie(String query) async {
    if (query.isEmpty) return;

    setState(() {
      _isLoading = true;
      _error = null;
      _movies = [];
    });

    final url =
        "https://imdb.iamidiotareyoutoo.com/search?q=${Uri.encodeComponent(query)}";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data["description"] != null && data["description"].isNotEmpty) {
          setState(() {
            _movies = data["description"];
          });
        } else {
          setState(() {
            _error = "No movie found!";
          });
        }
      } else {
        setState(() {
          _error = "Error: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        _error = "Failed to fetch data: $e";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Movie Search")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: "Enter movie name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _searchMovie(_controller.text),
                  child: const Text("Search"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (_isLoading) const CircularProgressIndicator(),
            if (_error != null)
              Text(
                _error!,
                style: const TextStyle(color: Colors.red),
              ),
            if (_movies.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: _movies.length,
                  itemBuilder: (context, index) {
                    final movie = _movies[index];
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: movie["#IMG_POSTER"] != null
                            ? Image.network(movie["#IMG_POSTER"])
                            : const Icon(Icons.movie),
                        title: Text(movie["#TITLE"] ?? "No title"),
                        subtitle: Text("Year: ${movie["#YEAR"] ?? "N/A"}"),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
