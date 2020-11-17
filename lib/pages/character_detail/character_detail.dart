import 'package:flutter/material.dart';
import 'package:rick_and_morty/controllers/character_detail_controller.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/pages/character_detail/widgets/about_section.dart';
import 'package:rick_and_morty/pages/character_detail/widgets/origin_location.dart';
import 'package:rick_and_morty/shared/containers/centered_message.dart';
import 'package:rick_and_morty/shared/containers/character_image.dart';
import 'package:rick_and_morty/shared/containers/circular_loading.dart';
import 'package:rick_and_morty/shared/containers/custom_divider.dart';

class CharacterDetail extends StatefulWidget {
  final CharacterModel character;

  const CharacterDetail(this.character);

  @override
  _CharacterDetailState createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  final _controller = CharacterDetailController();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  _initialize() async {
    final _location = widget.character.origin.url.isEmpty
        ? widget.character.location.url.substring(32)
        : widget.character.origin.url.substring(32);

    await _controller.fetchLocation(_location);
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.character.name)),
      body: _buildBody(),
    );
  }

  _buildBody() {
    if (_isLoading)
      return CircularLoading(backgroundColor: Theme.of(context).primaryColor);
    if (_controller.appError != null)
      return CenteredMessage(message: _controller.appError.message);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildCharacterImage(),
          _buildCharacterDescription(),
        ],
      ),
    );
  }

  CharacterImage _buildCharacterImage() {
    return CharacterImage(
      imagePath: widget.character.image,
      height: 300,
      borderRadiusValue: 0.0,
    );
  }

  _buildCharacterDescription() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildAboutSection(),
          CustomDivider(),
          _buildOriginLocationSection(),
          CustomDivider()
        ],
      ),
    );
  }

  _buildAboutSection() {
    return AboutSection(
      status: widget.character.status,
      species: widget.character.species,
      gender: widget.character.gender,
      locationName: widget.character.location.name,
    );
  }

  _buildOriginLocationSection() {
    return OriginLocation(
      name: _controller.location.name,
      dimension: _controller.location.dimension,
      type: _controller.location.type,
    );
  }
}
