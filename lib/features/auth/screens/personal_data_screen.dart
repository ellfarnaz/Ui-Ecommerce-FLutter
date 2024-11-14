import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../widgets/auth_button.dart';
import '../widgets/custom_text_field.dart';
import '../../../core/utils/page_transition.dart';
import '../../../features/main/screens/main_screen.dart';

class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({super.key});

  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  String? selectedGender;
  TextEditingController dateController = TextEditingController();

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Data pribadi',
          style: AppTextStyles.heading(context),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama Lengkap Label
                Text(
                  'Nama Lengkap',
                  style: AppTextStyles.body(context).copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                // Nama Lengkap Input
                const CustomTextField(
                  hintText: 'Masukkan nama lengkap anda',
                  prefixIcon: Icons.person_outline,
                ),
                SizedBox(height: 20.h),

                // Jenis Kelamin Label
                Text(
                  'Jenis kelamin',
                  style: AppTextStyles.body(context).copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                // Jenis Kelamin Dropdown
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  decoration: BoxDecoration(
                    color: AppColors.inputBackground,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedGender,
                      hint: Text(
                        'Jenis kelamin',
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 14.sp,
                        ),
                      ),
                      items: ['Laki-laki', 'Perempuan']
                          .map((String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: AppTextStyles.body(context),
                                ),
                              ))
                          .toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedGender = newValue;
                        });
                      },
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                // Tanggal Lahir Label
                Text(
                  'Tanggal lahir',
                  style: AppTextStyles.body(context).copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                // Tanggal Lahir Input
                TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.inputBackground,
                    hintText: 'dd/mm/yyyy',
                    hintStyle: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 14.sp,
                    ),
                    suffixIcon:
                        const Icon(Icons.calendar_today, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: AppTextStyles.body(context),
                  readOnly: true,
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) {
                      setState(() {
                        dateController.text =
                            "${picked.day.toString().padLeft(2, '0')}/"
                            "${picked.month.toString().padLeft(2, '0')}/"
                            "${picked.year}";
                      });
                    }
                  },
                ),
                SizedBox(height: 20.h),

                // Nomor HP Label
                Text(
                  'Nomor Hp',
                  style: AppTextStyles.body(context).copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                // Nomor HP Input
                CustomTextField(
                  hintText: '+62',
                  prefixIcon: Icons.phone_outlined,
                  controller: TextEditingController(),
                ),
                SizedBox(height: 40.h),

                // Registrasi Button
                AuthButton(
                  text: 'Registrasi',
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      SlidePageRoute(
                        page: const MainScreen(),
                        direction: AxisDirection.left,
                      ),
                      (route) => false,
                    );
                  },
                ),
                SizedBox(height: 20.h), // Tambahan padding di bawah
              ],
            ),
          ),
        ),
      ),
    );
  }
}
