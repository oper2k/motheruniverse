import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const EntryPageWidget() : const WelcomeWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const EntryPageWidget() : const WelcomeWidget(),
        ),
        FFRoute(
          name: 'Welcome',
          path: '/welcome',
          builder: (context, params) => const WelcomeWidget(),
        ),
        FFRoute(
          name: 'Registration',
          path: '/registration',
          builder: (context, params) => const RegistrationWidget(),
        ),
        FFRoute(
          name: 'SignIn',
          path: '/signIn',
          builder: (context, params) => const SignInWidget(),
        ),
        FFRoute(
          name: 'ResetPass',
          path: '/resetPass',
          builder: (context, params) => const ResetPassWidget(),
        ),
        FFRoute(
          name: 'FillProfile',
          path: '/fillProfile',
          builder: (context, params) => const FillProfileWidget(),
        ),
        FFRoute(
          name: 'ChooseTheAge',
          path: '/chooseTheAge',
          builder: (context, params) => const ChooseTheAgeWidget(),
        ),
        FFRoute(
          name: 'ChooseTheGender',
          path: '/chooseTheGender',
          builder: (context, params) => const ChooseTheGenderWidget(),
        ),
        FFRoute(
          name: 'ChildInfo',
          path: '/childInfo',
          builder: (context, params) => const ChildInfoWidget(),
        ),
        FFRoute(
          name: 'Personalisation',
          path: '/personalisation',
          builder: (context, params) => const PersonalisationWidget(),
        ),
        FFRoute(
          name: 'ProfilePage',
          path: '/profilePage',
          builder: (context, params) => const ProfilePageWidget(),
        ),
        FFRoute(
          name: 'EditProfile',
          path: '/editProfile',
          builder: (context, params) => const EditProfileWidget(),
        ),
        FFRoute(
          name: 'AppInfo',
          path: '/appInfo',
          builder: (context, params) => const AppInfoWidget(),
        ),
        FFRoute(
          name: 'LoyaltyPage',
          path: '/loyaltyPage',
          builder: (context, params) => const LoyaltyPageWidget(),
        ),
        FFRoute(
          name: 'UnbornChildPage',
          path: '/unbornChildPage',
          asyncParams: {
            'child': getDoc(['users', 'children'], ChildrenRecord.fromSnapshot),
          },
          builder: (context, params) => UnbornChildPageWidget(
            child: params.getParam('child', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'AnalyzesPage',
          path: '/analyzesPage',
          asyncParams: {
            'child': getDoc(['users', 'children'], ChildrenRecord.fromSnapshot),
          },
          builder: (context, params) => AnalyzesPageWidget(
            child: params.getParam('child', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'NutritionalAdvice',
          path: '/nutritionalAdvice',
          builder: (context, params) => NutritionalAdviceWidget(
            currentWeek: params.getParam('currentWeek', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'AdvicesUnbornChild',
          path: '/advicesUnbornChild',
          builder: (context, params) => AdvicesUnbornChildWidget(
            initialIndex: params.getParam('initialIndex', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'MainPage',
          path: '/mainPage',
          builder: (context, params) => const MainPageWidget(),
        ),
        FFRoute(
          name: 'BornChildPage',
          path: '/bornChildPage',
          asyncParams: {
            'child': getDoc(['users', 'children'], ChildrenRecord.fromSnapshot),
          },
          builder: (context, params) => BornChildPageWidget(
            child: params.getParam('child', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'WeightPage',
          path: '/weightPage',
          asyncParams: {
            'child': getDoc(['users', 'children'], ChildrenRecord.fromSnapshot),
          },
          builder: (context, params) => WeightPageWidget(
            child: params.getParam('child', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'GrowthPage',
          path: '/growthPage',
          asyncParams: {
            'child': getDoc(['users', 'children'], ChildrenRecord.fromSnapshot),
          },
          builder: (context, params) => GrowthPageWidget(
            child: params.getParam('child', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'VaccinationCalendarPage',
          path: '/vaccinationCalendarPage',
          asyncParams: {
            'child': getDoc(['users', 'children'], ChildrenRecord.fromSnapshot),
          },
          builder: (context, params) => VaccinationCalendarPageWidget(
            currentWeek: params.getParam('currentWeek', ParamType.int),
            birthDate: params.getParam('birthDate', ParamType.DateTime),
            child: params.getParam('child', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'DoctorVisitingPage',
          path: '/doctorVisitingPage',
          asyncParams: {
            'child': getDoc(['users', 'children'], ChildrenRecord.fromSnapshot),
          },
          builder: (context, params) => DoctorVisitingPageWidget(
            currentWeek: params.getParam('currentWeek', ParamType.int),
            child: params.getParam('child', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'CreateDoctorVisitingPage',
          path: '/createDoctorVisitingPage',
          builder: (context, params) => CreateDoctorVisitingPageWidget(
            age: params.getParam('age', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'CreateVaccinePage',
          path: '/createVaccinePage',
          asyncParams: {
            'child': getDoc(['users', 'children'], ChildrenRecord.fromSnapshot),
          },
          builder: (context, params) => CreateVaccinePageWidget(
            period: params.getParam('period', ParamType.String),
            child: params.getParam('child', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'EditChildInfoPage',
          path: '/editChildInfoPage',
          asyncParams: {
            'child': getDoc(['users', 'children'], ChildrenRecord.fromSnapshot),
          },
          builder: (context, params) => EditChildInfoPageWidget(
            child: params.getParam('child', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'AllVideosPage',
          path: '/allVideosPage',
          builder: (context, params) => const AllVideosPageWidget(),
        ),
        FFRoute(
          name: 'VideoPlayer',
          path: '/videoPlayer',
          asyncParams: {
            'video': getDoc(['video'], VideoRecord.fromSnapshot),
          },
          builder: (context, params) => VideoPlayerWidget(
            video: params.getParam('video', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'AllCheckListsPage',
          path: '/allCheckListsPage',
          builder: (context, params) => const AllCheckListsPageWidget(),
        ),
        FFRoute(
          name: 'CheckViewPage',
          path: '/checkViewPage',
          asyncParams: {
            'checkListParent':
                getDoc(['check_list'], CheckListRecord.fromSnapshot),
          },
          builder: (context, params) => CheckViewPageWidget(
            checkListParent:
                params.getParam('checkListParent', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'newViewPage',
          path: '/newViewPage',
          asyncParams: {
            'newItem': getDoc(['news'], NewsRecord.fromSnapshot),
          },
          builder: (context, params) => NewViewPageWidget(
            newItem: params.getParam('newItem', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'FreeLessonsPage',
          path: '/freeLessonsPage',
          builder: (context, params) => const FreeLessonsPageWidget(),
        ),
        FFRoute(
          name: 'AllPodcastsPage',
          path: '/allPodcastsPage',
          builder: (context, params) => const AllPodcastsPageWidget(),
        ),
        FFRoute(
          name: 'CalendarOfEventsPage',
          path: '/calendarOfEventsPage',
          builder: (context, params) => const CalendarOfEventsPageWidget(),
        ),
        FFRoute(
          name: 'EntryToEventPage',
          path: '/entryToEventPage',
          asyncParams: {
            'event': getDoc(['events'], EventsRecord.fromSnapshot),
          },
          builder: (context, params) => EntryToEventPageWidget(
            event: params.getParam('event', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'EntryFinishedPage',
          path: '/entryFinishedPage',
          builder: (context, params) => const EntryFinishedPageWidget(),
        ),
        FFRoute(
          name: 'AllNewsPage',
          path: '/allNewsPage',
          builder: (context, params) => const AllNewsPageWidget(),
        ),
        FFRoute(
          name: 'TrackersPage',
          path: '/trackersPage',
          builder: (context, params) => const TrackersPageWidget(),
        ),
        FFRoute(
          name: 'TrackersListPage',
          path: '/trackersListPage',
          asyncParams: {
            'child': getDoc(['users', 'children'], ChildrenRecord.fromSnapshot),
          },
          builder: (context, params) => TrackersListPageWidget(
            child: params.getParam('child', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'BreastTrackerPage',
          path: '/breastTrackerPage',
          asyncParams: {
            'child': getDoc(['users', 'children'], ChildrenRecord.fromSnapshot),
          },
          builder: (context, params) => BreastTrackerPageWidget(
            child: params.getParam('child', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'BreastTrackerIsAdded',
          path: '/breastTrackerIsAdded',
          asyncParams: {
            'track': getDoc(['users', 'trackers'], TrackersRecord.fromSnapshot),
            'child': getDoc(['users', 'children'], ChildrenRecord.fromSnapshot),
          },
          builder: (context, params) => BreastTrackerIsAddedWidget(
            track: params.getParam('track', ParamType.Document),
            child: params.getParam('child', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'SleepTrackerPage',
          path: '/sleepTrackerPage',
          asyncParams: {
            'child': getDoc(['users', 'children'], ChildrenRecord.fromSnapshot),
          },
          builder: (context, params) => SleepTrackerPageWidget(
            child: params.getParam('child', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'SleepTrackerIsAdded',
          path: '/sleepTrackerIsAdded',
          asyncParams: {
            'tracker':
                getDoc(['users', 'trackers'], TrackersRecord.fromSnapshot),
            'child': getDoc(['users', 'children'], ChildrenRecord.fromSnapshot),
            'secondDay':
                getDoc(['users', 'trackers'], TrackersRecord.fromSnapshot),
          },
          builder: (context, params) => SleepTrackerIsAddedWidget(
            tracker: params.getParam('tracker', ParamType.Document),
            child: params.getParam('child', ParamType.Document),
            secondDay: params.getParam('secondDay', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'FeedingTrackerPage',
          path: '/feedingTrackerPage',
          asyncParams: {
            'child': getDoc(['users', 'children'], ChildrenRecord.fromSnapshot),
          },
          builder: (context, params) => FeedingTrackerPageWidget(
            child: params.getParam('child', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'FeedingTrackerIsAdded',
          path: '/feedingTrackerIsAdded',
          asyncParams: {
            'feedTracker':
                getDoc(['users', 'trackers'], TrackersRecord.fromSnapshot),
            'child': getDoc(['users', 'children'], ChildrenRecord.fromSnapshot),
          },
          builder: (context, params) => FeedingTrackerIsAddedWidget(
            feedTracker: params.getParam('feedTracker', ParamType.Document),
            child: params.getParam('child', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'LearningPage',
          path: '/learningPage',
          builder: (context, params) => const LearningPageWidget(),
        ),
        FFRoute(
          name: 'GetAllLessonsPage',
          path: '/getAllLessonsPage',
          builder: (context, params) => const GetAllLessonsPageWidget(),
        ),
        FFRoute(
          name: 'CartPage',
          path: '/cartPage',
          builder: (context, params) => const CartPageWidget(),
        ),
        FFRoute(
          name: 'BuyLessonPage',
          path: '/buyLessonPage',
          asyncParams: {
            'lesson': getDoc(['learning'], LearningRecord.fromSnapshot),
          },
          builder: (context, params) => BuyLessonPageWidget(
            lesson: params.getParam('lesson', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'PaymentMethodPage',
          path: '/paymentMethodPage',
          builder: (context, params) => PaymentMethodPageWidget(
            goodsCount: params.getParam('goodsCount', ParamType.int),
            price: params.getParam('price', ParamType.double),
            buyingAll: params.getParam('buyingAll', ParamType.bool),
            lessonsReferences: params.getParam<String>(
                'lessonsReferences', ParamType.String, true),
          ),
        ),
        FFRoute(
          name: 'MakePaymentPage',
          path: '/makePaymentPage',
          builder: (context, params) => MakePaymentPageWidget(
            price: params.getParam('price', ParamType.double),
            usedBonuses: params.getParam('usedBonuses', ParamType.double),
            lessonsReferences: params.getParam<String>(
                'lessonsReferences', ParamType.String, true),
            buyingAll: params.getParam('buyingAll', ParamType.bool),
            title: params.getParam('title', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'SuccessfulPaymentAll',
          path: '/successfulPaymentAll',
          builder: (context, params) => const SuccessfulPaymentAllWidget(),
        ),
        FFRoute(
          name: 'FailedPayment',
          path: '/failedPayment',
          builder: (context, params) => const FailedPaymentWidget(),
        ),
        FFRoute(
          name: 'SuccessfulPurchases',
          path: '/successfulPurchases',
          builder: (context, params) => const SuccessfulPurchasesWidget(),
        ),
        FFRoute(
          name: 'ViewLessonVid',
          path: '/viewLessonVid',
          asyncParams: {
            'lesson': getDoc(['learning'], LearningRecord.fromSnapshot),
          },
          builder: (context, params) => ViewLessonVidWidget(
            lesson: params.getParam('lesson', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'ViewLessonPage',
          path: '/viewLessonPage',
          asyncParams: {
            'lesson': getDoc(['learning'], LearningRecord.fromSnapshot),
          },
          builder: (context, params) => ViewLessonPageWidget(
            lesson: params.getParam('lesson', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'NetworkingPage',
          path: '/networkingPage',
          builder: (context, params) => const NetworkingPageWidget(),
        ),
        FFRoute(
          name: 'NetworkingSearchingUser',
          path: '/networkingSearchingUser',
          builder: (context, params) => const NetworkingSearchingUserWidget(),
        ),
        FFRoute(
          name: 'EntryPage',
          path: '/entryPage',
          builder: (context, params) => const EntryPageWidget(),
        ),
        FFRoute(
          name: 'SleepNormsPage',
          path: '/sleepNormsPage',
          asyncParams: {
            'child': getDoc(['users', 'children'], ChildrenRecord.fromSnapshot),
          },
          builder: (context, params) => SleepNormsPageWidget(
            child: params.getParam('child', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'ChangeChildPersonalisation',
          path: '/changeChildPersonalisation',
          asyncParams: {
            'child': getDoc(['users', 'children'], ChildrenRecord.fromSnapshot),
          },
          builder: (context, params) => ChangeChildPersonalisationWidget(
            child: params.getParam('child', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'CheckViewPDF',
          path: '/checkViewPDF',
          asyncParams: {
            'check': getDoc(['check_list'], CheckListRecord.fromSnapshot),
          },
          builder: (context, params) => CheckViewPDFWidget(
            check: params.getParam('check', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'YouTubePlayer',
          path: '/youTubePlayer',
          asyncParams: {
            'video': getDoc(['video'], VideoRecord.fromSnapshot),
          },
          builder: (context, params) => YouTubePlayerWidget(
            video: params.getParam('video', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'AdvicesBornChild',
          path: '/advicesBornChild',
          builder: (context, params) => AdvicesBornChildWidget(
            initialIndex: params.getParam('initialIndex', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'asdadqwdqw',
          path: '/asdadqwdqw',
          builder: (context, params) => const AsdadqwdqwWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/welcome';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).previewApp,
                  child: Center(
                    child: Image.asset(
                      'assets/images/a7r86-bu29e.webp',
                      width: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
