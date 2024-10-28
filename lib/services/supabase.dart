import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService extends GetxService {
  late SupabaseClient supabaseClient;

  Future<SupabaseService> init() async {
    String url = dotenv.get("SUPABASE_URL");
    String key = dotenv.get("SUPABASE_KEY");

    await Supabase.initialize(
      url: url,
      anonKey: key,
    );

    supabaseClient = Supabase.instance.client;

    return this;
  }

  // Uploads an image to Supabase Storage
  Future<String?> uploadImage(
    File imageFile,
    String bucket,
    String path,
  ) async {
    try {
      // Read image file as bytes
      final bytes = await imageFile.readAsBytes();

      // Upload the image to the specified bucket and path
      await supabaseClient.storage.from(bucket).uploadBinary(
            path,
            bytes,
            fileOptions: const FileOptions(contentType: 'image/jpeg'),
          );

      // Return the public URL of the uploaded image
      final publicUrl = supabaseClient.storage.from(bucket).getPublicUrl(path);
      return publicUrl;
    } catch (e) {
      rethrow;
    }
  }
}
