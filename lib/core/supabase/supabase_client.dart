import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:studio_hub/core/supabase/supabase_config.dart';

class AppSupabase {
  static bool _ready = false;

  static SupabaseClient get client => Supabase.instance.client;

  static bool get isReady => _ready;

  static Future<void> init() async {
    if (!SupabaseConfig.isConfigured) {
      _ready = false;
      return;
    }
    await Supabase.initialize(
      url: SupabaseConfig.url,
      anonKey: SupabaseConfig.anonKey,
    );
    _ready = true;
  }
}
