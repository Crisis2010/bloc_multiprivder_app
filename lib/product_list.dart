import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/catalog_bloc.dart';

class ProductList extends StatelessWidget {
  ProductList({
    Key key,
    @required this.title,
  })  : assert(title != null),
        super(key: key);

  final String title;

  Widget build(BuildContext context) {
    return BlocProvider<CatalogBloc>(
      create: (context) => CatalogBloc()..add(GetProducts(0)),
      child: BlocBuilder<CatalogBloc, CatalogState>(
        builder: (context, state) {
          if (state is CatalogLoaded && state.products.length > 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 27.0),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 230,
                    maxHeight: 245,
                  ),
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 20, 8, 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.products.length,
                    itemBuilder: (context, int i) {
                      return Container(
                        height: 200,
                        width: 150,
                        child: Center(
                          child: Text(
                            'test',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}

class ProductListBloc extends StatelessWidget {
  ProductListBloc({
    Key key,
    @required this.title,
  })  : assert(title != null),
        super(key: key);

  final String title;

  Widget build(BuildContext context) {
    return BlocProvider<CatalogBloc>(
      create: (context) => CatalogBloc()..add(GetProducts(0)),
      child: BlocBuilder<CatalogBloc, CatalogState>(
        builder: (context, state) {
          if (state is CatalogLoaded && state.products.length > 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 27.0),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 230,
                    maxHeight: 245,
                  ),
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 20, 8, 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.products.length,
                    itemBuilder: (context, int i) {
                      return Container(
                        height: 200,
                        width: 150,
                        child: Center(
                          child: Text(
                            'test',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}

class KeepAliveProductListBloc extends StatefulWidget {
  KeepAliveProductListBloc({
    Key key,
    @required this.title,
  })  : assert(title != null),
        super(key: key);

  final String title;

  @override
  _KeepAliveProductListBlocState createState() => _KeepAliveProductListBlocState();
}

class _KeepAliveProductListBlocState extends State<KeepAliveProductListBloc> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocProvider<CatalogBloc>(
      create: (context) => CatalogBloc()..add(GetProducts(0)),
      child: BlocBuilder<CatalogBloc, CatalogState>(
        builder: (context, state) {
          if (state is CatalogLoaded && state.products.length > 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text(
                    widget.title,
                    style: TextStyle(fontSize: 27.0),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 230,
                    maxHeight: 245,
                  ),
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 20, 8, 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.products.length,
                    itemBuilder: (context, int i) {
                      return Container(
                        height: 200,
                        width: 150,
                        child: Center(
                          child: Text(
                            'test',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}
