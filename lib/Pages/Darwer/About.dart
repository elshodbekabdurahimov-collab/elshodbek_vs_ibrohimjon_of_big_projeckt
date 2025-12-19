import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {

  List posts = [];
  List filteredPosts = [];
  bool isLoading = false;

  Future<void> getData() async {
    setState(() {
      isLoading = true;
    });

    final link = Uri.parse("https://fakestoreapi.com/products");
    final request = await http.get(link);

    if (request.statusCode == 200) {
      final response = json.decode(request.body);
      setState(() {
        posts = response;
        filteredPosts = response;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  void filterPosts(String query) {
    final search = query.toLowerCase();
    setState(() {
      filteredPosts = posts.where((post) {
        final title = post['title'].toString().toLowerCase();
        final price = post['price'].toString().toLowerCase();
        return title.contains(search) || price.contains(search);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text("Products"),
        backgroundColor: Colors.orange,
      ),

      // 🔥 FLOATING ACTION BUTTON
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: getData,
        child: const Icon(Icons.download),
      ),

      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            // 🔹 Search field
            TextField(
              decoration: InputDecoration(
                hintText: "Search products...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: filterPosts,
            ),
            const SizedBox(height: 12),

            // 🔹 GridView
            Expanded(
              child: Builder(
                builder: (context) {
                  if (posts.isEmpty && !isLoading) {
                    return const Center(
                      child: Text(
                        "Ma'lumotni yuklash uchun tugmani bosing",
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  }

                  if (isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (filteredPosts.isEmpty) {
                    return const Center(
                      child: Text(
                        "Hech narsa topilmadi",
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  }

                  return GridView.builder(
                    itemCount: filteredPosts.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      final post = filteredPosts[index];

                      return Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Image.network(
                                  post['image'],
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                post['title'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "\$${post['price']}",
                                style: const TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
