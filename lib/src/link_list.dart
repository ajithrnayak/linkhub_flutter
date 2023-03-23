import 'dart:convert';
import 'package:flutter/material.dart';
import 'link.dart';

class LinkList extends StatefulWidget {
  const LinkList({super.key, required this.title});

  final String title;
  @override
  State<LinkList> createState() => _LinkListState();
}

class _LinkListState extends State<LinkList> {
  List<Link> _links = [];

  @override
  void initState() {
    super.initState();
    _loadLinks();
  }

  Future<void> _loadLinks() async {
    final jsonStr =
        await DefaultAssetBundle.of(context).loadString('data/links.json');
    final jsonData = json.decode(jsonStr);
    setState(() {
      _links = List.from(jsonData.map((data) => Link.fromJson(data)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LinkHub'),
      ),
      body: _links != null
          ? ListView.builder(
              itemCount: _links.length,
              itemBuilder: (context, index) {
                final link = _links[index];
                String imageUrl =
                    'https://t0.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=${link.url}&size=24';
                return ListTile(
                  leading: Image.network(
                    imageUrl,
                    width: 24,
                    height: 24,
                    fit: BoxFit.cover,
                  ),
                  title: Text(link.title),
                  subtitle: Text(link.url),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  onTap: () {},
                  isThreeLine:
                      true, // This enables the display of subtitle below the title
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
