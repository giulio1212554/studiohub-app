class SupabaseConfig {
  static const String url = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://qnxkchecvuszvduktype.supabase.co',
  );

  static const String anonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFueGtjaGVjdnVzenZkdWt0eXBlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3OTQ1ODg2NjMsImV4cCI6MjExMDE2NDY2M30.ejOR4ymD0pgICqUzyz6Lav0_pIfZHpVUAmI_v7qWklA',
  );

  static bool get isConfigured =>
      url.contains('supabase.co') &&
      !url.contains('YOUR_PROJECT') &&
      anonKey.length > 20 &&
      !anonKey.contains('YOUR_ANON');
}
