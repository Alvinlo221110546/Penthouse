import 'package:flutter/material.dart';
import 'package:flutter_application_9/pages/supervisor.dart/Check_in.dart';
import 'package:flutter_application_9/pages/supervisor.dart/Check_out.dart';

class InsightPage extends StatelessWidget {
  const InsightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insight'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 4,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildInsightCard(
              title: "Check In",
              value: "24",
              icon: Icons.login,
              color: Colors.green,
              onPressed: () {
                _navigateToPage(context, const CheckInPage());
              },
            ),
            const SizedBox(height: 20), 
            _buildInsightCard(
              title: "Check Out",
              value: "35",
              icon: Icons.logout,
              color: Colors.redAccent,
              onPressed: () {
                _navigateToPage(context, const CheckOutPage());
              },
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuat kartu insight
  Widget _buildInsightCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed, // Aksi saat kartu ditekan
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 3,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: color.withOpacity(0.1),
            child: Icon(icon, color: color),
          ),
          title: Text(title),
          subtitle: Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  // Fungsi navigasi dengan animasi transisi dari atas
  void _navigateToPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, -1.0); // Animasi masuk dari atas
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }
}