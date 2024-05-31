import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../data/argument/browser_argument.dart';

class BrowserScreen extends StatefulWidget {
  final BrowserArgument args;

  const BrowserScreen({super.key, required this.args});

  @override
  BrowserFormState createState() => BrowserFormState();
}

class BrowserFormState extends State<BrowserScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
     _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
            print("Minh Do ---- onProgress: $progress");
          },
          onPageStarted: (String url) {
            // Do something when page starts loading.
            print("Minh Do ---- onPageStarted");
          },
          onPageFinished: (String url) {
            // Do something when page finishes loading.
            print("Minh Do ---- onPageFinished");
          },
          onWebResourceError: (WebResourceError error) {
            print("Minh Do ---- onWebResourceError: $error");
            // Handle error.
          },
        ),
      )..loadRequest(
        Uri.parse(widget.args.url ?? ""),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.args.title),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
