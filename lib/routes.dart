import 'package:get/get.dart';
import 'package:kaleela/views/about/binding.dart';
import 'package:kaleela/views/about/index.dart';
import 'package:kaleela/views/auth/binding.dart';
import 'package:kaleela/views/auth/index.dart';
import 'package:kaleela/views/choose_language/binding.dart';
import 'package:kaleela/views/choose_language/index.dart';
import 'package:kaleela/views/contact_us/binding.dart';
import 'package:kaleela/views/contact_us/index.dart';
import 'package:kaleela/views/lesson/binding.dart';
import 'package:kaleela/views/lesson/index.dart';
import 'package:kaleela/views/profile/binding.dart';
import 'package:kaleela/views/profile/index.dart';
import 'package:kaleela/views/quiz/binding.dart';
import 'package:kaleela/views/quiz/index.dart';
import 'package:kaleela/views/splash/binding.dart';
import 'package:kaleela/views/splash/index.dart';
import 'package:kaleela/views/topic/binding.dart';
import 'package:kaleela/views/topic/index.dart';
import 'package:kaleela/views/topics/binding.dart';
import 'package:kaleela/views/topics/index.dart';
import 'package:kaleela/views/user_mode/biniding.dart';
import 'package:kaleela/views/user_mode/index.dart';

abstract class AppRouting {
  static List<GetPage> routes() => [
        GetPage(
          name: Pages.splash.value,
          page: () => SplashPage(),
          binding: SplashBinding(),
        ),
        GetPage(
          name: Pages.chooseLanguage.value,
          page: () => ChooseLanguagePage(),
          binding: ChooseLangBinding(),
        ),
        GetPage(
          name: Pages.userMode.value,
          page: () => UserModePage(),
          binding: UserModeBinding(),
        ),
        GetPage(
          name: Pages.auth.value,
          page: () => AuthPage(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: Pages.topics.value,
          page: () => TopicsPage(),
          binding: TopicsBinding(),
        ),
        GetPage(
          name: Pages.topic.value,
          page: () => TopicPage(),
          binding: TopicBinding(),
        ),
        GetPage(
          name: Pages.lesson.value,
          page: () => LessonPage(),
          binding: LessonBinding(),
        ),
        GetPage(
          name: Pages.quiz.value,
          page: () => QuizPage(),
          binding: QuizBinding(),
        ),
        GetPage(
          name: Pages.profile.value,
          page: () => ProfilePage(),
          binding: ProfileBinding(),
        ),
        GetPage(
          name: Pages.contactus.value,
          page: () => ContactUsPage(),
          binding: ContactUsBidning(),
        ),
        GetPage(
          name: Pages.about.value,
          page: () => AboutPage(),
          binding: AboutBinding(),
        ),
      ];
}

enum Pages {
  splash,
  chooseLanguage,
  userMode,
  auth,
  topics,
  topic,
  lesson,
  quiz,
  profile,
  contactus,
  about,
}

extension PagesExtension on Pages {
  String get value {
    switch (this) {
      case Pages.splash:
        return '/splashPage';
      case Pages.chooseLanguage:
        return '/chooseLanguage';
      case Pages.userMode:
        return '/userMode';
      case Pages.auth:
        return '/auth';
      case Pages.topics:
        return '/topics';
      case Pages.topic:
        return '/topic';
      case Pages.lesson:
        return '/lesson';
      case Pages.quiz:
        return '/quiz';
      case Pages.profile:
        return '/profile';
      case Pages.contactus:
        return '/contactus';
      case Pages.about:
        return '/about';
      default:
        throw 'unnamed route';
    }
  }
}

abstract class Navigation {
  static Pages? getPage(String route) {
    switch (route) {
      case '/splashPage':
        return Pages.splash;
      case '/userMode':
        return Pages.userMode;
      case '/chooseLanguage':
        return Pages.chooseLanguage;
      case '/auth':
        return Pages.auth;
      case '/topics':
        return Pages.topics;
      case '/topic':
        return Pages.topic;
      case '/lesson':
        return Pages.lesson;
      case '/quiz':
        return Pages.quiz;
      case '/profile':
        return Pages.profile;
      case '/contactus':
        return Pages.contactus;
      case '/about':
        return Pages.about;
      default:
        return null;
    }
  }
}
