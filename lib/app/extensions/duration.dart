extension DurationExtension on Duration {
  String getMinutes() {
    return (inMinutes % 60).toString().padLeft(2, '0');
  }

  String getSeconds() {
    return (inSeconds % 60).toString().padLeft(2, '0');
  }

  String getHundreds() {
    return ((inMilliseconds / 10) % 100).toStringAsFixed(0).padLeft(2, '0');
  }

  String toStringDuration() {
    return '${getMinutes()}:${getSeconds()}:${getHundreds()}';
  }
}
