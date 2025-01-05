import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String doctorName; // Doctor's name passed from message.dart

  ChatScreen({required this.doctorName});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // Initial chat messages
  List<Map<String, String>> messages = [];

  TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Adding initial messages dynamically based on the doctor's name
    messages = [
      {'sender': 'You', 'message': 'Hi, Dr. ${widget.doctorName}!', 'time': '10:00 AM'},
      {'sender': '${widget.doctorName}', 'message': 'Hello! How can I assist you?', 'time': '10:01 AM'},
    ];
  }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        // Add the user's message
        messages.add({
          'sender': 'You',
          'message': _messageController.text,
          'time': TimeOfDay.now().format(context),
        });

        // Simulating a response from the doctor
        messages.add({
          'sender': 'Dr. ${widget.doctorName}',
          'message': 'I received your message. Let me get back to you shortly.',
          'time': TimeOfDay.now().format(context),
        });

        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat with Dr. ${widget.doctorName}',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                var message = messages[messages.length - 1 - index];
                bool isSender = message['sender'] == 'You';

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Align(
                    alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSender ? Colors.deepPurple : Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            message['sender']!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isSender ? Colors.white : Colors.black,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            message['message']!,
                            style: TextStyle(
                              color: isSender ? Colors.white : Colors.black,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            message['time']!,
                            style: TextStyle(
                              fontSize: 10,
                              color: isSender ? Colors.white70 : Colors.black54,
                            ),
                          ),
                        ],
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
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.deepPurple),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
