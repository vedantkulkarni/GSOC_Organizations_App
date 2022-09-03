import 'package:flutter_test/flutter_test.dart';
import 'package:gsoc_organizations/Features/Home/data/models/gsoc_organization.dart';
import 'package:gsoc_organizations/Features/Home/data/repositories/gsoc_repository_data_layer.dart';
import 'package:gsoc_organizations/Features/Home/presentation/cubit/home_cubit.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([GSOCRepositoryDataLayer])
import 'integration_test.mocks.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  HomeCubit homeCubit = HomeCubit();
  MockGSOCRepositoryDataLayer mockGSOCRepositoryDataLayer =
      MockGSOCRepositoryDataLayer();

  // tearDown(body) {
  //   homeCubit.close();
  //   // body();
  // }

  const loadingState = TypeMatcher<HomeInitial>();
  const apiResultsState = TypeMatcher<AllOrganizationsState>();

  var testOrganization = GsocOrganization(
      name: 'GSOC Org',
      image_url: 'some url',
      image_background_color: 'Black',
      description: 'Desc',
      url: 'url',
      category: 'category',
      contact_email: 'gsoc@gmail.com',
      mailing_list: '',
      twitter_url: 'twitter',
      blog_url: 'blog',
      technologies: 'tech',
      topics: 'topics',
      years: {},
      irc_channel: 'channel',
      techList: [],
      topicsList: []);

  group('End to end test', () {
    test('Initial Loading state, progress indicator', () {
      expect(homeCubit.state, loadingState);
    });
    test('API returns results', () async {
      // homeCubit.getAllOrganizations();
   
      when(mockGSOCRepositoryDataLayer.getAllOrganizations())
          .thenAnswer((_) async {
        // homeCubit.emit(AllOrganizationsState());
        return [testOrganization];
      });

      expect(homeCubit.stream, emitsInOrder([apiResultsState]));
    });

    // test('Initial Loading state', () {});
    // test('Initial Loading state', () {});
  });
}
