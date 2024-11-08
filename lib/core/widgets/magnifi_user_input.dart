// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:magnifi_ally/core/constants/colors.dart';
//
// class PersonalInputSection extends StatefulWidget {
//   const PersonalInputSection(
//       {this.sendMessage,
//       this.talkToPersonalKey,
//       super.key,
//       this.conversationTab = false,
//       this.onPastConversationsTap,
//       this.hintText,
//       this.currentNewsLetter});
//
//   final void Function(String? msg)? sendMessage;
//   final GlobalKey? talkToPersonalKey;
//   final Function? onPastConversationsTap;
//   final bool conversationTab;
//   final String? hintText;
//   final String? currentNewsLetter;
//
//   @override
//   State<PersonalInputSection> createState() => _PersonalInputSectionState();
// }
//
// class _PersonalInputSectionState extends State<PersonalInputSection> {
//   bool showAnimationKit = true;
//   FocusNode focusNode = FocusNode();
//
//   void updateAnimationStats() {}
//
//   @override
//   void initState() {
//     widget.controller.addListener(() {
//       if (mounted) {
//         setState(() => showAnimationKit =
//             widget.controller.text.isEmpty && !focusNode.hasFocus);
//       }
//     });
//     focusNode.addListener(() {
//       if (mounted) {
//         setState(() {
//           showAnimationKit =
//               widget.controller.text.isEmpty && !focusNode.hasFocus;
//         });
//       }
//     });
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     widget.controller.removeListener(() {});
//     focusNode.removeListener(() {});
//     focusNode.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Builder(
//           builder: (context) {
//             return ConstrainedBox(
//               constraints: const BoxConstraints(minHeight: 52),
//               child: LayoutBuilder(builder: (context, constraints) {
//                 return Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     Container(
//                       height: 70,
//                       color: MagnifiColorPalette.primary.bronze.v400,
//                     ),
//                     Container(
//                       key: widget.talkToPersonalKey,
//                       width: constraints.maxWidth,
//                       margin: const EdgeInsets.all(8.0),
//                       padding: EdgeInsets.zero,
//                       decoration: BoxDecoration(
//                         color: MagnifiColorPalette.primary.neutral.v0,
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(8.0)),
//                       ),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Expanded(
//                             child: Stack(
//                               children: [
//                                 TextFormField(
//                                   focusNode: focusNode,
//                                   onFieldSubmitted: (message) {
//                                     hideKeyboard();
//                                     if (message.isNotEmpty &&
//                                         message.trim().isNotEmpty) {
//                                       if (widget.sendMessage != null) {
//                                         widget.sendMessage!(message);
//                                       } else {
//                                         // context
//                                         //     .read<PersonalBloc>()
//                                         //     .add(SendMessage(message));
//                                       }
//                                     }
//                                   },
//                                   onEditingComplete: () {},
//                                   onTap: updateAnimationStats,
//                                   onTapOutside: (event) =>
//                                       updateAnimationStats(),
//                                   scrollPhysics:
//                                       const AlwaysScrollableScrollPhysics(),
//                                   onChanged: (value) {},
//                                   controller: widget.controller,
//                                   textInputAction: TextInputAction.send,
//                                   decoration: InputDecoration(
//                                     prefixIcon: const AdaptiveImage.asset(
//                                       "assets/magnifi_pulse.svg",
//                                       width: 70,
//                                       height: 30,
//                                       placeholder:
//                                           assetMentorNotificationsDefaultIcon,
//                                     ),
//                                     prefixIconConstraints:
//                                         newsLetterViewLevels.isNotEmpty
//                                             ? const BoxConstraints(maxHeight: 0)
//                                             : null,
//                                     border: InputBorder.none,
//                                     hintText: newsLetterViewLevels.isNotEmpty
//                                         ? 'Ask a question about your research subscriptions'
//                                         : widget.hintText ?? 'Ask Magnifi',
//                                     hintStyle: textStyleFourteen.copyWith(
//                                       color: MagnifiColorPalette
//                                           .primary.offWhite.v600,
//                                       fontWeight: FontWeight.w400,
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                     suffixText:
//                                         widget.hintText != null ? '"' : "",
//                                     contentPadding: newsLetterViewLevels.isEmpty
//                                         ? const EdgeInsets.all(12)
//                                         : const EdgeInsets.fromLTRB(
//                                             5, 12, 12, 12),
//                                   ),
//                                   maxLines: 1,
//                                   showCursor: true,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const Gap(16),
//                           GestureDetector(
//                             onTap: () {
//                               if (widget.controller.text.isNotEmpty &&
//                                   widget.controller.text.trim().isNotEmpty) {
//                                 if (widget.sendMessage != null) {
//                                   widget.sendMessage!(widget.controller.text);
//                                 }
//                                 //hide keyboard
//                               }
//                             },
//                             child: Container(
//                               height: 34,
//                               width: 34,
//                               margin: const EdgeInsets.only(right: 8.0),
//                               padding: const EdgeInsets.all(8.0),
//                               decoration: BoxDecoration(
//                                   color:
//                                       MagnifiColorPalette.primary.neutral.v900,
//                                   borderRadius: BorderRadius.circular(4.0)),
//                               child: Assets.personal.sendTextFilled.svg(
//                                 color: MagnifiColorPalette.primary.neutral.v0,
//                                 height: 1,
//                                 width: 1,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 );
//               }),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
