import 'package:ban_sach/model/Sach.dart';
import 'package:ban_sach/pages/admin_page.dart/admin_pageController.dart';
import 'package:ban_sach/widgets/text_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../firebase/controller/sach_controller.dart';
//nhap thong tin sach, sua thong tin sach, xoa sach

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  XFile? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin'),
      ),
      body: Center(
        //màn hình admin. tạo 1 form để nhập thong in sach, sua thong tin sach, xoa sach
        child: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'thêm sách',
                ),
                AppTextField(
                  labelText: 'Tên sách',
                  hintText: 'Nhập Tên sách',
                  controller: Get.find<AdminPageController>().tenSachController,
                ),

                //nxb
                const Text(
                  'Nhà xuất bản',
                ),
                AppTextField(
                  labelText: 'Nhà xuất bản',
                  hintText: 'Nhập Nhà xuất bản',
                  controller: Get.find<AdminPageController>().nxbController,
                ),
                //bia
                const Text(
                  'Bìa',
                ),
                AppTextField(
                  labelText: 'Bìa',
                  hintText: 'Nhập Bìa',
                  controller: Get.find<AdminPageController>().biaController,
                ),
                //tac gia
                const Text(
                  'Tác giả',
                ),
                AppTextField(
                  labelText: 'Tác giả',
                  hintText: 'Nhập Tác giả',
                  controller: Get.find<AdminPageController>().tacGiaController,
                ),
                const Text(
                  'Giá',
                ),
                AppTextField(
                  labelText: 'Giá',
                  hintText: 'Nhập Giá',
                  controller: Get.find<AdminPageController>().giaController,
                ),
                //so luong
                const Text(
                  'Số lượng',
                ),
                AppTextField(
                  labelText: 'Số lượng',
                  hintText: 'Nhập Số lượng',
                  controller: Get.find<AdminPageController>().soLuongController,
                ),
                //step1: pick image
                //install image_picker
                //import the corresponding library
                const Text(
                  'Ảnh',
                ),
                MaterialButton(
                    color: Colors.blue,
                    onPressed: () {
                      _pickImageFromGallery();
                    },
                    child: const Text('Chọn ảnh')),
                _image != null
                    ? SizedBox(
                        height: 200,
                        width: 200,
                        child:
                            //fix loi tran anh
                            Image.network(_image!.path, fit: BoxFit.fill))
                    : const Placeholder(
                        fallbackHeight: 200,
                        fallbackWidth: 200,
                      ),
                //step2: upload image
                //install firebase_storage
                //import the corresponding library
                MaterialButton(
                    color: Colors.blue,
                    onPressed: () async {
                      if (_image == null) return;
                      //upload image to firebase storage
                      //1. create a reference to the firebase storage
                      Reference ref = FirebaseStorage.instance
                          .ref()
                          .child('images/${_image!.name}');
                      //handle error/success
                      try {
                        await ref.putData(
                          await _image!.readAsBytes(),
                          SettableMetadata(contentType: 'image/jpeg'),
                        );
                        //3. get the url of the uploaded file
                        String url = await ref.getDownloadURL();
                        print(url);
                        await AdminPageController().set(
                          Get.find<AdminPageController>()
                              .tenSachController
                              .text,
                          Get.find<AdminPageController>().nxbController.text,
                          Get.find<AdminPageController>().biaController.text,
                          Get.find<AdminPageController>().tacGiaController.text,
                          Get.find<AdminPageController>().giaController.text,
                          Get.find<AdminPageController>()
                              .soLuongController
                              .text,
                          url,
                        );
                      } catch (e) {
                        print(e);
                      }
                      // //2. put the file to the defined reference
                      // await ref.putFile(File(_image!.path));
                      // //3. get the url of the uploaded file
                      // String url = await ref.getDownloadURL();
                      // print(url);
                    },
                    child: const Text('Upload ảnh')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _pickImageFromGallery() async {
    // ignore: deprecated_member_use
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
    print(_image?.path);
  }
}
