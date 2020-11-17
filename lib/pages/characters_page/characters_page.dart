import 'package:flutter/material.dart';
import 'package:rick_and_morty/controllers/characters_controller.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/pages/character_detail/character_detail.dart';
import 'package:rick_and_morty/pages/character_result_search/character_result_search.dart';
import 'package:rick_and_morty/pages/characters_page/widgets/search_bar.dart';
import 'package:rick_and_morty/shared/list_view/character_card.dart';
import 'package:rick_and_morty/shared/containers/navigate_section.dart';
import 'package:rick_and_morty/shared/list_view/character_list_view.dart';
import 'package:rick_and_morty/shared/containers/centered_message.dart';
import 'package:rick_and_morty/shared/containers/circular_loading.dart';

class CharactersPage extends StatefulWidget {
  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final _controller = CharactersController();
  final _key = GlobalKey<FormState>();
  final textEditingController = TextEditingController();

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  _initialize({String page}) async {
    page == null
        ? await _controller.fetchAllCharacters()
        : await _controller.fetchAllCharacters(page: page);
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
      title: const Text('All characters'),
      actions: [
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {
            _initialize();
            _controller.actualPage = 1;
          },
        )
      ],
    );
  }

  _buildBody() {
    if (_isLoading) return CircularLoading();

    if (_controller.appError != null)
      return CenteredMessage(message: _controller.appError.message);

    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSearchBar(),
          _buildListViewCharacters(),
          _buildNavigateSection(),
        ],
      ),
    );
  }

  SearchBar _buildSearchBar() {
    return SearchBar(
      onSaved: _controller.setSearchName,
      textEditingController: textEditingController,
      onPressed: _searchByName,
    );
  }

  _buildListViewCharacters() {
    return CharacterListView(
      itemBuilder: _buildCharacterCard,
      itemCount: _controller.itemCount,
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

  _buildNavigateSection() {
    return NavigateSection(
      totalPages: _controller.totalPages,
      actualPage: _controller.actualPage,
      previousPage: () {
        _initialize(page: _controller.previousPage);
        _controller.actualPage--;
      },
      nextPage: () {
        _initialize(page: _controller.nextPage);
        _controller.actualPage++;
      },
    );
  }

  _searchByName() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              CharacterResultSearch(searchName: _controller.searchName),
        ),
      );
      textEditingController.clear();
    }
  }
}
