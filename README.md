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

<img src="https://user-images.githubusercontent.com/50979183/209742737-c8c9fb56-c64a-4fed-8aa4-a0f8d4ffff7d.png" width="300" height="600"/>



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
<img src="https://user-images.githubusercontent.com/50979183/210099120-ec84556c-323f-4dd2-b060-08ebab1b9038.png" width="300" height="600"/> <img src="https://user-images.githubusercontent.com/50979183/210099126-4decdb83-5966-49f8-afef-d0474455d72a.png" width="300" height="600"/> <img src="https://user-images.githubusercontent.com/50979183/210099129-d6461759-4373-447a-935a-642ad55fe585.png" width="300" height="600"/>

## SafeAreaPadding
- For developers whose project's target iOS version < 17.0
**Usage example**
```
ZStack {
    Color.blue.ignoresSafeArea()
    VStack {
        Text("Hello World")
        Spacer()
    }
    .safeAreaPadding()
}
```

## RoundedTextButton
- text: String main text string
- caption: String caption text string
- action: () -> Void button tap action
- alignment: HorizontalAlignment -> default: .center text alignment in button
- backgroundColor: Color -> default: .blue background color
- fontColor: Color -> default: .white main text color
- captionColor: Color -> default: .gray caption text color
- scale: RoundedTextButtonScale -> default: .fit .fit, .fill(Bool) whether you want to fill button width to parent view or not
- font: Font -> default: .headline main text font
- captionFont: Font -> default: .caption caption text font
- cornerRadius: CGFloat -> default: 10 button corner radius value
    
**Usage example**
```
RoundedTextButton("Test Text", caption: "Hello world") { // caption removable
    print("Button Tapped")
}
.scaleMode(.fit) // default: .fit
```

### Result
![스크린샷 2024-09-09 오전 1 56 47](https://github.com/user-attachments/assets/b2a17a4e-e334-4c82-b056-c11712b2e44f)

