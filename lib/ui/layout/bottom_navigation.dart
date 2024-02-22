import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigation extends StatefulWidget {
  // child는 StatefulNavigationShell 객체를 참조.
  final StatefulNavigationShell child;

  const BottomNavigation({
    super.key,
    required this.child,
  });

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: widget.child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.amber,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: widget.child.currentIndex,
        onTap: (index) {
          widget.child.goBranch(
            index,
            initialLocation: index == widget.child.currentIndex,
          );

          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'OTT'),
          BottomNavigationBarItem(icon: Icon(Icons.access_time_filled), label: '신규'),
          BottomNavigationBarItem(icon: Icon(Icons.movie_filter), label: '장르'),
        ],
      ),
    );
  }
}
