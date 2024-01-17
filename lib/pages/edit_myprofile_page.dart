import 'package:flutter/material.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';
import 'package:hackfest_mobile/widgets/my_button.dart';
import 'package:hackfest_mobile/widgets/my_textfield_form.dart';
class EditMyProfilePage extends StatelessWidget {
  EditMyProfilePage({super.key});
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile', style: MyTextStyle.judulH5(color: MyColors.blackBase),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28,vertical: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Stack(
                children:[
                  Container(
                    width: 68,
                    height: 68,
                    margin: EdgeInsets.all(5),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle
                    ),
                    child: Image.asset('assets/images/profile_hackfest.png', fit: BoxFit.cover,),
                  ),
                  Positioned(
                    bottom: 2,
                    right: 0,
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyColors.primaryBase
                      ),
                      child: Icon(Icons.camera_alt_outlined, color: MyColors.whiteBase,size: 15,),
                    ),
                  )
                ]
              ),
            ),
            const SizedBox(height: 28,),
            MyTextFieldForm(label: 'Nama Lengkap', hint: 'isi nama baru anda disini', controller: userNameController, icon:  Icons.person_outline),
            const SizedBox(height: 16,),
            MyTextFieldForm(label: 'Email', hint: 'isi email baru anda disini', controller: emailController, icon:  Icons.email_outlined),
            const SizedBox(height: 16,),
            MyTextFieldForm(label: 'No Whatsapp', hint: 'isi whatsapp baru anda disini', controller: phoneNumberController, icon:  Icons.phone),
            const Spacer(),
            SizedBox(
                width: double.infinity,
                child: MyButton(text: 'Simpan', color: MyColors.primaryBase, onPressed: (){}),
            )
          ],
        ),
      ),
    );
  }
}
