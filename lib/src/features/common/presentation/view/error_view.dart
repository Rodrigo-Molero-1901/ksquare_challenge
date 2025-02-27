import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final bool internetError;
  final String? errorMessage;
  final Function() onRetry;

  const ErrorView({
    super.key,
    required this.internetError,
    this.errorMessage,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: onRetry,
        child: Text(
          internetError
              ? 'Sin conexión... Tap aquí para reintentar'
              : errorMessage ??
                  'Parece que hubo un problema al intentar obtener la información... Tap aquí para reintentar',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24.0,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
