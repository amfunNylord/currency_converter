// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'converter_bloc.dart';

class ConverterState {}

class ConverterInitial extends ConverterState {}

class CurrencyListLoading extends ConverterState {}

class CurrencyListLoaded extends ConverterState {
  final List<Currency> currencyList;

  CurrencyListLoaded({
    required this.currencyList,
  });
}

class CurrencyListLoadingFailure extends ConverterState {
  final Object? exception;

  CurrencyListLoadingFailure({
    this.exception,
  });
}
