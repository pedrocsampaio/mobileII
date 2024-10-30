import 'package:flutter/material.dart';
import '../../DesignSystem/Components/BottomTabBar/bottom_tab_bar.dart';
import '../../DesignSystem/Components/BottomTabBar/bottom_tab_bar_view_model.dart';
import '../Login/login_router.dart'; // Importa o LoginRouter

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final int currentIndex = 3; // Perfil é o 4 item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w900,
          fontSize: 38,
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/profile_image.png'),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Amanda Doe',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'amanda@gmail.com',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            ListTile(
              title: const Text('Edit Name'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              title: const Text('Shipping Info'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              title: const Text('Notification'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              title: const Text('Terms & Condition'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                LoginRouter.goToLoginPage(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomTabBar.instantiate(
        viewModel: BottomTabBarViewModel(
          bottomTabs: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box),
              label: 'label',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box),
              label: 'label',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box),
              label: 'label',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box),
              label: 'label',
            ),
          ],
        ),
        currentIndex: currentIndex,
      ),
    );
  }
}
