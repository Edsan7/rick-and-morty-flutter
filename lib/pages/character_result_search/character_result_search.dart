import 'package:flutter/material.dart';
import 'package:rick_and_morty/controllers/character_search_controller.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/pages/character_detail/character_detail.dart';
import 'package:rick_and_morty/shared/list_view/character_card.dart';
import 'package:rick_and_morty/shared/containers/centered_message.dart';
import 'package:rick_and_morty/shared/containers/circular_loading.dart';
import 'package:rick_and_morty/shared/containers/navigate_section.dart';
import 'package:rick_and_morty/shared/list_view/character_list_view.dart';
import 'package:rick_and_morty/pages/character_result_search/widgets/character_search_result.dart';

class CharacterResultSearch extends StatefulWidget {
  final String searchName;

  const CharacterResultSearch({
    Key key,
    this.searchName,
  }) : super(key: key);

  @override
  _CharacterResultSearchState createState() => _CharacterResultSearchState();
}

class _CharacterResultSearchState extends State<CharacterResultSearch> {
  final _controller = CharacterResultSearchController();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  _initialize({String searchUrl}) async {
    searchUrl == null
        ? await _controller.fetchCharacterByName(widget.searchName)
        : await _controller.fetchCharacterByName(widget.searchName,
            searchUrl: searchUrl);
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Results for: ${widget.searchName}'),
    );
  }

  _buildBody() {
    if (_isLoading) return CircularLoading();

    if (_controller.appError != null)
      return CenteredMessage(message: _controller.appError.message);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildSearchResults(),
        _buildCharacterListView(),
        _buildNavigateSection(),
      ],
    );
  }

  _buildSearchResults() {
    return CharacterSearchResult(
      totalPages: _controller.totalPages.toString(),
      totalResults: _controller.totalResults.toString(),
    );
  }

  CharacterListView _buildCharacterListView() {
    return CharacterListView(
      itemBuilder: _buildCharacterCard,
      itemCount: _controller.itemCount,
    );
  }

  NavigateSection _buildNavigateSection() {
    return NavigateSection(
      totalPages: _controller.totalPages,
      actualPage: _controller.actualPage,
      previousPage: () {
        _initialize(searchUrl: _controller.previousPage);
        _controller.actualPage--;
      },
      nextPage: () {
        _initialize(searchUrl: _controller.nextPage);
        _controller.actualPage++;
      },
    );
  }

  Widget _buildCharacterCard(BuildContext context, int index) {
    final character = _controller.characters[index];
    return CharacterCard(onTap: () => _onTap(character), character: character);
  }

  _onTap(CharacterModel character) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CharacterDetail(character),
      ),
    );
  }
}
