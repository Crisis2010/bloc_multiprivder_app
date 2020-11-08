part of 'catalog_bloc.dart';

abstract class CatalogState extends Equatable {
  const CatalogState();
}

class CatalogInitialState extends CatalogState {
  @override
  List<Object> get props => [];
}

class CatalogLoaded extends CatalogState {
  final List products;

  CatalogLoaded({@required this.products});

  @override
  List<Object> get props => [products];

  @override
  String toString() => 'CatalogLoaded { products: $products }';
}
