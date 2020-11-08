import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/catalog_bloc.dart';
import 'log_bloc_observer.dart';
import 'product_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = LogBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc test',
      home: const TestPage(),
    );
  }
}

class TestPage extends StatelessWidget {
  const TestPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              title: Text('Reusable logic test'),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                // ! This is how it not work, when scrolling - bloc logic is destroying
                // ...List.generate(10, (i) => ProductListBloc(title: 'List $i')).toList(),

                // ! This is how it also not work, when scrolling - bloc logic is destroying
                ...List.generate(
                  10,
                  (i) {
                    return BlocProvider<CatalogBloc>(
                      create: (context) => CatalogBloc()..add(GetProducts(0)),
                      child: BlocBuilder<CatalogBloc, CatalogState>(builder: (context, state) {
                        if (state is CatalogLoaded && state.products.length > 0) {
                          return ProductList(title: 'List $i');
                        }

                        return Container();
                      }),
                    );
                  },
                ).toList(),

                // ! Potencial, but very bad fix in my opinion
                // ...List.generate(10, (i) => KeepAliveProductList(title: 'List $i')).toList(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
