import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mplus_app/app/auth/presentation/login/pages/signin_page.dart';
import 'package:mplus_app/app/home/presentation/providers/home_change_notifier.dart';
import 'package:provider/provider.dart';

class UserAvatarButton extends StatelessWidget {
  const UserAvatarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          child: TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.settings),
            label: const Text('Settings'),
          ),
        ),
        PopupMenuItem(
          child: TextButton.icon(
            onPressed: () {
              context.read<HomeChangeNotifier>().performSignOut();

              Navigator.of(context).pushAndRemoveUntil(
                  CupertinoPageRoute(builder: (context) => const LoginPage()),
                  (route) => false);
            },
            icon: const Icon(Icons.logout),
            label: const Text('Sign out'),
          ),
        ),
      ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: const CircleAvatar(),
    );
  }
}
