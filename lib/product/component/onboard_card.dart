import 'package:flutter/material.dart';
import 'package:shortly_url/core/extensions/context_extension.dart';

class OnBoardCard extends SizedBox {
  final BuildContext context;
  final String title;
  final String content;
  final IconData iconData;

  OnBoardCard({
    super.key,
    required this.context,
    required this.content,
    required this.title,
    required this.iconData,
  }) : super(
          width: context.width * 0.8,
          height: context.height * 0.4,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                children: [
                  SizedBox(height: context.height * 0.03),
                  Container(
                    padding: context.paddingNormal,
                    height: context.height * 0.35,
                    width: context.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: context.height * 0.1),
                        Text(
                          title,
                          style: context.textTheme.headline5
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          content,
                          style: context.textTheme.bodyText1
                              ?.copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              CircleAvatar(radius: context.height * 0.05, child: Icon(iconData))
            ],
          ),
        );
}
