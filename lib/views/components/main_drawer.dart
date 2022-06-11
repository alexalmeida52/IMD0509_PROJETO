import 'package:imd0509_projeto/utils/app_routes.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget _createItem(IconData icon, String label, Function() onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(40),
            color: Theme.of(context).colorScheme.secondary,
            alignment: Alignment.topLeft,
            child: Text(
              'Gerenciar',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ),
          _createItem(
              Icons.home,
              'Inicio',
              () => Navigator.of(context)
                  .pushReplacementNamed(AppRoutes.HOME)),
          _createItem(Icons.account_circle_sharp, 'Profissionais',
              () => Navigator.of(context).pushReplacementNamed(AppRoutes.GERRENCIAR_PROFISSIONAIS)),
          // _createItem(
          //     Icons.edit,
          //     'Gerenciar lugares',
          //     () => Navigator.of(context)
          //         .pushReplacementNamed(AppRoutes.SETTINGS)),
          // _createItem(
          //     Icons.settings,
          //     'Configurações',
          //     () => Navigator.of(context)
          //         .pushReplacementNamed(AppRoutes.SETTINGS)),
          
        ],
      ),
    );
  }
}