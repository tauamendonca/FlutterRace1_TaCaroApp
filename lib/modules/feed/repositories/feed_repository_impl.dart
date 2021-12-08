import 'package:tacaro/modules/feed/repositories/feed_repository.dart';
import 'package:tacaro/shared/models/order_model.dart';
import 'package:tacaro/shared/services/app_database.dart';

class FeedRepositoryImpl implements IFeedRepository {
  final AppDatabase database;
  FeedRepositoryImpl({
    required this.database,
  });
  @override
  Future<List<OrderModel>> getAll() async {
    final response = await database.getAll("orders");
    return response.map((e) => OrderModel.fromMap(e)).toList();
  }
}
