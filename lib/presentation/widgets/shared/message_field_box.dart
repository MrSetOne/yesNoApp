import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onSend;

  const MessageFieldBox({Key? key, required this.onSend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final colors = Theme.of(context).colorScheme;

    // final sendMessage = context.watch<ChatProvider>();

    final outlineInputBorder = UnderlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: BorderSide(color: colors.primary));

    final InputDecoration inputDecoration = InputDecoration(
        hintText: 'Escribe tu pregunta',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            final value = textController.value.text;
            onSend(value);
            textController.clear();
          },
        ));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: TextFormField(
        onTapOutside: (event) => focusNode.unfocus(),
        focusNode: focusNode,
        controller: textController,
        decoration: inputDecoration,
        onFieldSubmitted: (value) {
          onSend(value);
          textController.clear();
          focusNode.requestFocus();
        },
      ),
    );
  }
}
