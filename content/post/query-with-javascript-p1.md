---
title: "Tuyệt chiêu truy vấn với JavaScript (Phần 1)"
slug: query-with-javascript-ep1
date: 2019-12-13T22:11:33+07:00
categories:
- programming
keywords:
- javascript
- query
tags:
- javascript
- programming
- tips
comments: true
---

Một ngày đẹp trời nọ, sếp giao một cục dữ liệu và yêu cầu bạn truy vấn, thống kê đơn giản một vài thứ hay thậm chí là chế biến, xào nấu lại dữ liệu. Có rất nhiều công cụ có thể giúp bạn làm việc này như Excel chẳng hạn. Không may, bạn là một developer chỉ ăn ngủ với code chứ chưa đụng vào Excel bao giờ. Tuy nhiên, nếu có một chút kỹ năng JavaScript, bạn cũng có thể thực hiện việc này một cách dễ dàng và nhanh chóng.

<!--more-->

<!--toc-->

# 1. Tại sao lại là JavaScript?

JavaScript cung cấp các hàm xử lý mảng rất hiệu quả và hữu ích. Hơn nữa, việc có thể sử dụng các hàm này ngay trên DevTool của trình duyệt cũng khiến cho thao tác của bạn nhanh hơn và dễ hơn. Trong bài này, mình sẽ hướng dẫn bạn thực hiện một số thao tác truy vấn, thống kê dùng các hàm xử lý mảng của JavaScript. Bài viết này không giới thiệu 

Giả sử mình có một tập dữ liệu sinh viên đơn giản, mỗi sinh viên có các thuộc tính:

- *id*: Mã số sinh viên
- *name*: Họ và tên sinh viên
- *school*: Trường đại học
- *gpa*: Điểm trung bình

Nào bắt đầu thôi :D

Trước hết, mở DevTool của trình duyệt và khai báo dữ liệu nhé!

{{< codeblock js>}}
let data = [ 
    {
        id: "00001",
        name: "Nguyễn Văn A",
        school: "BKU",
        gpa: 9.7
    },{
        id: "00002",
        name: "Nguyễn Thị B",
        school: "UIT",
        gpa: 7.56
    },{
        id: "00003",
        name: "Bành Văn Bưởi",
        school: "KHTN",
        gpa: 8.54
    },{
        id: "00004",
        name: "Công Tằn Tôn Nữ Thị Rằn Ri",
        school: "UIT",
        gpa: 6.5
    },{
        id: "00005",
        name: "Bành Thị Mận",
        school: "BKU",
        gpa: 7.3 
    },{
        id: "00006",
        name: "Nguyễn Thị Mau Ra",
        school: "NV",
        gpa: 9.2
    },{
        id: "00007",
        name: "Công Tôn Sách",
        school: "KHTN",
        gpa: 7.8
    },{
        id: "00008",
        name: "Phở Thị Hủ Tiếu",
        school: "BKU",
        gpa: 6.15
    },{
        id: "00009",
        name: "Bèo Văn Bọt",
        school: "UIT",
        gpa: 4.3
    },{
        id: "00010",
        name: "Đồng Hồ Cát",
        school: "UIT",
        gpa: 9.5
    },
]
{{< /codeblock >}}

Sau khi khai báo xong, ta đã có biến `data` chứa dữ liệu.

{{< image classes="fancybox center" src="/images/post/query-with-javascript-ep1-1.png" title="Xem giá trị một biến trong DevTool" >}}

{{< alert info >}}
Có thể sử dụng `console.table()` để show dữ liệu dạng bảng
{{< /alert >}}

{{< image classes="fancybox center" src="/images/post/query-with-javascript-ep1-2.png" title="Xem giá trị dữ liệu dạng bảng" >}}

# 2. Lọc và đếm các phần tử với điều kiện

Yêu cầu đầu tiên: *Tìm các học sinh đến từ trường UIT*.

Với yêu cầu này, bạn có thể lọc ra các phần tử có thuộc tính `school == "UIT"` bằng cách sử dụng hàm `filter()`. Tham số đầu vào là một hàm trả về điều kiện nhận, cùng thử nào!

```js
data.filter(function (element) {
    return element.school == "UIT";
});
```

Hoặc có thể viết gọn hơn dùng cú pháp của `arrow function`.

```js
data.filter((e) => e.school == "UIT");
```

Yêu cầu: *Đếm các học sinh đến từ trường UIT*.

Tương tự, bạn lọc ra các phần tử có thuộc tính `school == "UIT"` và sau đó sử dụng thuộc tính `length` để đếm số lượng.

```js
data.filter((e) => e.school == "UIT").length;
```

Cùng thử những điều kiện phức tạp hơn nhé.

Yêu cầu: *Tìm các học sinh đến từ trường UIT mà có điểm >= 5.0*.

Đơn giản chỉ việc thêm điều kiện `gpa >= 5.0` vào.

```js
data.filter((e) => e.school == "UIT" && e.gpa >= 5.0);
```

Yêu cầu: *Tìm các học sinh có điểm >= trung bình cộng của danh sách học sinh*.

Ở đây chúng ta cần tính trung bình cộng `gpa` của danh sách rồi dùng `filter()` để lọc lấy tập dữ liệu mong muốn.

Có thể tính trung bình cộng bằng cách cộng tất cả `gpa`, sau đó chia cho `length`. Phương thức `reduce()` có thể giúp chúng ta tính tổng `gpa` nhanh. Phương thức này dùng để thực thi một hàm lên từng phần tử và một biến tích lũy để thu về một giá trị duy nhất. Tham số đầu vào của `reduce()` là *hàm thực thi* và *giá trị khởi tạo*. Trong *hàm thực thi*, tham số đầu tiên là *biến cộng dồn*, còn lại là phần tử của mảng.

```js
let avgGpa = data.reduce((acc, currElement) => acc + currElement.gpa, 0) / data.length;
// Biến `acc` là biến cộng dồn.
// Biến currElement là phần tử hiện tại của mảng.
// Tham số cuối là 0, biểu thị cho giá trị khởi tạo.
// Hàm thực thi ở đây sẽ cộng biến cộng dồn với `gpa` của mỗi phần tử để ra tổng `gpa`.
// Sau đó chia cho `length` để lấy kết quả trung bình cộng `gpa`.
```

Vậy chúng ta có thể thực hiện yêu cầu trên như sau:

```js
data.filter((e) => e.gpa >= (data.reduce((a, c) => a + c.gpa, 0) / data.length));
```

Túm lại là:

{{< alert info >}}
- Bạn có thể dùng `filter()` để lọc lấy dữ liệu với một điều kiện cụ thể.
- Dùng `length` để lấy số lượng phần tử.
- Dùng `reduce()` khi muốn tính toán ra 1 giá trị duy nhất dựa trên tất cả các phần tử.
{{< /alert >}}

# 3. Biến đổi phần tử

Yêu cầu: *Lấy mã sinh viên của những sinh viên BKU*

Chúng ta sẽ lọc ra sinh viên có `school == "BKU"` trước và sau đó lấy ra `id` bằng phương thức `map()`. Phương thức này giúp tạo ra một mảng mới với các phần tử là kết quả từ việc thực thi một hàm lên từng phần tử của mảng được gọi. Tham số đầu vào của `map()` là một hàm thực thi việc biến đổi dữ liệu cho mỗi phần tử.

```js
data.filter((e) => e.school == "BKU").map((f) => f.id);
```

Yêu cầu: *Lấy mã sinh viên và tên của những sinh viên BKU*

Ở yêu cầu trước chỉ trả về `id`, yêu cầu này chúng ta sẽ trả về một object có 2 thuộc tính là `id` và `name`.

```js
data.filter((e) => e.school == "BKU").map((f) => ({ id: f.id, name: f.name }));
```

{{< alert info >}}
- Dùng `map()` để biến đổi dữ liệu bạn nhé.
- Có thể dùng với `filter()` để lọc và biến đổi giá trị cho phù hợp.
{{< /alert >}}

# 4. Tìm ra các phần tử phân biệt

# 5. Kết luận

Bài viết cũng khá dài rồi nên mình tạm dừng ở đây nhé. Trong phần tiếp theo mình sẽ hướng dẫn một số thủ thuật thú vị nữa để truy vấn và thống kê với JavaScript.

Nếu các bạn biết thêm về các thủ thuật khác thì hãy chia sẻ với mình thông qua bình luận bên dưới nhé.

## Tham khảo

- [Array.prototype.filter()](https://developer.mozilla.org/vi/docs/Web/JavaScript/Reference/Global_Objects/Array/filter)
- [Array.length](https://developer.mozilla.org/vi/docs/Web/JavaScript/Reference/Global_Objects/Array/%08length)
- [Array.prototype.reduce()](https://developer.mozilla.org/vi/docs/Web/JavaScript/Reference/Global_Objects/Array/Reduce)
- [Array.prototype.map()](https://developer.mozilla.org/vi/docs/Web/JavaScript/Reference/Global_Objects/Array/map)

