import 'package:flutter/material.dart';

class ChannelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Channels"),
      ),
      // SafeArea prevents content from overlapping with system UI elements (notch, status bar)
      body: SafeArea(
        child: SingleChildScrollView(
          // SingleChildScrollView enables vertical scrolling of the entire content within
          padding: EdgeInsets.all(16.0), // Adds padding around the entire content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top section with a Row containing an avatar and text info
              Row(
                children: [
                  // GestureDetector for handling tap on the profile picture
                  GestureDetector(
                    onTap: () {
                      print("Profile picture tapped");
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/bbc.jpg'), // Profile image
                      radius: 30, // Size of the avatar
                    ),
                  ),
                  SizedBox(width: 10), // Space between avatar and text
                  // Column containing channel name and description
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "BBC News",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "A channel for Fake News",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 20), // Spacing before the divider
              Divider(), // Horizontal divider for visual separation

              // Row with icons and text to represent actions (Chat, Share, Info)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Space out evenly across row
                children: [
                  // GestureDetector to handle tap action for Chat icon
                  GestureDetector(
                    onTap: () => print("Tapping Chat"),
                    child: Column(
                      children: [
                        Icon(Icons.chat, color: Colors.blue), // Chat icon with blue color
                        SizedBox(height: 8), // Spacing between icon and text
                        Text("Chat", style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                  ),
                  // GestureDetector with onLongPress action for Share icon
                  GestureDetector(
                    onLongPress: () => print("Long press on Share"),
                    child: Column(
                      children: [
                        Icon(Icons.share, color: Colors.green), // Share icon with green color
                        SizedBox(height: 8),
                        Text("Share", style: TextStyle(color: Colors.green)),
                      ],
                    ),
                  ),
                  // GestureDetector with onDoubleTap action for Info icon
                  GestureDetector(
                    onDoubleTap: () => print("Double tap on Info"),
                    child: Column(
                      children: [
                        Icon(Icons.info, color: Colors.red), // Info icon with red color
                        SizedBox(height: 8),
                        Text("Info", style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20), // Spacing before the next section
              Divider(),

              // Wrap widget displays tags as chips; wraps content if space is limited
              Text(
                "Trending Topics",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10), // Space before the chips
              Wrap(
                spacing: 10, // Horizontal space between chips
                children: [
                  // Each chip is wrapped in GestureDetector to handle tap events
                  GestureDetector(
                    onTap: () => print("Tap on Chip 1"),
                    child: Chip(
                      label: Text("Politics"),
                      backgroundColor: Colors.blue[100], // Light blue background for chip
                    ),
                  ),
                  GestureDetector(
                    onTap: () => print("Tap on Chip 2"),
                    child: Chip(
                      label: Text("Sports"),
                      backgroundColor: Colors.red[100], // Light red background for chip
                    ),
                  ),
                  GestureDetector(
                    onTap: () => print("Tap on Chip 3"),
                    child: Chip(
                      label: Text("Technology"),
                      backgroundColor: Colors.green[100], // Light green background for chip
                    ),
                  ),
                  GestureDetector(
                    onTap: () => print("Tap on Chip 4"),
                    child: Chip(
                      label: Text("Entertainment"),
                      backgroundColor: Colors.purple[100], // Light purple background for chip
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20), // Spacing before the next section
              Divider(),

              // Section for displaying a list of articles using vertical list layout
              Text(
                "Articles",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10), // Space before the list of articles
              Column(
                children: List.generate(5, (index) {
                  // Each article is wrapped in GestureDetector to handle tap on the item
                  return GestureDetector(
                    onTap: () => print("Tap on Article $index"),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0), // Space between list items
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/htv.jpg'), // Article thumbnail image
                            radius: 25, // Size of the avatar
                          ),
                          SizedBox(width: 10), // Space between avatar and article text
                          // Expanded widget allows text to take up remaining space in the row
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                              children: [
                                Text(
                                  "Article ${index + 1}", // Article title
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "An interesting article about topic ${index + 1}", // Article subtitle
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios, size: 16), // Small arrow icon for navigation
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
