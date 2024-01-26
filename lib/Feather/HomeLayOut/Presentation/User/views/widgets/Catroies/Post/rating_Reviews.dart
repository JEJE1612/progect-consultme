import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/User/views/widgets/Catroies/Post/list_view_reatingScreen.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/mangment/my_bloc.dart';
import 'package:flutter_application_1/Feather/Login/presentaion/Widgets/custom_text_form.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingReviews extends StatelessWidget {
  const RatingReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Text(
              "RatingReviews",
              style: Styles.textStyle20,
            ),
            const SizedBox(
              height: 10,
            ),
            const ListViewreatingScreen(),
          ]),
        ),
      ),
      floatingActionButton:
          BlocProvider.of<MyBloc>(context).usermodel!.type == "consult"
              ? null
              : const AddRatingButton(),
    );
  }
}

class AddRatingButton extends StatefulWidget {
  const AddRatingButton({super.key});

  @override
  State<AddRatingButton> createState() => _AddRatingButtonState();
}

class _AddRatingButtonState extends State<AddRatingButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: Colors.white,
          isScrollControlled: true,
          useSafeArea: true,
          context: context,
          builder: (context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const RatingView(),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}

class RatingView extends StatelessWidget {
  const RatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 32),
        Form(
          key: BlocProvider.of<MyBloc>(context).ratingKey,
          child: CustomTextForm(
            hinttext: "Describe your rating ",
            mycontroller: BlocProvider.of<MyBloc>(context).ratingController,
            keyboardType: TextInputType.multiline,
            obscureText: false,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Field cannot be empty';
              } else {
                return null;
              }
            },
            textAlign: TextAlign.center,
            minlines: 4,
            maxlines: 8,
          ),
        ),
        const SizedBox(height: 16),
        const RatingBarView(),
        const SizedBox(height: 16),
        CreateRatingButton(
          onPressed: () {
            if (BlocProvider.of<MyBloc>(context)
                .ratingKey
                .currentState!
                .validate()) {
              debugPrint("rating create");
              Navigator.pop(context);
            }
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class CreateRatingButton extends StatelessWidget {
  const CreateRatingButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.grey,
      child: const Text(
        "Create",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}

class RatingBarView extends StatelessWidget {
  const RatingBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, x) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        debugPrint(rating.toString());
      },
    );
  }
}
