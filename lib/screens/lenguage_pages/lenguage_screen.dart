import 'package:bk_bot/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'lenguage_screen_controller.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LanguageScreenController languageScreenController =
        Get.put(LanguageScreenController());

    updateLanguage(Locale locale) {
      Get.updateLocale(locale);
    }

    List<String> languageList = [
      'VietNam',
      'English',
      'Spanish',
      'French',
      'German',
      'Chinese',
      'Russian',
      'Hindi',
      'Arabic',
      'Portuguese',
      'Indonesian',
      'Dutch',
      'Italian',
      'Polish',
      'Turkish',
      'Japanese'
    ];

    List local = const [
      Locale('vi', 'VN'),
      Locale('en', 'US'),
      Locale('sp', 'SP'),
      Locale('fre', 'FRE'),
      Locale('gem', 'GEM'),
      Locale('ch', 'CH'),
      Locale('russ', 'RUSS'),
      Locale('hi', 'IN'),
      Locale('ar', 'AR'),
      Locale('por', 'PORTU'),
      Locale('indo', 'INDO'),
      Locale('dutch', 'DUTCH'),
      Locale('ity', 'ITY'),
      Locale('polish', 'POLISH'),
      Locale('turk', 'TURK'),
      Locale('japa', 'JAPA'),
    ];

    List<String> languageCode = [
      'vi',
      'en',
      'sp',
      'fre',
      'gem',
      'ch',
      'russ',
      'hi',
      'ar',
      'por',
      'indo',
      'dutch',
      'ity',
      'polish',
      'turk',
      'japa',
    ];

    List<String> countryCode = [
      'VN',
      'US',
      'SP',
      'FRE',
      'GEM',
      'CH',
      'RUSS',
      'IN',
      'AR',
      'PORTU',
      'INDO',
      'DUTCH',
      'ITY',
      'POLISH',
      'TURK',
      'JAPA'
    ];

    final Container adContainer = Container(
      alignment: Alignment.center,
    );

    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text("language".tr,
            style: TextStyle(color: context.textTheme.headline1!.color)),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              color: context.textTheme.headline1!.color,
            )),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: context.theme.primaryColor,
                borderRadius: BorderRadius.circular(15)),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: languageList.length,
                itemBuilder: (context, index) {
                  return Obx(() {
                    return InkWell(
                      onTap: () {
                        languageScreenController.onChangeIndex(index);
                        languageScreenController
                            .storeCountryCode(countryCode[index]);
                        languageScreenController
                            .storeLanguageCode(languageCode[index]);
                        updateLanguage(local[index]);
                      },
                      child: SizedBox(
                        height: 40,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  languageList[index],
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const Spacer(),
                                languageScreenController.selectedIndex.value ==
                                        index
                                    ? const Icon(
                                        Icons.check,
                                        color: Color(0xff3FB085),
                                      )
                                    : Container()
                              ],
                            ).marginSymmetric(horizontal: 20),
                            5.0.addHSpace(),
                            // Divider(color: Colors.black,)
                          ],
                        ),
                      ),
                    );
                  });
                }),
          ).marginOnly(left: 20, right: 20, top: 10, bottom: 55),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [adContainer],
          )
        ],
      ),
    );
  }
}
