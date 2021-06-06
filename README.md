<h1  align="left"> IGProgress Lottie - Swift </h1>


Manager of progress using Lottie JSON,  simple implemetation for your project Xcode.


## Important Info:  
#### Create folder into project:

- For example MyJson.
- Add your json animation lottie. You can get it https://lottiefiles.com/

<h1 align="left">Implementation </h1>

#### Code:  
```swift
      import IGLottieProgress

```

```swift
      //Insert your json resource into project.
        IGProgress.config.urlLottieJson = "YOUR JSON LOTTIE NAME"
        // Set a time out for finish process.
        IGProgress.config.timer = 8
        //End your progress loading in any func
        self.IGPStartLoading(config: IGProgress.config) // <--- Start the progress

```



#### Start Progress:  

```swift
self.IGPStartLoading(config: IGProgress.config)

```

#### Remove progress:  

```swift
self.IGPFinishLoading()
```

# Option table:  

| Config | Type | Description |
| --- | --- | --- |
| urlLottieJson | String | Insert your json resource into project. |
| timer | Int | Set a time out for finish process. |
| message | String | Do your need add any message use this option |
| sizeTextMessage | CGFloat | Resize the text message |
| fontColorMessage |  UIColor |Change color text message |
| backgroundColor |UIColor | Set color background for your windows. |
| alpha |CGFloat | Set apha color for windows, this normal is 0.5 |
| contentMode | UIView.ContentMode  |If do you need scale the animation use content mode |
| hight | Int| Set new size hight |
| width |Int | Set new size width |
| animationSpeed | CGFloat | Animation speed |



#### Example View:  

<p align="center">

|||
|:----:|:----:|
|<img  height="568" width="320" src="https://github.com/LordSaac/IGProgressLottie-Swift/blob/main/IGLottieProgress/img/Simulator%20Screen%20Shot%20-%20iPhone%20SE%20(2nd%20generation)%20-%202021-05-11%20at%2020.21.00.png">|<img  height="568" width="320" src="https://github.com/LordSaac/IGProgressLottie-Swift/blob/main/IGLottieProgress/img/Simulator%20Screen%20Shot%20-%20iPhone%20SE%20(2nd%20generation)%20-%202021-05-11%20at%2020.21.17.png">|
</p>



# Cocoa Pod


```
pod 'IGLottieProgress'
```

# Contribution

You are most welcome to contribute to this project!

*  Buy me a  [Coffee](https://paypal.me/LordSaac?locale.x=es_XC)  &nbsp; :coffee:

*  Give me a [Star](https://github.com/LordSaac/ProgressLottieIGB) &nbsp; :star:



# Android version:

:eight_spoked_asterisk: &nbsp; Do you need Android Version for you project ?, check out here: https://github.com/LordSaac/ProgressLottieIGB

# Download more Animations:

See more animations here: https://www.lottiefiles.com/

<br>
<h2>Released May 12, 2021</h2>

## Licence

Copyright 2021 Isaac G. Banda

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


