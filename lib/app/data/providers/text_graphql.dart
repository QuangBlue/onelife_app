import 'package:graphql_flutter/graphql_flutter.dart';

class TextGraphQLProvider {
  void textFunc() {
    String readRepositories = """
  query ReadRepositories(\$nRepositories: Int!) {
    viewer {
      repositories(last: \$nRepositories) {
        nodes {
          id
          name
          viewerHasStarred
        }
      }
    }
  }
""";

    useQuery(
      QueryOptions(
        document:
            gql(readRepositories), // this is the query string you just created
      ),
    );
  }
}
