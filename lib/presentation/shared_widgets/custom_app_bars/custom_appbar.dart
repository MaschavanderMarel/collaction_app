import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../core/collaction_icons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool closable;

  const CustomAppBar({
    super.key,
    this.title = "",
    this.closable = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: !closable
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                color: context.background,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () => context.router.pop(),
                  child: Icon(
                    CollactionIcons.left,
                    color: context.kTheme.primaryColor400,
                  ),
                ),
              ),
            )
          : null,
      actions: [
        if (closable)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => context.router.pop(),
              style: ElevatedButton.styleFrom(
                foregroundColor: context.kTheme.primaryColor0,
                backgroundColor: context.background,
                shape: const CircleBorder(),
                tapTargetSize: MaterialTapTargetSize.padded,
              ).merge(
                ButtonStyle(
                  elevation: MaterialStateProperty.resolveWith<double?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return 5;
                      }
                      return 4;
                    },
                  ),
                ),
              ),
              child: Icon(
                CollactionIcons.cross,
                color: context.kTheme.primaryColor300,
              ),
            ),
          ),
      ],
      title: Text(
        title,
        style: TextStyle(color: context.kTheme.primaryColor),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55.0);
}
