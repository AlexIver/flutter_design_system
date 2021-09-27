import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = lightThemeData(context, AppColors());
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 80, horizontal: 20),
        child: Column(
          children: [
            TextComponent('Headline1', style: TextComponentStyle.headline1),
            TextComponent('Headline2', style: TextComponentStyle.headline2),
            TextComponent('Headline3', style: TextComponentStyle.headline3),
            TextComponent('Headline4', style: TextComponentStyle.headline4),
            TextComponent('Headline5', style: TextComponentStyle.headline5),
            TextComponent('BodyText1', style: TextComponentStyle.bodyText1),
            TextComponent('BodyText2', style: TextComponentStyle.bodyText2),
            TextComponent('Subtitle1', style: TextComponentStyle.subtitle1),
            TextComponent('Subtitle2', style: TextComponentStyle.subtitle2),
            TextComponent('Caption', style: TextComponentStyle.caption),
            TextComponent('Button', style: TextComponentStyle.button),
            TextComponent('Overline', style: TextComponentStyle.overline),
            verticalSpace10,
            ButtonComponent(
                title: 'Dialog',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => DialogComponentBuilder(
                        title: 'Title for dialog component',
                        avatarBuilder: DialogComponentAvatarBuilder(image: Icon(Icons.check_sharp)),
                        message:
                            'Long description for create dialog component and this is very long text',
                        buttonBuilders: [
                          DialogComponentButtonBuilder(
                            title: 'Without dismiss',
                            onPressed: () {},
                            autoDissmiss: false,
                          ),
                        ]).build(),
                  );
                }),
            verticalSpace10,
            ButtonComponent(title: 'Normal', onTap: () {}),
            verticalSpace10,
            ButtonComponent(title: 'Leading', leading: Icon(Icons.send), onTap: () {}),
            verticalSpace10,
            ButtonComponent(title: 'Disabled'),
            verticalSpace10,
            ButtonComponent(title: 'Busy', busy: true, onTap: () {}),
            verticalSpace10,
            ButtonComponent(title: 'Busy large', busy: true, size: ButtonComponentSize.large),
            verticalSpace10,
            ButtonComponent(
              title: 'Busy small',
              busy: true,
              size: ButtonComponentSize.small,
              onTap: () {},
            ),
            verticalSpace10,
            ButtonComponent.outline(title: 'Outline', onTap: () {}),
            verticalSpace10,
            ButtonComponent.outline(
                title: 'Outline Leading', leading: Icon(Icons.send), onTap: () {}),
            verticalSpace10,
            ButtonComponent.outline(
              title: 'wide outline leading',
              leading: Icon(Icons.send),
              onTap: () {},
              widthSize: ButtonComponentWidthSize.wide,
            ),
            verticalSpace10,
            TextFieldComponent(
              controller: TextEditingController(),
              placeholder: 'Enter Password',
              labelText: 'label',
              password: true,
            ),
            verticalSpace10,
            TextFieldComponent(
              controller: TextEditingController(),
              leading: Icon(Icons.reset_tv),
              placeholder: 'Enter TV Code',
            ),
            verticalSpace10,
            TextFieldComponent(
              controller: TextEditingController(),
              placeholder: 'Enter Password cleared',
              password: true,
              labelText: 'Flat label',
              flatLabel: true,
              clearMode: TextFieldComponentClearMode.editing,
            ),
            verticalSpace10,
            TextFieldComponent(
              controller: TextEditingController(),
              placeholder: 'Disable',
              labelText: 'Disable',
              enabled: false,
              password: true,
            ),
            verticalSpace10,
            TextFieldComponent(
              controller: TextEditingController(),
              placeholder: 'Error',
              errorText: 'Error message',
            ),
            verticalSpace10,
            Align(child: InfoLabelComponent('4.5'), alignment: Alignment.centerLeft),
            verticalSpace10,
            AutoCompleteComponent(
              title: 'San Francisco',
              subtitle: 'California',
              icon: Icons.location_on_outlined,
              onPressed: () {},
            ),
            verticalSpace10,
            SettingOptionComponent(
              title: 'Push notification',
              subtitle: 'for daily update',
              icon: Icons.add_alert_rounded,
              onPressed: () {},
              hasNext: true,
            ),
            verticalSpace10,
            SettingOptionComponent(
              title: 'Logout',
              icon: Icons.logout,
              onPressed: () {},
            ),
            verticalSpace10,
            SettingOptionSwitchComponent(
              title: 'Switch',
              subtitle: 'subtitle switch',
              icon: Icons.bluetooth,
              onChanged: (value) {},
            ),
            verticalSpace10,
          ],
        ),
      ),
    );
  }
}

class AppColors implements ColorsProvider {
  AppColors._();

  factory AppColors() => AppColors._();

  @override
  Color primary_color_light = Color(0xFF071f2b);
  @override
  Color accent_color_light = Color(0xFF6e9d8f);
  @override
  Color background_light = Color(0xFFffffff);
  @override
  Color primary_text_light = Color(0xFF071f2b);
  @override
  Color secondary_text_light = Color(0xFF3d6245);
  @override
  Color accent_text_light = Color(0xFF6e9d8f);
  @override
  Color error_text_light = Color(0xFFe75122);

  @override
  Color primary_color_dark = Color(0xFFecebe8);
  @override
  Color accent_color_dark = Color(0xFF3d6245);
  @override
  Color background_dark = Color(0xFF071f2b);
  @override
  Color primary_text_dark = Color(0xFFecebe8);
  @override
  Color secondary_text_dark = Color(0xFF9cb9a9);
  @override
  Color accent_text_dark = Color(0xFF3d6245);
  @override
  Color error_text_dark = Color(0xFFe75122);
}
