import 'package:flutter/material.dart';
import 'package:infoodmacion_app/config/styles/app_style.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with AutomaticKeepAliveClientMixin {
  
  final TextEditingController _controller = TextEditingController();
  
  final List<Map<String, String>> _messages = [
    //{"message": "Hola! ¿Cómo estás?", "sender": "user"},
    //{"message": "¡Hola! Todo bien, ¿y tú?", "sender": "bot"},
    //{"message": "Bien también, gracias!", "sender": "user"},
    {"message": "Estamos desarrollando un chat con inteligencia artificial que responderá a tus cuestiones con una base de productos sólida y verificada", "sender": "bot"},
  ];

  void _sendMessage() {
    _controller.clear();
    return;
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        _messages.insert(0, {"message": _controller.text.trim(), "sender": "user"});
        _messages.insert(0, {"message": "Mensaje recibido", "sender": "bot"});
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            reverse: true,
            padding: const EdgeInsets.all(10),
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              final isUser = _messages[index]["sender"] == "user";
              return Align(
                alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isUser ? Colors.blueAccent : Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    _messages[index]["message"]!,
                    style: TextStyle(
                      color: isUser ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  style: const TextStyle(color: Colors.white), // 🔥 Texto blanco en el input
                  decoration: InputDecoration(
                    hintText: "Escribe un mensaje...",
                    hintStyle: const TextStyle(color: Colors.white70), // 🔥 Hint en color gris
                    filled: true,
                    fillColor: Colors.black, // 🔥 Fondo negro para el input
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onSubmitted: (_) => _sendMessage(),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.send, color: AppStyle.primaryColor),
                onPressed: _sendMessage,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
