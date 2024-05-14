import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mor_flutter_project/resources/barrel_const.dart';
import 'package:mor_flutter_project/configs/size_config.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) : _scaffoldKey = scaffoldKey;

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
      height: kToolbarHeight + 10,
      decoration: BoxDecoration(color: COLOR_CONST.soap, boxShadow: [
        BoxShadow(
            color: COLOR_CONST.black.withOpacity(0.25),
            offset: const Offset(0, 2.8),
            blurRadius: 1.7),
      ]),
      child: Row(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                child: SvgPicture.asset(
                  ICON_CONST.icMenu.path,
                  color: COLOR_CONST.white,
                  height: 24,
                  width: 24,
                ),
              ),
              const SizedBox(width: 10),
              Image.asset(
                IMAGE_CONST.kriso.path,
                height: 15,
                fit: BoxFit.contain,
              ),
            ],
          ),
          Expanded(
            child: Text(
              '양식장 수질 모니터링 시스템',
              style: FONT_CONST.regular(
                color: COLOR_CONST.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.topRight,
                clipBehavior: Clip.none,
                children: [
                  Text(
                    '알람 발생',
                    style: FONT_CONST.regular(color: COLOR_CONST.red),
                  ),
                  Positioned(
                    top: -8,
                    right: -8,
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: COLOR_CONST.red,
                      ),
                    ),
                  )
                ],
              ),
              const HorizontalSpacing(of: 10),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: COLOR_CONST.sunray,
                ),
                child: Text(
                  '히트 펌프 시스템',
                  style: FONT_CONST.regular(color: COLOR_CONST.black),
                ),
              ),
              const HorizontalSpacing(of: 5),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: COLOR_CONST.white,
                  boxShadow: [
                    BoxShadow(
                        color: COLOR_CONST.black.withOpacity(0.25),
                        offset: const Offset(0, 0),
                        blurRadius: 4),
                  ],
                ),
                child: Text(
                  '수질 모니터링 시스템',
                  style: FONT_CONST.regular(color: COLOR_CONST.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
}
