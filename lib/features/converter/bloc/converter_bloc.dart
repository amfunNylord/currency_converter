import 'package:currency_converter/repositories/currency_list/currency_list_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/currency_list/models/currency.dart';

part 'converter_event.dart';
part 'converter_state.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  ConverterBloc(this.currencyRepository) : super(ConverterInitial()) {
    on<LoadCurrencyList>((event, emit) async {
      try {
        emit(ConverterInitial());
        final currencyList = await currencyRepository.getCurrencyList();
        emit(CurrencyListLoaded(currencyList: currencyList));
      } on Exception catch (e) {
        emit(CurrencyListLoadingFailure(exception: e));
      }
    });
  }

  final CurrencyListRepository currencyRepository;
}
