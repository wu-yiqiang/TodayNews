import router from '@ohos.router'
@Entry
@Component
struct Index {

  build() {
    Row() {
      Flex({direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems:ItemAlign.Center}) {
        Image($r("app.media.logo")).height("100%")
        Button("wendu").onClick((event: ClickEvent) => {

        })
      }
    }.width("100%").height(80).backgroundColor(Color.Gray).padding(10)
  }
}