import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
	const ResetPasswordScreen({super.key});
	@override
	_ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
	final _formKey = GlobalKey<FormState>();

	@override
		Widget build(BuildContext context) {
			return Scaffold(
					body: Padding(
						padding: EdgeInsets.symmetric(horizontal: 16.0),
						child: Form(
							key: _formKey,
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
									child: TextFormField(
										obscureText: false,
										decoration: InputDecoration(
											labelText: 'Email',
										),
										validator: (String? value) {
											if (value == null || value.isEmpty) {
												return "Email cannot be empty!";
											}
											if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
												return "Invalid email!";
											}
											return null;
										},
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
												onPressed: () {
													final isValid = _formKey.currentState?.validate();
													if (isValid == true) {
														showDialog(
																context: context,
																builder: (BuildContext ctx) {
																return const AlertDialog(
																		title: Text('Message'),
																		content: Text("Need to implement"),
																		);
																},
																);
														}
												},
child: const Text("Reset"),
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
							),
							);
		}
}
