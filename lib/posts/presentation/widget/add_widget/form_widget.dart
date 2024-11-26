import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_2024/posts/presentation/logic/add_delete_update_post/add_delete_update_bloc.dart';
import 'package:post_2024/posts/presentation/widget/add_widget/text_form_widget.dart';

import '../../../domain/entity/post_entity.dart';
import '../../logic/add_delete_update_post/add_delete_update_event.dart';
import 'btn_widget.dart';

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
                  if(widget.postEntity==null){
                    BlocProvider.of<AddDeleteUpdatePost>(context)
                        .add(AddEvent(post: post));
                  }else{
                    BlocProvider.of<AddDeleteUpdatePost>(context)
                        .add(UpdateEvent(post: post));
                  }
                  }
                },
                child: BtnWidget(postEntity:widget.postEntity ,),
              )
            ],
          ),
        ),
      ),
    );
  }
}