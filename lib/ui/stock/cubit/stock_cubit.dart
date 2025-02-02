import 'package:bloc/bloc.dart';
import 'package:sanu/ui/stock/cubit/stock_state.dart';

class StockCubit extends Cubit<StockState> {
  StockCubit() : super(const StockState());
}
