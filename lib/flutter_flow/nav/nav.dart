import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/lat_lng.dart';
// import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

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

GoRouter createRouter(AppStateNotifier appStateNotifier, [Widget? entryPage]) =>
    GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      // errorBuilder: (context, state) => appStateNotifier.loggedIn
      //     ? entryPage ?? HomeWidget()
      //     : SplashscreenWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>SplashscreenWidget()
          // appStateNotifier.loggedIn
          //     ? entryPage ?? HomeWidget()
          //     : SplashscreenWidget(),
        ),
        FFRoute(
          name: OnboardingWidget.routeName,
          path: OnboardingWidget.routePath,
          builder: (context, params) => OnboardingWidget(),
        ),
        FFRoute(
          name: SamtawadWidget.routeName,
          path: SamtawadWidget.routePath,
          builder: (context, params) => SamtawadWidget(),
        ),
        FFRoute(
          name: MahaMantraKaPrakatWidget.routeName,
          path: MahaMantraKaPrakatWidget.routePath,
          builder: (context, params) => MahaMantraKaPrakatWidget(),
        ),
        FFRoute(
          name: MainpageWidget.routeName,
          path: MainpageWidget.routePath,
          builder: (context, params) => MainpageWidget(),
        ),
        // FFRoute(
        //   name: SplashscreenWidget.routeName,
        //   path: SplashscreenWidget.routePath,
        //   builder: (context, params) => SplashscreenWidget(),
        // ),
        FFRoute(
          name: HomeWidget.routeName,
          path: HomeWidget.routePath,
          builder: (context, params) => HomeWidget(),
        ),
        FFRoute(
          name: GuruJiKaJivanAndSadhnaWidget.routeName,
          path: GuruJiKaJivanAndSadhnaWidget.routePath,
          builder: (context, params) => GuruJiKaJivanAndSadhnaWidget(),
        ),
        FFRoute(
          name: ShisyaKaKartvyaWidget.routeName,
          path: ShisyaKaKartvyaWidget.routePath,
          builder: (context, params) => ShisyaKaKartvyaWidget(),
        ),
        FFRoute(
          name: LoginPageWidget.routeName,
          path: LoginPageWidget.routePath,
          builder: (context, params) => LoginPageWidget(),
        ),
        FFRoute(
          name: ForgatPasswordWidget.routeName,
          path: ForgatPasswordWidget.routePath,
          builder: (context, params) => ForgatPasswordWidget(),
        ),
        FFRoute(
          name: RegisterPageWidget.routeName,
          path: RegisterPageWidget.routePath,
          builder: (context, params) => RegisterPageWidget(),
        ),
        FFRoute(
          name: GurupehchanWidget.routeName,
          path: GurupehchanWidget.routePath,
          builder: (context, params) => GurupehchanWidget(),
        ),
        FFRoute(
          name: PhotoLocationWidget.routeName,
          path: PhotoLocationWidget.routePath,
          builder: (context, params) => PhotoLocationWidget(
            tabNumber: params.getParam(
              'tabNumber',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: UserdetailsWidget.routeName,
          path: UserdetailsWidget.routePath,
          builder: (context, params) => UserdetailsWidget(),
        ),
        FFRoute(
          name: GurudevFigureWidget.routeName,
          path: GurudevFigureWidget.routePath,
          builder: (context, params) => GurudevFigureWidget(),
        ),
        FFRoute(
          name: AashramWidget.routeName,
          path: AashramWidget.routePath,
          builder: (context, params) => AashramWidget(),
        ),
        FFRoute(
          name: OnlineSatsangPageWidget.routeName,
          path: OnlineSatsangPageWidget.routePath,
          builder: (context, params) => OnlineSatsangPageWidget(),
        ),
        FFRoute(
          name: LocationWidget.routeName,
          path: LocationWidget.routePath,
          builder: (context, params) => LocationWidget(
            location: params.getParam(
              'location',
              ParamType.LatLng,
            ),
          ),
        ),
        FFRoute(
          name: AddminDashboardWidget.routeName,
          path: AddminDashboardWidget.routePath,
          builder: (context, params) => AddminDashboardWidget(),
        ),
        FFRoute(
          name: AddVaniPageWidget.routeName,
          path: AddVaniPageWidget.routePath,
          builder: (context, params) => AddVaniPageWidget(),
        ),
        FFRoute(
          name: AddAashramPageWidget.routeName,
          path: AddAashramPageWidget.routePath,
          builder: (context, params) => AddAashramPageWidget(),
        ),
        FFRoute(
          name: AddInpersonSatsangWidget.routeName,
          path: AddInpersonSatsangWidget.routePath,
          builder: (context, params) => AddInpersonSatsangWidget(),
        ),
        FFRoute(
          name: AddOnlineSatsangWidget.routeName,
          path: AddOnlineSatsangWidget.routePath,
          builder: (context, params) => AddOnlineSatsangWidget(),
        ),
        FFRoute(
          name: EditAashramPageWidget.routeName,
          path: EditAashramPageWidget.routePath,
          asyncParams: {
            'singleaashram': getDoc(['inperson_ashram_data'],
                InpersonAshramDataRecord.fromSnapshot),
          },
          builder: (context, params) => EditAashramPageWidget(
            singleaashram: params.getParam(
              'singleaashram',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: EditAudioPageWidget.routeName,
          path: EditAudioPageWidget.routePath,
          asyncParams: {
            'editaashram': getDoc(['audio'], AudioRecord.fromSnapshot),
          },
          builder: (context, params) => EditAudioPageWidget(
            editaashram: params.getParam(
              'editaashram',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: VaniPageWidget.routeName,
          path: VaniPageWidget.routePath,
          builder: (context, params) => VaniPageWidget(),
        ),
        FFRoute(
          name: EditInpersonSatsangWidget.routeName,
          path: EditInpersonSatsangWidget.routePath,
          asyncParams: {
            'editinpersonsatsang': getDoc(
                ['inperson_satsang'], InpersonSatsangRecord.fromSnapshot),
          },
          builder: (context, params) => EditInpersonSatsangWidget(
            editinpersonsatsang: params.getParam(
              'editinpersonsatsang',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: EditOnlineSatsangWidget.routeName,
          path: EditOnlineSatsangWidget.routePath,
          asyncParams: {
            'editonlinesatsang': getDoc(
                ['online_satsang_data'], OnlineSatsangDataRecord.fromSnapshot),
          },
          builder: (context, params) => EditOnlineSatsangWidget(
            editonlinesatsang: params.getParam(
              'editonlinesatsang',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: InpersonSatsangPageWidget.routeName,
          path: InpersonSatsangPageWidget.routePath,
          builder: (context, params) => InpersonSatsangPageWidget(),
        ),
        FFRoute(
          name: ChatWidget.routeName,
          path: ChatWidget.routePath,
          builder: (context, params) => ChatWidget(),
        ),
        FFRoute(
          name: AddChatWidget.routeName,
          path: AddChatWidget.routePath,
          builder: (context, params) => AddChatWidget(
            receivechat: params.getParam(
              'receivechat',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['chats'],
            ),
          ),
        ),
        FFRoute(
          name: UserChatWidget.routeName,
          path: UserChatWidget.routePath,
          builder: (context, params) => UserChatWidget(),
        ),
        FFRoute(
          name: TestWidget.routeName,
          path: TestWidget.routePath,
          builder: (context, params) => TestWidget(),
        ),
        FFRoute(
          name: PlayerWidget.routeName,
          path: PlayerWidget.routePath,
          builder: (context, params) => PlayerWidget(
            currentIndex: params.getParam(
              'currentIndex',
              ParamType.int,
            ),
            type: params.getParam(
              'type',
              ParamType.String,
            ),
            pos: params.getParam(
              'pos',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: PicturesWidget.routeName,
          path: PicturesWidget.routePath,
          builder: (context, params) => PicturesWidget(
            currentIndex: params.getParam(
              'currentIndex',
              ParamType.int,
            ),
            type: params.getParam(
              'type',
              ParamType.String,
            ),
          //   selectedId: params.getParam(
          //   'currentIndex',
          //   ParamType.int,
          // ),
          ),
        ),
        FFRoute(
          name: AddVideoPageWidget.routeName,
          path: AddVideoPageWidget.routePath,
          builder: (context, params) => AddVideoPageWidget(),
        ),
        FFRoute(
          name: AddSatsangWidget.routeName,
          path: AddSatsangWidget.routePath,
          builder: (context, params) => AddSatsangWidget(),
        ),
        FFRoute(
          name: SatsangPageWidget.routeName,
          path: SatsangPageWidget.routePath,
          builder: (context, params) => SatsangPageWidget(),
        ),
        FFRoute(
          name: EditSatsangPageWidget.routeName,
          path: EditSatsangPageWidget.routePath,
          asyncParams: {
            'editSatsang': getDoc(['satsang'], SatsangRecord.fromSnapshot),
          },
          builder: (context, params) => EditSatsangPageWidget(
            editSatsang: params.getParam(
              'editSatsang',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AddGurukalinSatsangWidget.routeName,
          path: AddGurukalinSatsangWidget.routePath,
          builder: (context, params) => AddGurukalinSatsangWidget(),
        ),
        FFRoute(
          name: EditGurukalinSatsangWidget.routeName,
          path: EditGurukalinSatsangWidget.routePath,
          asyncParams: {
            'editgurukalinsatsang': getDoc(
                ['gurukalin_satsang'], GurukalinSatsangRecord.fromSnapshot),
          },
          builder: (context, params) => EditGurukalinSatsangWidget(
            editgurukalinsatsang: params.getParam(
              'editgurukalinsatsang',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: GurukalinSatsangWidget.routeName,
          path: GurukalinSatsangWidget.routePath,
          builder: (context, params) => GurukalinSatsangWidget(),
        ),
        FFRoute(
          name: EditVideoPageWidget.routeName,
          path: EditVideoPageWidget.routePath,
          asyncParams: {
            'editvideo': getDoc(['video'], VideoRecord.fromSnapshot),
          },
          builder: (context, params) => EditVideoPageWidget(
            editvideo: params.getParam(
              'editvideo',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: VideoPageWidget.routeName,
          path: VideoPageWidget.routePath,
          builder: (context, params) => VideoPageWidget(),
        ),
        FFRoute(
          name: WishlistWidget.routeName,
          path: WishlistWidget.routePath,
          builder: (context, params) => WishlistWidget(),
        ),
        FFRoute(
          name: AddAashramGallaryWidget.routeName,
          path: AddAashramGallaryWidget.routePath,
          builder: (context, params) => AddAashramGallaryWidget(),
        ),
        FFRoute(
          name: AddGurudevImageWidget.routeName,
          path: AddGurudevImageWidget.routePath,
          builder: (context, params) => AddGurudevImageWidget(),
        ),
        FFRoute(
          name: AddSamtawadImageWidget.routeName,
          path: AddSamtawadImageWidget.routePath,
          builder: (context, params) => AddSamtawadImageWidget(),
        ),
        FFRoute(
          name: AddKnowledgeImageWidget.routeName,
          path: AddKnowledgeImageWidget.routePath,
          builder: (context, params) => AddKnowledgeImageWidget(),
        ),
        FFRoute(
          name: ImagesWidget.routeName,
          path: ImagesWidget.routePath,
          builder: (context, params) => ImagesWidget(),
        ),
        FFRoute(
          name: EditAashramGallaryWidget.routeName,
          path: EditAashramGallaryWidget.routePath,
          asyncParams: {
            'editaashramgallary':
                getDoc(['ashram_gallery'], AshramGalleryRecord.fromSnapshot),
          },
          builder: (context, params) => EditAashramGallaryWidget(
            editaashramgallary: params.getParam(
              'editaashramgallary',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: EditGurudevImageWidget.routeName,
          path: EditGurudevImageWidget.routePath,
          asyncParams: {
            'editgurudevimage':
                getDoc(['guriji_ji_image'], GurijiJiImageRecord.fromSnapshot),
          },
          builder: (context, params) => EditGurudevImageWidget(
            editgurudevimage: params.getParam(
              'editgurudevimage',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: EditKnowledgeImageWidget.routeName,
          path: EditKnowledgeImageWidget.routePath,
          asyncParams: {
            'editknowledgeimage':
                getDoc(['aaj_ka_knowledge'], AajKaKnowledgeRecord.fromSnapshot),
          },
          builder: (context, params) => EditKnowledgeImageWidget(
            editknowledgeimage: params.getParam(
              'editknowledgeimage',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: EditSamtawadImageWidget.routeName,
          path: EditSamtawadImageWidget.routePath,
          asyncParams: {
            'editsamtawadknowledge': getDoc(
                ['samtawad_knowledge'], SamtawadKnowledgeRecord.fromSnapshot),
          },
          builder: (context, params) => EditSamtawadImageWidget(
            editsamtawadknowledge: params.getParam(
              'editsamtawadknowledge',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: SatsangShalaWidget.routeName,
          path: SatsangShalaWidget.routePath,
          builder: (context, params) => SatsangShalaWidget(),
        ),
        FFRoute(
          name: AddSatsangshalaWidget.routeName,
          path: AddSatsangshalaWidget.routePath,
          builder: (context, params) => AddSatsangshalaWidget(),
        ),
        FFRoute(
          name: EditSatsangShalaWidget.routeName,
          path: EditSatsangShalaWidget.routePath,
          asyncParams: {
            'singleaashram':
                getDoc(['satsang_shala'], SatsangShalaRecord.fromSnapshot),
          },
          builder: (context, params) => EditSatsangShalaWidget(
            singleaashram: params.getParam(
              'singleaashram',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AddAudioBookWidget.routeName,
          path: AddAudioBookWidget.routePath,
          builder: (context, params) => AddAudioBookWidget(),
        ),
        FFRoute(
          name: EditAudioBookWidget.routeName,
          path: EditAudioBookWidget.routePath,
          asyncParams: {
            'editvideo': getDoc(['audio_book'], AudioBookRecord.fromSnapshot),
          },
          builder: (context, params) => EditAudioBookWidget(
            editvideo: params.getParam(
              'editvideo',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AudioBookWidget.routeName,
          path: AudioBookWidget.routePath,
          builder: (context, params) => AudioBookWidget(),
        ),
        FFRoute(
          name: Book2Widget.routeName,
          path: Book2Widget.routePath,
          builder: (context, params) => Book2Widget(
            audioDocumnetRef: params.getParam(
              'audioDocumnetRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['audio_book'],
            ),
          ),
        ),
        FFRoute(
          name: GurudevFigureCopyWidget.routeName,
          path: GurudevFigureCopyWidget.routePath,
          builder: (context, params) => GurudevFigureCopyWidget(),
        ),
        FFRoute(
          name: FavoriteWidget.routeName,
          path: FavoriteWidget.routePath,
          builder: (context, params) => FavoriteWidget(),
        ),
        FFRoute(
          name: ParamNidhanWidget.routeName,
          path: ParamNidhanWidget.routePath,
          builder: (context, params) => ParamNidhanWidget(),
        ),
        FFRoute(
          name: EpubBookWidget.routeName,
          path: EpubBookWidget.routePath,
          builder: (context, params) => EpubBookWidget(
            epubBookUrl: params.getParam(
              'epubBookUrl',
              ParamType.String,
            ),
            bookId: params.getParam(
              'bookId',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['EpubBook'],
            ),
            bookname: params.getParam(
              'bookname',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: AddQuestionPageWidget.routeName,
          path: AddQuestionPageWidget.routePath,
          builder: (context, params) => AddQuestionPageWidget(),
        ),
        FFRoute(
          name: AajKaGyanPictureWidget.routeName,
          path: AajKaGyanPictureWidget.routePath,
          asyncParams: {
            'aajkaKnowledge': getDocList(
                ['aaj_ka_knowledge'], AajKaKnowledgeRecord.fromSnapshot),
          },
          builder: (context, params) => AajKaGyanPictureWidget(
            aajkaKnowledge: params.getParam<AajKaKnowledgeRecord>(
              'aajkaKnowledge',
              ParamType.Document,
              isList: true,
            ),
            currentIndex: params.getParam(
              'currentIndex',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: SamtawadKnowledgePicturessWidget.routeName,
          path: SamtawadKnowledgePicturessWidget.routePath,
          asyncParams: {
            'samtawadKnowledge': getDocList(
                ['samtawad_knowledge'], SamtawadKnowledgeRecord.fromSnapshot),
          },
          builder: (context, params) => SamtawadKnowledgePicturessWidget(
            samtawadKnowledge: params.getParam<SamtawadKnowledgeRecord>(
              'samtawadKnowledge',
              ParamType.Document,
              isList: true,
            ),
            currentIndex: params.getParam(
              'currentIndex',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: AsshramGalleryPictureWidget.routeName,
          path: AsshramGalleryPictureWidget.routePath,
          asyncParams: {
            'ashramGallery': getDocList(
                ['ashram_gallery'], AshramGalleryRecord.fromSnapshot),
          },
          builder: (context, params) => AsshramGalleryPictureWidget(
            ashramGallery: params.getParam<AshramGalleryRecord>(
              'ashramGallery',
              ParamType.Document,
              isList: true,
            ),
            currentIndex: params.getParam(
              'currentIndex',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: SamtaVilasWidget.routeName,
          path: SamtaVilasWidget.routePath,
          builder: (context, params) => SamtaVilasWidget(),
        ),
        FFRoute(
          name: QuestionandanswerWidget.routeName,
          path: QuestionandanswerWidget.routePath,
          builder: (context, params) => QuestionandanswerWidget(
            questionname: params.getParam(
              'questionname',
              ParamType.String,
            ),
            questionnumber: params.getParam(
              'questionnumber',
              ParamType.String,
            ),
            questionid: params.getParam(
              'questionid',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['question'],
            ),
            pageno: params.getParam(
              'pageno',
              ParamType.String,
            ),
            vachanList: params.getParam<String>(
              'vachanList',
              ParamType.String,
              isList: true,
            ),
            descriptionList: params.getParam<String>(
              'descriptionList',
              ParamType.String,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: QuestionAnswerWidget.routeName,
          path: QuestionAnswerWidget.routePath,
          builder: (context, params) => QuestionAnswerWidget(),
        ),
        FFRoute(
          name: EditQuestionPageWidget.routeName,
          path: EditQuestionPageWidget.routePath,
          asyncParams: {
            'qauestionPage': getDoc(['question'], QuestionRecord.fromSnapshot),
          },
          builder: (context, params) => EditQuestionPageWidget(
            qauestionPage: params.getParam(
              'qauestionPage',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ChapterDisplayWidget.routeName,
          path: ChapterDisplayWidget.routePath,
          builder: (context, params) => ChapterDisplayWidget(
            audioref: params.getParam(
              'audioref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['audio_book'],
            ),
          ),
        ),
        FFRoute(
          name: AddChapterWidget.routeName,
          path: AddChapterWidget.routePath,
          builder: (context, params) => AddChapterWidget(
            audioref: params.getParam(
              'audioref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['audio_book'],
            ),
          ),
        ),
        FFRoute(
          name: CheckingWidget.routeName,
          path: CheckingWidget.routePath,
          builder: (context, params) => CheckingWidget(),
        ),
        FFRoute(
          name: AddAnswerWidget.routeName,
          path: AddAnswerWidget.routePath,
          builder: (context, params) => AddAnswerWidget(
            questionref: params.getParam(
              'questionref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['question'],
            ),
          ),
        ),
        FFRoute(
          name: AnswerDisplayWidget.routeName,
          path: AnswerDisplayWidget.routePath,
          builder: (context, params) => AnswerDisplayWidget(
            questionref: params.getParam(
              'questionref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['question'],
            ),
          ),
        ),
        FFRoute(
          name: TestingWidget.routeName,
          path: TestingWidget.routePath,
          asyncParams: {
            'gurujiImage': getDocList(
                ['guriji_ji_image'], GurijiJiImageRecord.fromSnapshot),
          },
          builder: (context, params) => TestingWidget(
            gurujiImage: params.getParam<GurijiJiImageRecord>(
              'gurujiImage',
              ParamType.Document,
              isList: true,
            ),
            currentIndex: params.getParam(
              'currentIndex',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: FavoritetestWidget.routeName,
          path: FavoritetestWidget.routePath,
          builder: (context, params) => FavoritetestWidget(),
        ),
        FFRoute(
          name: ProfilepageWidget.routeName,
          path: ProfilepageWidget.routePath,
          builder: (context, params) => ProfilepageWidget(),
        ),
        FFRoute(
          name: EditprofileWidget.routeName,
          path: EditprofileWidget.routePath,
          builder: (context, params) => EditprofileWidget(),
        ),
        FFRoute(
          name: AddEpubBookWidget.routeName,
          path: AddEpubBookWidget.routePath,
          builder: (context, params) => AddEpubBookWidget(),
        ),
        FFRoute(
          name: EpubBookDetailsWidget.routeName,
          path: EpubBookDetailsWidget.routePath,
          builder: (context, params) => EpubBookDetailsWidget(),
        ),
        FFRoute(
          name: QuestionWidget.routeName,
          path: QuestionWidget.routePath,
          builder: (context, params) => QuestionWidget(
            questionname: params.getParam(
              'questionname',
              ParamType.String,
            ),
            questionnumber: params.getParam(
              'questionnumber',
              ParamType.String,
            ),
            questionid: params.getParam(
              'questionid',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['question'],
            ),
            pagenno: params.getParam(
              'pagenno',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: EditPageWidget.routeName,
          path: EditPageWidget.routePath,
          asyncParams: {
            'userProfile':
                getDoc(['usercollection'], UsercollectionRecord.fromSnapshot),
          },
          builder: (context, params) => EditPageWidget(
            userProfile: params.getParam(
              'userProfile',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: BookWidget.routeName,
          path: BookWidget.routePath,
          builder: (context, params) => BookWidget(),
        ),
        FFRoute(
          name: FavouriteBookmarkQuestionWidget.routeName,
          path: FavouriteBookmarkQuestionWidget.routePath,
          builder: (context, params) => FavouriteBookmarkQuestionWidget(),
        ),
        FFRoute(
          name: SatsangPageCopyWidget.routeName,
          path: SatsangPageCopyWidget.routePath,
          builder: (context, params) => SatsangPageCopyWidget(),
        ),
        FFRoute(
          name: VoiceSelectWidget.routeName,
          path: VoiceSelectWidget.routePath,
          builder: (context, params) => VoiceSelectWidget(),
        ),
        FFRoute(
          name: SamtaPrakashWidget.routeName,
          path: SamtaPrakashWidget.routePath,
          builder: (context, params) => SamtaPrakashWidget(),
        ),
        FFRoute(
          name: GurupehchanCopyWidget.routeName,
          path: GurupehchanCopyWidget.routePath,
          builder: (context, params) => GurupehchanCopyWidget(),
        ),
        FFRoute(
          name: AlarmWidget.routeName,
          path: AlarmWidget.routePath,
          builder: (context, params) => AlarmWidget(),
        ),
        FFRoute(
          name: PdfWidget.routeName,
          path: PdfWidget.routePath,
          builder: (context, params) => PdfWidget(),
        ),
        FFRoute(
          name: PlayerCopyWidget.routeName,
          path: PlayerCopyWidget.routePath,
          builder: (context, params) => PlayerCopyWidget(
            currentIndex: params.getParam(
              'currentIndex',
              ParamType.int,
            ),
            type: params.getParam(
              'type',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: AddEpubbookChaptersWidget.routeName,
          path: AddEpubbookChaptersWidget.routePath,
          builder: (context, params) => AddEpubbookChaptersWidget(
            epubchapterreference: params.getParam(
              'epubchapterreference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['EpubBook'],
            ),
          ),
        ),
        FFRoute(
          name: EpubBookChapterWidget.routeName,
          path: EpubBookChapterWidget.routePath,
          asyncParams: {
            'epubBookreference':
                getDoc(['EpubBook'], EpubBookRecord.fromSnapshot),
          },
          builder: (context, params) => EpubBookChapterWidget(
            epubBookreference: params.getParam(
              'epubBookreference',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: NotesWidget.routeName,
          path: NotesWidget.routePath,
          builder: (context, params) => NotesWidget(),
        ),
        FFRoute(
          name: PubWidget.routeName,
          path: PubWidget.routePath,
          builder: (context, params) => PubWidget(),
        ),
        FFRoute(
          name: EditEpubBookWidget.routeName,
          path: EditEpubBookWidget.routePath,
          asyncParams: {
            'epubBook': getDoc(['EpubBook'], EpubBookRecord.fromSnapshot),
          },
          builder: (context, params) => EditEpubBookWidget(
            epubBook: params.getParam(
              'epubBook',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: TestsWidget.routeName,
          path: TestsWidget.routePath,
          builder: (context, params) => TestsWidget(),
        ),
        FFRoute(
          name: AddChatUrerWidget.routeName,
          path: AddChatUrerWidget.routePath,
          builder: (context, params) => AddChatUrerWidget(
            receivechat: params.getParam(
              'receivechat',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['chats'],
            ),
            displayname: params.getParam(
              'displayname',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: VaniSatsangAndAudioBookCopyWidget.routeName,
          path: VaniSatsangAndAudioBookCopyWidget.routePath,
          builder: (context, params) => VaniSatsangAndAudioBookCopyWidget(
            tabLabel: params.getParam(
              'tabLabel',
              ParamType.bool,
            ),
            tabName: params.getParam(
              'tabName',
              ParamType.bool,
            ),
            tabNumber: params.getParam(
              'tabNumber',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: AudioListWidget.routeName,
          path: AudioListWidget.routePath,
          builder: (context, params) => AudioListWidget(
            selectcategory: params.getParam(
              'selectcategory',
              ParamType.String,
            ),
            speakername: params.getParam(
              'speakername',
              ParamType.String,
            ),
            selectsubcategory: params.getParam(
              'selectsubcategory',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SatsangListWidget.routeName,
          path: SatsangListWidget.routePath,
          builder: (context, params) => SatsangListWidget(
            selectcategory: params.getParam(
              'selectcategory',
              ParamType.String,
            ),
            speakername: params.getParam(
              'speakername',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: GuruSatsangWidget.routeName,
          path: GuruSatsangWidget.routePath,
          builder: (context, params) => GuruSatsangWidget(
            speakername: params.getParam(
              'speakername',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SatsangWidget.routeName,
          path: SatsangWidget.routePath,
          builder: (context, params) => SatsangWidget(
            selectcategory: params.getParam(
              'selectcategory',
              ParamType.String,
            ),
            subcategory: params.getParam(
              'subcategory',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: GurukalinWidget.routeName,
          path: GurukalinWidget.routePath,
          builder: (context, params) => GurukalinWidget(
            category: params.getParam(
              'category',
              ParamType.String,
            ),
            subcategory: params.getParam(
              'subcategory',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: GurukalinCopyWidget.routeName,
          path: GurukalinCopyWidget.routePath,
          builder: (context, params) => GurukalinCopyWidget(),
        ),
        FFRoute(
          name: AudioListCopyWidget.routeName,
          path: AudioListCopyWidget.routePath,
          builder: (context, params) => AudioListCopyWidget(
            selectcategory: params.getParam(
              'selectcategory',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: GranthShriSamtaVilasWidget.routeName,
          path: GranthShriSamtaVilasWidget.routePath,
          builder: (context, params) => GranthShriSamtaVilasWidget(),
        ),
        FFRoute(
          name: AddAlarmMusicWidget.routeName,
          path: AddAlarmMusicWidget.routePath,
          builder: (context, params) => AddAlarmMusicWidget(),
        ),
        FFRoute(
          name: AlarmDetailsWidget.routeName,
          path: AlarmDetailsWidget.routePath,
          builder: (context, params) => AlarmDetailsWidget(),
        ),
        FFRoute(
          name: EditAlarmMusicWidget.routeName,
          path: EditAlarmMusicWidget.routePath,
          builder: (context, params) => EditAlarmMusicWidget(
            document: params.getParam(
              'document',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['alarms'],
            ),
          ),
        ),
        FFRoute(
          name: EditAnswerWidget.routeName,
          path: EditAnswerWidget.routePath,
          asyncParams: {
            'answerquestion':
                getDoc(['question', 'answer'], AnswerRecord.fromSnapshot),
          },
          builder: (context, params) => EditAnswerWidget(
            answerquestion: params.getParam(
              'answerquestion',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: PlayerCopy2Widget.routeName,
          path: PlayerCopy2Widget.routePath,
          builder: (context, params) => PlayerCopy2Widget(
            currentIndex: params.getParam(
              'currentIndex',
              ParamType.int,
            ),
            type: params.getParam(
              'type',
              ParamType.String,
            ),
            pos: params.getParam(
              'pos',
              ParamType.int,
            ),
            id: params.getParam(
              'id',
              ParamType.int,
            ),
            // audioref: params.getParam(
            //   'audioref',
            //   ParamType.DocumentReference,
            //   isList: false,
            //   collectionNamePath: ['satsang'],
            // ),
          ),
        ),
        FFRoute(
          name: PlayerCopy2CopyWidget.routeName,
          path: PlayerCopy2CopyWidget.routePath,
          builder: (context, params) => PlayerCopy2CopyWidget(
            id: params.getParam(
              'id',
              ParamType.int,
            ),
            type: params.getParam(
              'type',
              ParamType.String,
            ),
            pos: params.getParam(
              'pos',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: PlayerCopy2CopyCopyWidget.routeName,
          path: PlayerCopy2CopyCopyWidget.routePath,
          builder: (context, params) => PlayerCopy2CopyCopyWidget(
            id: params.getParam(
              'id',
              ParamType.int,
            ),
            type: params.getParam(
              'type',
              ParamType.String,
            ),
            pos: params.getParam(
              'pos',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: PlayerCopy3Widget.routeName,
          path: PlayerCopy3Widget.routePath,
          builder: (context, params) => PlayerCopy3Widget(
            currentIndex: params.getParam(
              'currentIndex',
              ParamType.int,
            ),
            type: params.getParam(
              'type',
              ParamType.String,
            ),
            pos: params.getParam(
              'pos',
              ParamType.int,
            ),
            id: params.getParam(
              'id',
              ParamType.int,
            ),
            // audioref: params.getParam(
            //   'audioref',
            //   ParamType.DocumentReference,
            //   isList: false,
            //   collectionNamePath: ['audio'],
            // ),
          ),
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
    ..addAll(uri.queryParameters)
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
      (state.allParams.length == 1 &&
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
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
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
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
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
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/onboarding';
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
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
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

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
