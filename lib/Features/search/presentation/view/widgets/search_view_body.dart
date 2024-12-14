import 'package:bookly_app_clean/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'custom_search_text-form_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          CustomSearchTextFiled(),
          SizedBox(height: 16,),
          Text("Search Result", style: Styles.textStyle20,),
          SizedBox(height: 16,),
          Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder:(context, index)
        {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            // child: BookListViewItem(),
            child: Text("data"),
          );
        }
    );;
  }
}
