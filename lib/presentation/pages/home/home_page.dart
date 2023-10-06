import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9FF),
      body: Row(children: [
        _menu,
        _content,
      ]),
    );
  }

  Widget get _menu {
    return Container(
      width: 280,
      height: 800,
      color: const Color(0xFFF1F1F1),
    );
  }

  Widget get _content {
    return Container(width: 1000, height: 800);
  }
}
