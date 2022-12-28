# WYWidgets

## CircularTextButton
- Auto resize circle to fit at inner text.
- Border line can be set.
- Background color can be set.
- ~~Font size can be set.~~ Not yet.
- Font color can be set.

**Usage example**
```
var body: some View {
    CircularTextButton("This is Button") {
        // Do something here -> button tap action
    }
    .tintColor(.black) // font color
    .setBackgroundColor(.gray) // background color
    .stroke(.black, lineWidth: 2) // stroke
    .textPadding(10) // padding between text, circle inner line
}
```
### Result

![Simulator Screen Shot - iPhone 14 Pro - 2022-12-28 at 10 18 41](https://user-images.githubusercontent.com/50979183/209742737-c8c9fb56-c64a-4fed-8aa4-a0f8d4ffff7d.png)


## IntroSlider

## TabCountBar
