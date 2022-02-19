import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app1/components/components.dart';
import 'package:news_app1/layout/news_app/cubit/cubit.dart';
import 'package:news_app1/layout/news_app/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'search must not be empty';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('search'),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              Expanded(child: buildListview(list, context, isSearch: true))
            ],
          ),
        );
      },
    );
  }
}
