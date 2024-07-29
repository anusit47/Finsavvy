import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';

class ExpCard extends StatelessWidget {
  const ExpCard({
    super.key,
    required this.image,
    required this.questName,
    required this.type,
    required this.expAmount,
    required this.description,
    required this.press,
  });

  final String image, questName, type, description;
  final double expAmount;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: OutlinedButton(
        onPressed: press,
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(140, 220),
          maximumSize: const Size(140, 220),
          padding: const EdgeInsets.all(8),
        ),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.15,
              child: Stack(
                children: [
                  Center(
                    child: SizedBox(
                      width: 80, // Adjust width as needed
                      height: 80, // Adjust height as needed
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            8.0), // Optional: add radius if needed
                        child: SvgPicture.network(
                          image,
                          placeholderBuilder: (BuildContext context) =>
                              Container(
                            padding: const EdgeInsets.all(30.0),
                            child: const CircularProgressIndicator(),
                          ),
                          fit: BoxFit.cover, // Adjust BoxFit if necessary
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding / 2,
                    vertical: defaultPadding / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      type.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 10),
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    Text(
                      questName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 12),
                    ),
                    const Spacer(),
                    Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 10),
                    ),
                    const Spacer(),
                    Text(
                      "$expAmount EXP",
                      style: const TextStyle(
                        color: Color(0xFF31B0D8),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
