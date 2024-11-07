import 'package:flutter/material.dart';
import '../../DesignSystem/Components/BottomTabBar/bottom_tab_bar.dart';
import '../../DesignSystem/Components/BottomTabBar/bottom_tab_bar_view_model.dart';
import '../Login/login_router.dart'; // Importa o LoginRouter
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final Map<String, dynamic> userData;

  const ProfilePage({Key? key, required this.userData}) : super(key: key);

  final int currentIndex = 3; // Índice do item "Perfil" na Bottom Navigation

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
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                      'assets/profile_image.png'), // Altere o caminho da imagem conforme necessário
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userData['name'] ?? 'N/A',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      userData['email'] ?? 'N/A',
                      style: const TextStyle(
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
              onTap: () {
                // Ação para editar o nome
              },
            ),
            ListTile(
              title: const Text('Shipping Info'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Ação para informações de envio
              },
            ),
            ListTile(
              title: const Text('Notification'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Ação para notificações
              },
            ),
            ListTile(
              title: const Text('Terms & Condition'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Ação para termos e condições
              },
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
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
        currentIndex: currentIndex,
      ),
    );
  }
}
