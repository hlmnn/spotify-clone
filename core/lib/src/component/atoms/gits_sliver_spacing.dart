import 'package:flutter/material.dart';

class GitsSliverSpacing extends StatelessWidget {
  const GitsSliverSpacing.vertical({
    Key? key,
    required this.size,
  })  : axis = Axis.vertical,
        super(key: key);
  const GitsSliverSpacing.vertical4({Key? key})
      : size = 4,
        axis = Axis.vertical,
        super(key: key);
  const GitsSliverSpacing.vertical8({Key? key})
      : size = 8,
        axis = Axis.vertical,
        super(key: key);
  const GitsSliverSpacing.vertical12({Key? key})
      : size = 12,
        axis = Axis.vertical,
        super(key: key);
  const GitsSliverSpacing.vertical16({Key? key})
      : size = 16,
        axis = Axis.vertical,
        super(key: key);
  const GitsSliverSpacing.vertical20({Key? key})
      : size = 20,
        axis = Axis.vertical,
        super(key: key);
  const GitsSliverSpacing.vertical24({Key? key})
      : size = 24,
        axis = Axis.vertical,
        super(key: key);
  const GitsSliverSpacing.vertical28({Key? key})
      : size = 28,
        axis = Axis.vertical,
        super(key: key);
  const GitsSliverSpacing.vertical32({Key? key})
      : size = 32,
        axis = Axis.vertical,
        super(key: key);
  const GitsSliverSpacing.vertical36({Key? key})
      : size = 36,
        axis = Axis.vertical,
        super(key: key);
  const GitsSliverSpacing.vertical40({Key? key})
      : size = 40,
        axis = Axis.vertical,
        super(key: key);
  const GitsSliverSpacing.vertical44({Key? key})
      : size = 44,
        axis = Axis.vertical,
        super(key: key);
  const GitsSliverSpacing.vertical48({Key? key})
      : size = 48,
        axis = Axis.vertical,
        super(key: key);
  const GitsSliverSpacing.vertical52({Key? key})
      : size = 52,
        axis = Axis.vertical,
        super(key: key);
  const GitsSliverSpacing.vertical56({Key? key})
      : size = 56,
        axis = Axis.vertical,
        super(key: key);
  const GitsSliverSpacing.vertical60({Key? key})
      : size = 60,
        axis = Axis.vertical,
        super(key: key);
  const GitsSliverSpacing.vertical64({Key? key})
      : size = 64,
        axis = Axis.vertical,
        super(key: key);
  const GitsSliverSpacing.vertical68({Key? key})
      : size = 68,
        axis = Axis.vertical,
        super(key: key);
  const GitsSliverSpacing.vertical72({Key? key})
      : size = 72,
        axis = Axis.vertical,
        super(key: key);
  const GitsSliverSpacing.vertical76({Key? key})
      : size = 76,
        axis = Axis.vertical,
        super(key: key);
  const GitsSliverSpacing.vertical80({Key? key})
      : size = 80,
        axis = Axis.vertical,
        super(key: key);

  const GitsSliverSpacing.horizontal({
    Key? key,
    required this.size,
  })  : axis = Axis.horizontal,
        super(key: key);
  const GitsSliverSpacing.horizontal4({Key? key})
      : size = 4,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSliverSpacing.horizontal8({Key? key})
      : size = 8,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSliverSpacing.horizontal12({Key? key})
      : size = 12,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSliverSpacing.horizontal16({Key? key})
      : size = 16,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSliverSpacing.horizontal20({Key? key})
      : size = 20,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSliverSpacing.horizontal24({Key? key})
      : size = 24,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSliverSpacing.horizontal28({Key? key})
      : size = 28,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSliverSpacing.horizontal32({Key? key})
      : size = 32,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSliverSpacing.horizontal36({Key? key})
      : size = 36,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSliverSpacing.horizontal40({Key? key})
      : size = 40,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSliverSpacing.horizontal44({Key? key})
      : size = 44,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSliverSpacing.horizontal48({Key? key})
      : size = 48,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSliverSpacing.horizontal52({Key? key})
      : size = 52,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSliverSpacing.horizontal56({Key? key})
      : size = 56,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSliverSpacing.horizontal60({Key? key})
      : size = 60,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSliverSpacing.horizontal64({Key? key})
      : size = 64,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSliverSpacing.horizontal68({Key? key})
      : size = 68,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSliverSpacing.horizontal72({Key? key})
      : size = 72,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSliverSpacing.horizontal76({Key? key})
      : size = 76,
        axis = Axis.horizontal,
        super(key: key);
  const GitsSliverSpacing.horizontal80({Key? key})
      : size = 80,
        axis = Axis.horizontal,
        super(key: key);

  final double size;
  final Axis axis;

  @override
  Widget build(BuildContext context) {
    return axis == Axis.horizontal
        ? SliverToBoxAdapter(child: SizedBox(width: size))
        : SliverToBoxAdapter(child: SizedBox(height: size));
  }
}
