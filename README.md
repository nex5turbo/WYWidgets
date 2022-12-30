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
**Usage example**
```
@State var introSliderPresent = false
var body: some View {
    VStack {
        // your view
    }
    .onAppear {
        introSliderPresent = true
    }

    .fullScreenCover(isPresented: $introSliderPresent) {
        IntroSlider(items: [
            IntroSliderItem(backgroundColor: .yellow, title: "Hello World!", content: "This is Hello Yellow Page!"),
            IntroSliderItem(backgroundColor: .red, title: "Hello World!", content: "This is Hello Red Page!"),
            IntroSliderItem(backgroundColor: .green, title: "Hello World!", content: "This is Hello Green Page!")
        ])
    }
}
```
### Result
<img src="https://user-images.githubusercontent.com/50979183/210099120-ec84556c-323f-4dd2-b060-08ebab1b9038.png" width="200" height="400"/> <img src="https://user-images.githubusercontent.com/50979183/210099126-4decdb83-5966-49f8-afef-d0474455d72a.png" width="200" height="400"/> <img src="https://user-images.githubusercontent.com/50979183/210099129-d6461759-4373-447a-935a-642ad55fe585.png" width="200" height="400"/>

## TabCountBar
