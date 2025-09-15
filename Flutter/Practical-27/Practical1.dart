import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsPaginationScreen extends StatefulWidget {
  const NewsPaginationScreen({super.key});

  @override
  State<NewsPaginationScreen> createState() => _NewsPaginationScreenState();
}

class _NewsPaginationScreenState extends State<NewsPaginationScreen> {
  final String apiKey = "c9fcb8f5a0bbd0de9071bd1cf2dc1477";
  final List articles = [];
  int page = 1;
  bool isLoading = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchNews();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchNews();
      }
    });
  }

  Future<void> fetchNews() async {
    if (isLoading) return;
    setState(() => isLoading = true);

    // in the query parameter
    // you can change lang for eng = en , hindi=hi
    //same for country for india = in,us = us, canada=ca

    final url =
        "https://gnews.io/api/v4/search?q=example&lang=en&country=in&max=10&page=$page&apikey=$apiKey";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        articles.addAll(data["articles"]);
        page++;
        isLoading = false;
      });
    } else {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to load news. Status: ${response.statusCode}"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("News App with Pagination")),
      body: GridView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: articles.length + 1,
        // +1 for loader
        itemBuilder: (context, index) {
          if (index < articles.length) {
            final article = articles[index];
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  article["image"] != null
                      ? ClipRRect(
                          borderRadius: BorderRadiusGeometry.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.network(
                            article["image"],
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Container(
                          height: 100,
                          color: Colors.grey[300],
                          child: const Center(child: Text("No Image")),
                        ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      article["title"] ?? "No Title",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: isLoading
                  ? const CircularProgressIndicator()
                  : const SizedBox(),
            );
          }
        },
      ),
    );
  }
}
