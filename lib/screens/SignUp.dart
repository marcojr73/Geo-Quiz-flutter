import 'package:flutter/material.dart';
import 'package:geo_quiz_mobile/components/signInUp/Header.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  void submit(){
    print("submit");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
              children: [
          const Header(),
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            color: Theme.of(context).colorScheme.secondary,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 50
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: "name"),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 50
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: "email"),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 50
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: "password"),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 50
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: "confirm password"),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(height: 25,),
                SizedBox(
                  width: 310,
                  child: ElevatedButton(
                    onPressed: null,
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Theme.of(context).colorScheme.primary),
                    ),
                    child: const Text(
                      'Create',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22
                      ),
                    ),
                            ),
                ),
              ],
            ),
          )
              ],
            ),
        ));
  }
}
