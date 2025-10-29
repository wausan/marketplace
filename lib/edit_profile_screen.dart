import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_service.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // ✅ FIX: Made stateful and functional
  late TextEditingController _nameController;
  late TextEditingController _bioController;

  @override
  void initState() {
    super.initState();
    final userService = Provider.of<UserService>(context, listen: false);
    _nameController = TextEditingController(text: userService.userName);
    _bioController = TextEditingController(text: userService.userBio);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    final userService = Provider.of<UserService>(context, listen: false);
    userService.updateUser(_nameController.text, _bioController.text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        actions: [
          TextButton(
            onPressed: _saveProfile,
            child: const Text("SAVE", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=12"),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.grey[900],
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 20,
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt, color: Colors.black),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          TextFormField(controller: _nameController, decoration: const InputDecoration(labelText: 'Username')),
          const SizedBox(height: 16),
          TextFormField(controller: _bioController, decoration: const InputDecoration(labelText: 'Bio')),
        ],
      ),
    );
  }
}