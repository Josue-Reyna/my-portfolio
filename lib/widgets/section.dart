import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/constants.dart';

class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.title,
    required this.description,
    required this.content,
    required this.isFirst,
  });

  final String title;
  final String description;
  final Widget content;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          width: size.width < 1050 ? size.width : size.width * 0.75,
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 40),
              ),
              height4,
              Flex(
                direction: size.width < 1050 ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (isFirst)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 24,
                      ),
                      child: SizedBox(
                        width: 300,
                        child: Text(
                          description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  if (isFirst) height2,
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: black,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    width: 400,
                    child: content,
                  ),
                  if (!isFirst) height2,
                  if (!isFirst)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 24,
                      ),
                      child: SizedBox(
                        width: 300,
                        child: Text(
                          description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
        height9
      ],
    );
  }
}
