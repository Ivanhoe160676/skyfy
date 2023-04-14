import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:intl/intl.dart';

class Forms extends StatelessWidget {
  const Forms({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CompleteForm extends StatefulWidget {
  const CompleteForm({Key? key}) : super(key: key);

  @override
  State<CompleteForm> createState() {
    return _CompleteFormState();
  }
}

class _CompleteFormState extends State<CompleteForm> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  void _onChanged(dynamic val) => debugPrint(val.toString());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FormBuilder(
          key: _formKey,
          // enabled: false,
          onChanged: () {
            _formKey.currentState!.save();
            debugPrint(_formKey.currentState!.value.toString());
          },
          autovalidateMode: AutovalidateMode.disabled,
          initialValue: const {
            'flight_class': 1,
            'best_language': 'Bronze',
            'class_filter': ['Bronze']
          },
          skipDisabled: true,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 15),
              FormBuilderDateTimePicker(
                name: 'date',
                initialEntryMode: DatePickerEntryMode.calendar,
                initialValue: DateTime.now(),
                inputType: InputType.date,
                decoration: InputDecoration(
                  labelText: 'Appointment Date',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      _formKey.currentState!.fields['date']?.didChange(null);
                    },
                  ),
                ),
                initialTime: const TimeOfDay(hour: 8, minute: 0),
                // locale: const Locale.fromSubtags(languageCode: 'fr'),
              ),
              FormBuilderDateRangePicker(
                name: 'date_range',
                firstDate: DateTime(1970),
                lastDate: DateTime(2030),
                format: DateFormat('yyyy-MM-dd'),
                onChanged: _onChanged,
                decoration: InputDecoration(
                  labelText: 'Date Range',
                  helperText: 'Helper text',
                  hintText: 'Hint text',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      _formKey.currentState!.fields['date_range']
                          ?.didChange(null);
                    },
                  ),
                ),
              ),
              FormBuilderCheckbox(
                name: 'accept_terms',
                initialValue: false,
                onChanged: _onChanged,
                title: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'I have read and agree to the ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Terms and Conditions',
                        style: TextStyle(color: Colors.blue),
                        // Flutter doesn't allow a button inside a button
                        // https://github.com/flutter/flutter/issues/31437#issuecomment-492411086
                        /*
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('launch url');
                                },
                              */
                      ),
                    ],
                  ),
                ),
                validator: FormBuilderValidators.equal(
                  true,
                  errorText: 'You must accept terms and conditions to continue',
                ),
              ),
              FormBuilderSegmentedControl(
                decoration: const InputDecoration(
                  labelText: 'Select Class',
                ),
                name: 'flight_class',
                // initialValue: 1,
                // textStyle: TextStyle(fontWeight: FontWeight.bold),
                options: List.generate(3, (i) => i + 1)
                    .map((number) => FormBuilderFieldOption(
                          value: number,
                          child: Text(
                            number.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ))
                    .toList(),
                onChanged: _onChanged,
              ),
              FormBuilderSwitch(
                title: const Text('I Accept the terms and conditions'),
                name: 'accept_terms_switch',
                initialValue: true,
                onChanged: _onChanged,
              ),
              FormBuilderFilterChip<String>(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(labelText: 'Select Class'),
                name: 'class_filter',
                selectedColor: Colors.red,
                options: const [
                  FormBuilderChipOption(
                    value: 'Bronze',
                    avatar: CircleAvatar(child: Text('B')),
                  ),
                  FormBuilderChipOption(
                    value: 'Silver',
                    avatar: CircleAvatar(child: Text('S')),
                  ),
                  FormBuilderChipOption(
                    value: 'Gold',
                    avatar: CircleAvatar(child: Text('G')),
                  ),
                ],
                onChanged: _onChanged,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.minLength(1),
                  FormBuilderValidators.maxLength(3),
                ]),
              ),
              FormBuilderChoiceChip<String>(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                    labelText: 'Please select your Flight Class'),
                name: 'class_choice',
                initialValue: 'Bronze',
                options: const [
                  FormBuilderChipOption(
                    value: 'Bronze',
                    avatar: CircleAvatar(child: Text('D')),
                  ),
                  FormBuilderChipOption(
                    value: 'Silver',
                    avatar: CircleAvatar(child: Text('K')),
                  ),
                  FormBuilderChipOption(
                    value: 'Gold',
                    avatar: CircleAvatar(child: Text('J')),
                  ),
                ],
                onChanged: _onChanged,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
