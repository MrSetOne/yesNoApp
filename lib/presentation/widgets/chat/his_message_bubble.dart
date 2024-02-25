import 'package:flutter/material.dart';
import 'package:yes_no/domain/entities/message.dart';

class HisMessageBubble extends StatelessWidget {
  // final String message;
  final Message message;

  const HisMessageBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              message.message,
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        message.imageUrl != null
            ? _ImageBubble(
                imageUrl: message.imageUrl ?? '',
              )
            : const SizedBox(
                height: 0,
              ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          imageUrl,
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              width: size.width * .7,
              height: 150,
              color: Theme.of(context).colorScheme.secondary,
            );
          },
        ));
  }
}
