import 'package:altfit/model/progam.dart';
import 'package:altfit/utils/widgets/space.dart';
import 'package:flutter/material.dart';


class PlanWidget extends StatelessWidget{
  final BuildContext context;
  final bool mainview;
  final Program program;
  final bool isPortrait;

  const PlanWidget({super.key, required this.context, required this.mainview, required this.program, required this.isPortrait});
  
  @override
  Widget build(BuildContext context) {
     final theme = Theme.of(context);
    return AspectRatio(
      aspectRatio: isPortrait? mainview ?  4 / 5 : 4 / 3 : 16/9,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.lightGreenAccent,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
          image: DecorationImage(
            image: AssetImage(program.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 18, 18, 18),
                Colors.transparent,
                Colors.transparent,
                const Color.fromARGB(255, 8, 8, 8),
              ],
              begin: Alignment.topCenter,
              stops: [0.0, 0.3, 0.6, 1.0],
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage(program.writtenBy.imageUrl),
                    ),
                    Space(width: 10),
                    Expanded(
                      child: SizedBox(
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              program.writtenBy.name,
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              style: theme.textTheme.titleLarge!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              program.writtenBy.expertise,
                              maxLines: 2,
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              style: theme.textTheme.titleSmall!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "\$${program.price}",
                      style: theme.textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                          program.title,
                           maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            style: theme.textTheme.titleMedium!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            program.subtitle,
                             maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            style: theme.textTheme.titleSmall!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            program.mode,
                            style: theme.textTheme.titleSmall!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Space(height: 5),
                      ],
                    ),
                  ],
                ),
              ),
              Space(height: 8),
              Row(
                children: [
                  _buildAttribute(Icons.calendar_month, program.duration),
                  _buildAttribute(Icons.access_time, "2 hrs"),
                  _buildAttribute(Icons.flag, program.level),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  _buildAttribute(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        Space(width: 4),
        Text(
          text,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: Colors.white),
        ),
        Space(width: 16),
      ],
    );
  }
}