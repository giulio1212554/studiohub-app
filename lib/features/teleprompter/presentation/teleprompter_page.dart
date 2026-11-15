import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:studio_hub/core/theme/app_theme.dart';

class TeleprompterPage extends StatelessWidget {
  const TeleprompterPage({super.key});

  static const String hostedUrl =
      'https://qnxkchecvuszvduktype.supabase.co/storage/v1/object/public/public-assets/teleprompter.html';

  Future<void> _open(BuildContext context) async {
    final uri = Uri.parse(hostedUrl);
    try {
      final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!ok && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Non riesco ad aprire il browser.')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Errore: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(title: const Text('Teleprompter')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.videocam, size: 48, color: AppColors.accent),
              const SizedBox(height: 16),
              const Text('Studio Loom',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: () => _open(context),
                icon: const Icon(Icons.open_in_new),
                label: const Text('Apri Teleprompter'),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  foregroundColor: const Color(0xFF04201C),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
