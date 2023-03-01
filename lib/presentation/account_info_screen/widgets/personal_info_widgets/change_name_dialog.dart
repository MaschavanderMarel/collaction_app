import '../../../../application/user/profile/profile_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/username/username_bloc.dart';
import '../../../themes/constants.dart';
import 'package:flutter/material.dart';

class ChangeNameDialog extends StatefulWidget {
  final String firstName;
  final String lastName;
  const ChangeNameDialog(
      {super.key, required this.firstName, required this.lastName});

  @override
  State<ChangeNameDialog> createState() => _ChangeNameDialogState();
}

class _ChangeNameDialogState extends State<ChangeNameDialog> {
  late GlobalKey<FormState> _formKey;
  late GlobalKey<FormFieldState> _firstNameKey;
  late GlobalKey<FormFieldState> _lastNameKey;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _firstNameKey = GlobalKey<FormFieldState>();
    _lastNameKey = GlobalKey<FormFieldState>();
    _firstNameController = TextEditingController(text: widget.firstName);
    _lastNameController = TextEditingController(text: widget.lastName);
  }

  @override
  Widget build(BuildContext context) {
    Future<void> showChangeNameDialog() async {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return StatefulBuilder(
                builder: (BuildContext context, setState) {
                  return SizedBox(
                    width: 302,
                    height: 200,
                    child: AlertDialog(
                      title: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Change name',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    color: kPrimaryColor400,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      content: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: ListBody(
                            children: <Widget>[
                              SizedBox(
                                height: 56,
                                child: TextFormField(
                                  controller: _firstNameController,
                                  key: _firstNameKey,
                                  validator: (value) =>
                                      _validateFirstName(value),
                                  onChanged: (value) {
                                    setState(() {
                                      _firstNameKey.currentState!.validate();
                                      _firstNameKey.currentState!.validate()
                                          ? _isButtonEnabled = true
                                          : _isButtonEnabled = false;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3, color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    fillColor: kPrimaryColor0,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3, color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 4.0, bottom: 6),
                                child: SizedBox(
                                  height: 16,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      "First name",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(
                                            color: kPrimaryColor300,
                                            fontFamily: 'Rubik',
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 56,
                                child: TextFormField(
                                  controller: _lastNameController,
                                  key: _lastNameKey,
                                  validator: (value) =>
                                      _validateLastName(value),
                                  onChanged: (value) {
                                    setState(() {
                                      _lastNameKey.currentState!.validate();
                                      _lastNameKey.currentState!.validate()
                                          ? _isButtonEnabled = true
                                          : _isButtonEnabled = false;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3, color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    fillColor: kPrimaryColor0,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3, color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 4.0,
                                ),
                                child: SizedBox(
                                  height: 16,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      "Last name",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(
                                            color: kPrimaryColor300,
                                            fontFamily: 'Rubik',
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text(
                            'Cancel',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  color: kEnabledButtonColor,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                            onPressed: _isButtonEnabled
                                ? () {
                                    setState(() {
                                      UsernameEvent.updateUsername(
                                          firstName: _firstNameController.text,
                                          lastName: _lastNameController.text);
                                    });
                                  }
                                : null,
                            child: Text(
                              'Save',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: _isButtonEnabled
                                        ? kEnabledButtonColor
                                        : kDisabledButtonColor,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                            ))
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      );
    }

    return TextButton(
        onPressed: () => showChangeNameDialog(),
        child: Text(
          "Change",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: kAccentColor,
                fontFamily: 'Rubik',
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
        ));
  }

  String? _validateFirstName(String? value) {
    if (value == widget.firstName) {
      return "To save you need to make a change";
    }
    return null;
  }

  String? _validateLastName(String? value) {
    if (value == widget.lastName) {
      return "To save you need to make a change";
    }
    return null;
  }
}
