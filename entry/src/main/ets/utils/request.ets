import http from '@ohos.net.http';
import RequestMethod from '@ohos.net.http';
import ResponseCode from '@ohos.net.http';

let httpRequest = http.createHttp();

export function getData() {
  return httpRequest.request(
    "https://api.vvhan.com/api/weather?city=上海市&type=week",
    {
      method: RequestMethod.RequestMethod.GET, // 设置请求方法
      header: {
        'Content-Type': 'application/json' // 添加Header，header 默认值就是application/json
      },
      readTimeout: 15000, // 超时时间
      connectTimeout: 15000, // 超时时间
    },
    (error, data) => {
      if (!error) {
        console.log("sadsada", data)
        return data
      }

    }
  )
}