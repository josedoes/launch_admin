import 'package:code_learn/launch.dart';
import 'package:code_learn/view/widgets/common_padding.dart';
import 'package:code_learn/view/widgets/rocket_card.dart';
import 'package:code_learn/view/widgets/rocket_scaffold.dart';
import 'package:code_learn/view_models/fill_in_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../model/fill_in_the_blanks.dart';
import '../../module_play_view/widgets/base_box.dart';
import '../../module_play_view/widgets/success_action.dart';
import '../../widgets/base_button.dart';
import '../../widgets/buttons/toggle_button.dart';
import '../../widgets/tap_click.dart';

class FillInBlankView extends StatelessWidget {
  const FillInBlankView(
      {required this.onNext, required this.fillInTheBlank, super.key});

  final Function() onNext;
  final FillInTheBlanks fillInTheBlank;

  @override
  Widget build(BuildContext context) {
    return RocketScaffold(
      body: ViewModelBuilder<FillInModel>.reactive(
        viewModelBuilder: () =>
            FillInModel(onNext: onNext, fillInTheBlanks: fillInTheBlank),
        builder: (context, model, child) {
          return AppBackground(
            child: RocketScaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 38),
                  PaddingCommonMobile(
                    child: Text(
                      model.fillInTheBlanks.instruction,
                      style: quizTitleStyle,
                    ),
                  ),
                  const SizedBox(height: 32),
                  const FillInTheBlanksElement(),
                  const Spacer(),
                  const FillInOptions(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CodeChunk {
  const CodeChunk({
    required this.content,
    required this.isBlank,
    required this.index,
    required this.contentColor,
  });

  final bool isBlank;
  final String? content;
  final int index;
  final Color? contentColor;
}

class FillInput extends StatelessWidget {
  const FillInput({
    required this.options,
    required this.codeChunks,
    required this.selectedOptions,
    super.key,
  });

  final List<String> options;
  final List<CodeChunk> codeChunks;
  final List<String> selectedOptions;

  @override
  Widget build(BuildContext context) {
    return RocketCard(
      child: Column(
        children: [
          Text(
            'Fill in the blanks with the correct answers:',
            style: quizTitleStyle,
          ),
          const SizedBox(height: 34),
          CodeCardChunks(
            selectedOptions: selectedOptions,
            codeChunks: codeChunks,
          ),
          const Spacer(),
          CodeInputOptions(
            selectedOptions: selectedOptions,
            options: options,
          )
        ],
      ),
    );
  }
}

class CodeCardChunks extends StatelessWidget {
  const CodeCardChunks({
    required this.selectedOptions,
    required this.codeChunks,
    super.key,
  });

  final List<String> selectedOptions;
  final List<CodeChunk> codeChunks;

  @override
  Widget build(BuildContext context) {
    return RocketCard(
      child: Text.rich(
        TextSpan(
          children: [for (final code in codeChunks) getCodeElement(code)],
        ),
      ),
    );
  }

  InlineSpan getCodeElement(CodeChunk code) {
    if (code.isBlank) {
      if (code.index < selectedOptions.length) {
        return _value('value');
      } else {
        return _blank();
      }
    } else {
      return _content(code);
    }
  }

  ///when a blank has been filled
  TextSpan _value(String value) {
    return TextSpan(
      text: value,
      style: baseCodingStyle,
    );
  }

  TextSpan _content(CodeChunk code) {
    return TextSpan(
      text: code.content,
      style: TextStyle(
        color: code.contentColor,
      ),
    );
  }

  WidgetSpan _blank() {
    return WidgetSpan(
      child: Container(
        height: 20,
        width: 80,
        color: Colors.white.withOpacity(.3),
      ),
    );
  }
}

class CodeInputOptions extends StatelessWidget {
  const CodeInputOptions({
    required this.options,
    required this.selectedOptions,
    super.key,
  });

  final List<String> options;
  final List<String> selectedOptions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _divider,
        _actions,
        _actionButton,
      ],
    );
  }

  Widget get _actionButton => BaseButton(
        title: 'Check',
        onPressed: () {},
      );

  Widget get _actions => Wrap(
        children: [
          for (final option in options) box(option: option),
        ],
      );

  Widget box({required String option}) => Container(
        child: Text(
          option,
          style: poppins.copyWith(color: white),
        ),
        decoration: BoxDecoration(
          color: policeBlue,
          borderRadius: BorderRadius.circular(8),
        ),
      );

  Container get _divider => Container(
        color: primaryColor,
        height: 1,
      );
}

class FillInTheBlanksElement extends ViewModelWidget<FillInModel> {
  const FillInTheBlanksElement({
    super.key,
  });

  @override
  Widget build(BuildContext context, model) {
    return PaddingCommonMobile(
      child: RocketCard(
        color: const Color(0xff2B3275),
        child: Container(
          padding: const EdgeInsets.all(24),
          width: double.infinity,
          child: Text.rich(
            TextSpan(
              style: baseCodingStyle.copyWith(color: white),
              children: [
                for (final element in model.fillInTheBlanks.codeBlanksElements)
                  if (element.isText())
                    TextSpan(
                      text: element.content,
                      style: baseCodingStyle.copyWith(
                        color: element.color?.toColor() ?? white,
                      ),
                    )
                  else
                    getSpan(element, model)
              ],
            ),
          ),
        ),
      ),
    );
  }

  WidgetSpan getSpan(CodeBlanksElement element, FillInModel model) {
    for (int i = 0; i < model.selectedItems.length; i++) {
      if (element.index == i) {
        return WidgetSpan(
          child: OutlineBox(
            text: model.selectedItems[i].element,
            color: model.getOutlineColor(model.selectedItems[i], element),
            onTap: () =>
                model.onBlankTapped(model.selectedItems[element.index]),
          ),
        );
      }
    }

    return WidgetSpan(
      child: OutlineBox(
        onTap: () {},
        text: '',
      ),
    );
  }
}

class FillInOptions extends ViewModelWidget<FillInModel> {
  const FillInOptions({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
    FillInModel model,
  ) {
    if (model.checked && model.allAreCorrect()) {
      return SuccessAction(
        onPressed: model.onNext,
        message: 'Great work! keep it up',
      );
    }

    return BaseActionBox(
      child: PaddingCommonMobile(
        child: Column(
          children: [
            const SizedBox(height: 28),
            Row(
              children: [
                RocketMouseRegion(
                  child: IconButton(
                    onPressed: model.reset,
                    color: const Color(0xff1E2562),
                    icon: const Icon(
                      Icons.cleaning_services_outlined,
                      color: Color(0xff4AAAFB),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                RocketMouseRegion(
                  child: IconButton(
                    onPressed: model.removeLastItem,
                    color: const Color(0xff1E2562),
                    icon: const Icon(
                      Icons.refresh,
                      color: Color(0xff4AAAFB),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                for (int i = 0; i < model.possibleElements.length; i++)
                  ToggleButton(
                    label: model.possibleElements[i].element,
                    check: model.checked,
                    isCorrect: model.isCorrect(model.possibleElements[i]),
                    onPressed: () => model.selectAnElement(
                      SelectedElement(
                        orderItWasSelected: -1,
                        key: model.possibleElements[i].id,
                        element: model.possibleElements[i].element,
                      ),
                    ),
                    isSelected:
                        model.hintHasBeenSelected(model.possibleElements[i]),
                  )
              ],
            ),
            const SizedBox(height: 40),
            BaseButton(
              title: model.buttonTitle,
              onPressed: model.onButtonPressed,
              width: double.infinity,
            ),
            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}

class OutlineBox extends StatelessWidget {
  const OutlineBox({
    required this.onTap,
    this.text,
    this.color,
    super.key,
  });

  final Function() onTap;
  final String? text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 20,
        color: color ?? const Color(0xff42498F),
        padding: const EdgeInsets.symmetric(horizontal: 1),
        constraints: const BoxConstraints(minWidth: 40),
        child: Text(
          text ?? '',
          style: baseCodingStyle.copyWith(
            color: white,
          ),
        ),
      ),
    );
  }
}
