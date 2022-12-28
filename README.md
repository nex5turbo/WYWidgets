# WYWidgets

## CircularTextButton
- Auto resize circle to fit at inner text.
- Border line can be set.
- Background color can be set.
- ~~Font size can be set.~~ Not yet.
- Font color can be set.

** Usage example **
```
var body: some View {
    CircularTextButton("This is Button") {
        // Do something here -> button tap action
    }
    .tintColor(.black) // font color
    .setBackgroundColor(.white) // background color
    .stroke(.green, lineWidth: 2) // stroke
    .textPadding(3) // padding between text, circle inner line
}
```
## IntroSlider

## TabCountBar
