enum Sender { me, other }

class Message {
  final String message;
  final Sender sender;
  final String? imageUrl;

  Message({required this.message, required this.sender, this.imageUrl});
}
