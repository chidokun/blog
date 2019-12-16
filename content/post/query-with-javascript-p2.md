---
title: "Tuyệt chiêu truy vấn với JavaScript (Phần 2)"
slug: query-with-javascript-p2
date: 2019-12-11T22:13:33+07:00
categories:
- programming
keywords:
- javascript
- thống kê
tags:
- javascript
- programming
- tips
comments: true
draft: true
thumbnailImage: https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/JavaScript-logo.png/240px-JavaScript-logo.png
thumbnailImagePosition: left
---

Ở phần 1, mình đã giới thiệu một số cách dùng JavaScript để truy vấn thống kê trên 1 tập dữ liệu. Tiếp tục phần này, mình sẽ giới thiệu thêm một số cách dùng JavaScript để giải quyết một số vấn đề thường gặp liên quan đến mối quan hệ giữa nhiều tập dữ liệu nhé.

<!--more-->

<!--toc-->

Lần này, chúng ta sử dụng các tập dữ liệu mã số sinh viên sau:

{{< codeblock js>}}
let data1 = [
	"160706400000502",
	"160922005010007",
	"160830020001505",
	"170920002006001",
	"160824003001503",
	"160925005004023",
	"160824700001510",
	"170929000806002",
	"160927900006001",
	"160823000701002"
];

let data2 = [
	"170413006008003",
	"170914000806002",
	"170922020006001",
	"160922005010007",
	"160927900006001",
	"160823000701002",
	"160825900002003",
	"170815700006009",
	"160925005004023",
	"170413000029003"
];

let data3 = [
	"160927900006001",
	"160823000701002",
	"160830020001505",
	"170920002006001",
	"160824700001510",
	"170929000806002",
	"160824003001503",
	"160925005004023"	
]

let data4 = [
	"181005009007138", 
	"181005070009679", 
	"181005070009681", 
	"181023900003987", 
	"181107500003264"
]
{{< /codeblock >}}

Mục tiêu là tìm ra mối liên hệ giữa các tập dữ liệu. Trong thực tế có thể bạn sẽ gặp những tình huống mà cần phải tìm ra mối liên hệ của những tập dữ liệu hàng trăm, hàng nghìn dòng thì JavaScript vẫn đáp ứng được.

Trước hết cùng nhận xét "nhẹ" về tập dữ liệu nhé:

- Mã số sinh viên ở dạng số có cùng format là 15 chữ số. Nhìn 2 chữ số đầu có thể bạn sẽ đoán được đây là năm khai khóa chẳng hạn.
- Số lượng mẫu:

```js
data1.length
// 10
data2.length
// 10
data3.length
// 8
data4.length
// 5
```

# 1. Tìm giao của 2 danh sách


# 3. Tìm phần bù

# 4. Kết luận

...

Nếu các bạn biết thêm về các thủ thuật khác thì có thể chia sẻ với mình thông qua bình luận bên dưới nhé.

## Tham khảo


