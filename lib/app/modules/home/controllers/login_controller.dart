import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var username = ''.obs;  // Menyimpan username
  var password = ''.obs;  // Menyimpan password
  var showLogo = true.obs; // State untuk menampilkan atau menyembunyikan logo

  // Fungsi untuk login
  void login() {
    if (username.value.isNotEmpty && password.value.isNotEmpty) {
      isLoading.value = true;
      showLogo.value = false; // Sembunyikan logo saat loading dimulai

      // Simulasi login (misal dengan delay)
      Future.delayed(Duration(seconds: 2), () {
        isLoading.value = false;

        // Simulasi login berhasil
        Get.snackbar("Success", "Login successful!",
          snackPosition: SnackPosition.BOTTOM);
        
        // Navigasi ke halaman MedicineView
        Get.offNamed('/medicine'); // Pindah ke halaman medicine setelah login
      });
    } else {
      Get.snackbar("Error", "Please fill all fields",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
