import router from '@ohos.router'

@Entry
@Component
struct Index {
  @State location: string = "上海市，静安区"
  @State time: string = "20:09"
  @State columns: Array<object> = [{ title: '空气质量', value:
  '62' }, { title: '风速', value:
  '北风 1级' }, { title: '湿度', value:
  '64%' }, { title: '能见度', value:
  '13.2 公里' }, { title: '气压', value:
  '1037 hPa' }, { title: '露点', value:
  '-7 °' }]
  @State temperature: string = '1'
  @State feelTemperature: string = '-7'

  build() {
    Column() {
      Row() {
        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Image($r("app.media.logo")).height("100%")
          Radios()
        }.height("100%")
      }.width("100%").height(80).backgroundColor("rgb(29,40,50)").padding(10)

      Row() {
        Scroll() {
          Column() {
            Location({ location: this.location })
            Row() {
              Text(this.time) // 子组件的高度小于Scroll高度，不会触发滚动
                .fontSize(20)
                .size({ width: "100%", height: 40 }).fontColor('#f0f0f0')

            }

            Weather({ Temperature: this.temperature, FeelTemperature: this.feelTemperature })

            ItemComponent({ list: this.columns })

            Card({ leftTitle: '10 日预告', rightTitle: '每小时预报 >' }) {
              Text('添加子组件aaa') // 添加子组件
                .fontSize(20)
                .backgroundColor(Color.Pink)
            }

            Card({ leftTitle: '日出日落和月相' }) {
              Text('添加子组件aaa') // 添加子组件
                .fontSize(20)
                .backgroundColor(Color.Pink)
            }

          }
          // .backgroundColor('#aabbcc')
          .padding(10)

        }.width("100%")
      }.width('100%').backgroundImage($r('app.media.CloudyNight')).backgroundImageSize({ width: "100%" })

    }.width("100%")
  }
}


@Component
struct ItemComponent {
  list: Array<object> = []

  build() {
    Row() {
      Grid() {
        ForEach(this.list, (item) => { // ForEach语法，循环创建GridItem
          GridItem() { // 子组件只能是GirdItem
            Flex({
              direction: FlexDirection.Column,
              justifyContent: FlexAlign.Center,
              alignItems: ItemAlign.Center
            }) {
              Column() {
                Row() {
                  Text(item.title + " >")
                    .fontSize(20)
                    .fontColor(Color.White)
                    .opacity(0.8)
                    .width('100%')
                    .margin({ bottom: 10 })
                }

                if (item.title === "空气质量") {
                  Row() {
                    Circle()
                      .width(10)
                      .height(10)
                      .strokeWidth(3)
                      .fill(Color.Green)
                      .margin({ right: 5 })
                    Text(item.value)
                      .fontSize(20).fontWeight(700).fontColor(Color.White)
                  }.width("100%")
                } else {
                  Text(item.value)
                    .fontSize(20).fontWeight(700).fontColor(Color.White)
                    .width('100%')
                }
              }

            }
          }
        })
      }
      .height(150)
      .columnsTemplate("1fr 1fr 1fr") // 设置Grid为3列，并且均分
      .columnsGap(0) // 设置列间距为10vp
      .rowsGap(15) // 设置行间距为10vp
      .width('100%')
      .margin({ top: 20 })
    }
  }
}

@Component
struct Location {
  location: string = ''

  build() {
    Row() {
      Text(this.location) // 子组件的高度小于Scroll高度，不会触发滚动
        .fontSize(24)
        .size({ width: "100%", height: 40 }).fontColor('#fff')

    }
  }
}

@Component
struct Weather {
  Temperature: string = '1'
  FeelTemperature: String = '-6'

  build() {
    Row() {
      Image($r("app.media.ClearNight")).height(80).margin({ right: 30 })
      Text(this.Temperature).fontSize(60).fontColor("#fff")
      Text("°C").fontSize(50).fontColor("#fff").margin({ right: 20 })
      Column() {
        Flex({
          direction: FlexDirection.Column,
          alignContent: FlexAlign.Start
        }) {
          Text("晴朗").fontSize(30).fontColor("#fff").fontWeight(700)
          Text(`体感温度 ${this.FeelTemperature}°`).fontSize(20).fontColor("#fff")
        }

      }

    }.width("100%")
  }
}

@Component
struct Card {
  leftTitle: string = ''
  rightTitle: string = ''
  @BuilderParam child: () => {}

  build() {
    Column() {
      Row() {
        Flex({
          direction: FlexDirection.Row,
          justifyContent: FlexAlign.SpaceBetween,
          alignItems: ItemAlign.Center
        }) {
          Text(this.leftTitle).fontSize(22).fontColor("#ffffff").fontWeight(700)
          if (this.rightTitle) {
            Text(this.rightTitle).fontSize(20).fontColor("#a1b5d0").onClick(() => {
              // 跳转详情页
            })
          }

        }.padding({ left: 20, right: 20 })
      }
      .height(50)
      .width("100%")
      .border({
        width: { bottom: 1 },
        color: '#ffffff',
        style: BorderStyle.Solid,
      })

      Row() {
        this.child()
      }.width("100%").height(20)
    }
    .width("100%")
    .height(300)
    .backgroundColor("#fff")
    .opacity(0.15)
    .borderRadius(10)
    .margin({ bottom: 10 })
  }
}

@Component
struct Radios {
  @State isCel: boolean = true

  build() {
    Row() {
      if (this.isCel) {
        Text("°F")
          .width("50%")
          .fontSize(20)
          .height("100%")
          .textAlign(TextAlign.Center)
          .fontColor(Color.White)
          .onClick(() => {
            this.isCel = false
          })
        Text("°C")
          .width("50%")
          .fontSize(20)
          .height("100%")
          .textAlign(TextAlign.Center)
          .active()
          .onClick(() => {
            this.isCel = true
          })
      }
      if (!this.isCel) {
        Text("°F")
          .width("50%")
          .fontSize(20)
          .height("100%")
          .textAlign(TextAlign.Center)
          .active()
          .onClick(() => {
            this.isCel = false
          })
        Text("°C")
          .width("50%")
          .fontSize(20)
          .height("100%")
          .textAlign(TextAlign.Center)
          .fontColor(Color.White)
          .onClick(() => {
            this.isCel = true
          })
      }

    }.width(100).height(40).backgroundColor(Color.Gray).borderRadius(4)
  }
}

@Extend(Text) function active() {
  .backgroundColor(Color.White).borderRadius(4).fontColor(Color.Black).fontWeight(700)
}