import 'package:flutter/material.dart';
import 'package:flutter_sandbox/authentication_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const SUPABASE_URL = 'https://yyydjvlgkaqstvsjfblv.supabase.co';
const SUPABASE_ANNON_KEY =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inl5eWRqdmxna2Fxc3R2c2pmYmx2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzExMTk2OTUsImV4cCI6MTk4NjY5NTY5NX0.10TAWOHJ4LsSoKeLjuJoQdg_gWSdumLrQQTL1SDwRRE';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: SUPABASE_URL,
    anonKey: SUPABASE_ANNON_KEY,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthenticationPage(),
    );
  }
}
