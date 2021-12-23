import 'package:auto_route/auto_route.dart';

import '../../../presentation/profile/profile_screen.dart';
import '../auth/auth_screen.dart';
import '../auth/widgets/verified.dart';
import '../contact_form/contact_form_screen.dart';
import '../crowdaction/crowdaction_browse/crowdaction_browse_screen.dart';
import '../crowdaction/crowdaction_details/crowdaction_details_screen.dart';
import '../crowdaction/crowdaction_home/crowdaction_home_screen.dart';
import '../crowdaction/crowdaction_participants/crowdaction_participants_screen.dart';
import '../demo/components_demo/components_demo_screen.dart';
import '../demo/demo_screen.dart';
import '../home/home_screen.dart';
import '../onboarding/onboarding_screen.dart';
import '../settings/settings_layout.dart';
import '../settings/settings_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: HomePage,
      initial: true,
      children: [
        AutoRoute(
          path: 'browse-crowdactions',
          name: 'CrowdactionRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: CrowdActionHomeScreen),
            AutoRoute(path: 'details', page: CrowdActionDetailsPage),
            AutoRoute(path: 'participants', page: CrowdActionParticipantsPage),
            AutoRoute(path: 'view-all', page: CrowdActionBrowsePage),
          ],
        ),
        AutoRoute(
          path: 'user',
          name: 'UserProfileRouter',
          page: UserProfilePage,
        ),
        AutoRoute(
          path: 'demo',
          name: 'DemoScreenRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: DemoPage),
            AutoRoute(path: 'contact-form', page: ContactFormPage),
            AutoRoute(path: 'components-demo', page: ComponentsDemoPage),
            AutoRoute(path: 'onboarding', page: OnboardingPage),
            AutoRoute(path: 'verified', page: VerifiedPage),
          ],
        ),
      ],
    ),
    AutoRoute(path: 'auth', page: AuthPage),
    AutoRoute(path: 'verified', page: VerifiedPage),
    AutoRoute(path: 'settings-page', page: SettingsPage),
    AutoRoute(path: 'settings-layout', page: SettingsLayout),
  ],
)
class $AppRouter {}
