import 'package:String/routes/api_routes.dart';
import 'package:String/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  final String id;
  final String name;
  final String image;

  User({required this.id, required this.name, required this.image});
}

class StorageService {
  static const String selectedUsersKey = 'selectedUsers';

  static Future<void> addUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> selectedUsers = prefs.getStringList(selectedUsersKey) ?? [];
    selectedUsers.add(user.id);
    await prefs.setStringList(selectedUsersKey, selectedUsers);
  }

  static Future<List<User>> getSelectedUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? selectedUserIds = prefs.getStringList(selectedUsersKey);
    if (selectedUserIds == null) {
      return [];
    } else {
      // Fetch user details based on the selectedUserIds from an API or other data source
      // and create a list of User objects.
      final List<User> selectedUsers = selectedUserIds.map((userId) {
        // Fetch user details from API based on userId

        return User(
          id: userId,
          name: 'User Name', // Replace with actual user name
          image: 'https://example.com/image.jpg', // Replace with actual user image URL
        );
      }).toList();

      return selectedUsers;
    }
  }
}
