// ignore_for_file: use_build_context_synchronously

import 'package:email_validator/email_validator.dart';
import 'package:emailjs/emailjs.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/generated/l10n.dart';

import 'package:my_portfolio/utils/constants.dart';

class Contact extends StatefulWidget {
  const Contact({
    super.key,
  });
  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final _formKey = GlobalKey<FormState>();
  final _emailControoler = TextEditingController();
  final _messageControoler = TextEditingController();

  @override
  void initState() {
    _emailControoler.addListener(onListen);
    _messageControoler.addListener(onListen);
    super.initState();
  }

  void onListen() => setState(() {});

  Future<void> sendEmail(String email, String message) async {
    Map<String, dynamic> templateParams = {
      'email': email,
      'message': message,
    };
    await EmailJS.send(
      serviceId,
      templateId,
      templateParams,
      Options(
        publicKey: publicKey,
        privateKey: privateKey,
      ),
    );
  }

  @override
  void dispose() {
    _emailControoler.removeListener(onListen);
    _messageControoler.removeListener(onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            S.of(context).contactTitle,
            style: const TextStyle(fontSize: 40),
          ),
          height4,
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: size.width < 700 ? 16 : 48,
            ),
            decoration: const BoxDecoration(
              color: black,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            width: size.width < 500 ? size.width * 0.9 : size.width * 0.5,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  height4,
                  SizedBox(
                    width: 400,
                    child: TextFormField(
                      style: const TextStyle(
                        fontSize: 18,
                        color: white,
                      ),
                      controller: _emailControoler,
                      decoration: InputDecoration(
                        label: const Text(
                          'Email',
                        ),
                        prefixIcon: const Icon(
                          Icons.mail,
                          color: white,
                        ),
                        suffixIcon: _emailControoler.text.isEmpty
                            ? null
                            : IconButton(
                                onPressed: () => _emailControoler.clear(),
                                icon: const Icon(
                                  Icons.close,
                                  color: white,
                                ),
                              ),
                      ),
                      validator: (val) =>
                          val != null && !EmailValidator.validate(val)
                              ? S.current.contactValid
                              : null,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  height2,
                  SizedBox(
                    height: 150,
                    width: 400,
                    child: TextFormField(
                      controller: _messageControoler,
                      style: const TextStyle(
                        fontSize: 18,
                        color: white,
                      ),
                      textAlignVertical: TextAlignVertical.top,
                      maxLength: 200,
                      minLines: null,
                      maxLines: null,
                      expands: true,
                      decoration: InputDecoration(
                        label: Text(
                          S.of(context).sms,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: white,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.message,
                          color: white,
                        ),
                        suffixIcon: _messageControoler.text.isEmpty
                            ? null
                            : IconButton(
                                onPressed: () => _messageControoler.clear(),
                                icon: const Icon(
                                  Icons.close,
                                  color: white,
                                ),
                              ),
                        hintStyle: const TextStyle(color: white),
                      ),
                      validator: (val) =>
                          val == null || val.isEmpty ? '' : null,
                    ),
                  ),
                  height1,
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await sendEmail(
                          _emailControoler.text,
                          _messageControoler.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          behavior: SnackBarBehavior.floating,
                          width: 200,
                          elevation: 20,
                          shape: const StadiumBorder(),
                          content: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  S.current.sentMessage,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Icon(
                                  Icons.check,
                                ),
                              ]),
                          backgroundColor: green,
                        ));
                        _emailControoler.clear();
                        _messageControoler.clear();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              S.of(context).contactValid,
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: white,
                    ),
                    child: Text(
                      S.of(context).sendMessage,
                      style: const TextStyle(
                        color: black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  height4,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
