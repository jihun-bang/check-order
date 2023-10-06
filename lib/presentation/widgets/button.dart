import 'package:flutter/material.dart';

class CheckOrderButton extends StatefulWidget {
  final String label;
  final Widget? child;
  final double width;
  final double height;
  final Color? color;
  final bool enable;
  final VoidCallback onTap;

  const CheckOrderButton({
    super.key,
    required this.label,
    this.child,
    this.width = 248,
    this.height = 58,
    this.enable = true,
    this.color,
    required this.onTap,
  });

  @override
  State<CheckOrderButton> createState() => _CheckOrderButtonState();
}

class _CheckOrderButtonState extends State<CheckOrderButton> {
  bool _isLoading = false;

  Future<void> _handlePress() async {
    if (_isLoading || !widget.enable) {
      return;
    }

    setState(() {
      _isLoading = true;
    });
    await Future.sync(widget.onTap);
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.enable ? () async => await _handlePress() : null,
      style: ElevatedButton.styleFrom(
          elevation: 0,
          fixedSize: Size(widget.width, widget.height),
          backgroundColor: widget.color),
      child: Center(
        child: _isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : widget.child ??
                Text(
                  widget.label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
      ),
    );
  }
}
