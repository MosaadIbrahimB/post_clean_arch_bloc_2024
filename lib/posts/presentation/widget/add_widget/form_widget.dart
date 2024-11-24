import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_2024/posts/presentation/logic/add_delete_update_post/add_delete_update_bloc.dart';
import 'package:post_2024/posts/presentation/widget/add_widget/text_form_widget.dart';

import '../../../domain/entity/post_entity.dart';
import '../../logic/add_delete_update_post/add_delete_update_event.dart';

class FormWidget extends StatefulWidget {
  final PostEntity? postEntity;

  const FormWidget({super.key, this.postEntity});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final keyForm = GlobalKey<FormState>();
  final TextEditingController titleControl = TextEditingController();
  final TextEditingController bodyControl = TextEditingController();

  @override
  void initState() {
    if (widget.postEntity != null) {
      titleControl.text = widget.postEntity!.title;
      bodyControl.text = widget.postEntity!.body;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SingleChildScrollView(
        child: Form(
          key: keyForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .2,
              ),
              TextFormWidget(control: titleControl, name: "title"),
              const SizedBox(height: 25),
              TextFormWidget(
                control: bodyControl,
                name: "body",
                line: true,
              ),
              const SizedBox(height: 25),
              InkWell(
                onTap: () {
                  PostEntity post = PostEntity(
                      title: titleControl.text, body: bodyControl.text);
                  bool valid = keyForm.currentState!.validate();
                  if (valid) {
                    BlocProvider.of<AddDeleteUpdatePost>(context)
                        .add(AddEvent(post: post));
                  }
                },
                child: const BtnWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BtnWidget extends StatelessWidget {
  const BtnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .35),
      color: Colors.blue,
      child: const Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.add,
              color: Colors.white,
            ),
            Text(
              "add",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
