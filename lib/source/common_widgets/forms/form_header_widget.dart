import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget(
      {Key? key,
      required this.heading,
      required this.title,
      required this.subtitle})
      : super(key: key);

  final String heading, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading.toUpperCase(),
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(
          height: 10,
        ),
        //Image(image: const AssetImage(tFrontImage),height:size.height*0.2,),
        Text(
          title,
          style: Theme.of(context).textTheme.headline5,
        ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
