import 'package:auto_route/auto_route.dart';
import 'package:easy_vat_v2/app/core/localization/app_strings.dart';
import 'package:easy_vat_v2/app/core/extensions/extensions.dart';
import 'package:easy_vat_v2/app/features/widgets/svg_icon.dart';
import 'package:easy_vat_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class HomeFabButton extends StatelessWidget {
  const HomeFabButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: AutoTabsRouter.of(context).activeIndex == 2
              ? LinearGradient(
                  colors: [context.secondaryColor, Color(0xFF27165D)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : null,
          color: Color(0xFF9692A6)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgIcon(icon: Assets.icons.homeSelected),
          const SizedBox(height: 3),
          const Text(
            AppStrings.home,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
