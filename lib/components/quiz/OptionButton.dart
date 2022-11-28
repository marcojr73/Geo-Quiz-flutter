import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String option;
  const OptionButton({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.width * 0.15,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {},
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
          ),
          child: Text(
            option,
            style: const TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
      ),
    );
  }
}
