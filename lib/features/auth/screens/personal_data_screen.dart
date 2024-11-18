import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../widgets/auth_button.dart';
import '../widgets/custom_text_field.dart';
import '../../../core/utils/page_transition.dart';
import '../../../features/main/screens/main_screen.dart';
import 'package:flutter/cupertino.dart';

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
        title: Text(
          'Data pribadi',
          style: AppTextStyles.heading(context),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
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
                  decoration: BoxDecoration(
                    color: AppColors.inputBackground,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15.r),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20.r),
                            ),
                          ),
                          builder: (BuildContext context) {
                            return Container(
                              height: 200.h,
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Column(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 15.h),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey.shade300,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Pilih Jenis Kelamin',
                                          style: AppTextStyles.body(context)
                                              .copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () => Navigator.pop(context),
                                          child: Text(
                                            'Selesai',
                                            style: AppTextStyles.body(context)
                                                .copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView(
                                      children: ['Laki-laki', 'Perempuan']
                                          .map((String value) {
                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedGender = value;
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 15.h,
                                              horizontal: 10.w,
                                            ),
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Colors.grey.shade200,
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  value,
                                                  style: AppTextStyles.body(
                                                      context),
                                                ),
                                                if (selectedGender == value)
                                                  Icon(
                                                    Icons.check,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedGender ?? 'Jenis kelamin',
                              style: selectedGender == null
                                  ? GoogleFonts.poppins(
                                      color: Colors.grey,
                                      fontSize: 14.sp,
                                    )
                                  : AppTextStyles.body(context),
                            ),
                            const Icon(Icons.keyboard_arrow_down,
                                color: Colors.grey),
                          ],
                        ),
                      ),
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
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20.r),
                        ),
                      ),
                      builder: (BuildContext context) {
                        return Container(
                          height: 300.h,
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 15.h),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Pilih Tanggal',
                                      style:
                                          AppTextStyles.body(context).copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: Text(
                                        'Selesai',
                                        style: AppTextStyles.body(context)
                                            .copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.date,
                                  initialDateTime: DateTime.now(),
                                  maximumDate: DateTime.now(),
                                  minimumYear: 1900,
                                  maximumYear: DateTime.now().year,
                                  onDateTimeChanged: (DateTime newDate) {
                                    setState(() {
                                      dateController.text =
                                          "${newDate.day.toString().padLeft(2, '0')}/"
                                          "${newDate.month.toString().padLeft(2, '0')}/"
                                          "${newDate.year}";
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
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
