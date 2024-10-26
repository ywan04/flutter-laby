import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
			return Scaffold(
					body: Padding(
						padding: EdgeInsets.symmetric(horizontal: 16.0),
						child: Column(
							mainAxisAlignment: MainAxisAlignment.center,
							crossAxisAlignment: CrossAxisAlignment.start,
							children: <Widget>[
							Center(
								child: Image.network(
									"https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/1024px-Google-flutter-logo.svg.png",
									width: 200,
									),
								),

							const SizedBox(height: 24.0),

							Row(
								children: [
								Expanded(
									child: TextField(
										obscureText: false,
										decoration: InputDecoration(
											border: OutlineInputBorder(),
											labelText: 'Name',
											),
										),
									)
								],
								),

							const SizedBox(height: 16.0),

							Row(
								children: [
								Expanded(
									child: TextField(
										obscureText: false,
										decoration: InputDecoration(
											border: OutlineInputBorder(),
											labelText: 'Email',
											),
										),
									)
								],
								),

							const SizedBox(height: 16.0),

							Row(
								children: [
								Expanded(
									child: TextField(
										obscureText: true,
										decoration: InputDecoration(
											border: OutlineInputBorder(),
											labelText: 'Password',
											),
										),
									)
								],
								),

							const SizedBox(height: 16.0),

							Row(
									children: [
									Expanded(
										child: SizedBox(
											height: 48,
											child: ElevatedButton(
												onPressed: () => {
												showDialog(
														context: context,
														builder: (BuildContext ctx) {
														return const AlertDialog(
																title: Text('Message'),
																content: Text("Need to implement"),
																);
														},
														)
												},
child: const Text("Sign up"),
),
											),
										),

							const SizedBox(width: 16.0),
							],
							),
							const SizedBox(height: 16.0),
							Row(
									children: [
									Expanded(
										child: SizedBox(
											height: 48,
											child: OutlinedButton(
												onPressed: () => {
													Navigator.pop(context)
												},
child: const Text("Back"),
),
											),
										),

							const SizedBox(width: 16.0),
							],
							),
							],
							),
							),
							);
  }

}
