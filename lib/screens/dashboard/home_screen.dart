import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // Placeholder booleans for permissions (to be replaced with actual permissions logic)
  final bool canViewEmployeeManagement = true;
  final bool canViewInventoryManagement = true;
  final bool canViewLogs = true;

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Message with Placeholder for Username
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(
                      0.05), // Semi-transparent background for contrast
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  'Welcome, [Username]', // Placeholder for username
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    int crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
                    return GridView.count(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      children: [
                        if (canViewEmployeeManagement)
                          _buildMenuOption(
                            context,
                            icon: Icons.people,
                            title: 'Employee Management',
                            onTap: () {
                              // Placeholder action
                            },
                          ),
                        if (canViewInventoryManagement)
                          _buildMenuOption(
                            context,
                            icon: Icons.inventory,
                            title: 'Inventory Management',
                            onTap: () {
                              // Placeholder action
                            },
                          ),
                        if (canViewLogs)
                          _buildMenuOption(
                            context,
                            icon: Icons.history,
                            title: 'Logs',
                            onTap: () {
                              // Placeholder action
                            },
                          ),
                        _buildMenuOption(
                          context,
                          icon: Icons.settings,
                          title: 'Settings',
                          onTap: () {
                            Navigator.pushNamed(context, '/settings');
                          },
                        ),
                        _buildMenuOption(
                          context,
                          icon: Icons.support_agent,
                          title: 'Customer Support',
                          onTap: () {
                            // Placeholder action
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuOption(BuildContext context,
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 78, 71, 71).withOpacity(0.8),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
