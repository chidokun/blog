---
title: "Những điều thú vị của số nhị phân"
slug: useful-things-of-binary-numbers
date: 2020-01-4T18:00:00+07:00
categories:
- programming
keywords:
- programming
- nhị phân
- binary
- phép toán trên bit
tags:
- programming
comments: true
draft: false
thumbnailImage: /thumbnails/binary-number.png
thumbnailImagePosition: left
---

Xin giới thiệu đến các bạn một số điều hữu ích về số nhị phân mà mình đã từng đọc trong cuốn *Write Great Code - Volume 1. Understanding the Machine* của tác giả *Randall Hyde*. Đây cũng là một quyển sách khá hay mà các bạn có thể đọc để trau dồi thêm kiến thức.

<!--more-->

<!--toc-->

# 1. Hệ nhị phân

Một số trong có thể được biểu diễn trong hệ nhị phân bằng 2 chữ số 0 và 1 (thay vì 10 chữ số từ 0 đến 9 đối với hệ thập phân). Hầu hết các máy tính hiện nay đều tính toán trên hệ nhị phân. Do đó, những giá trị và những đối tượng cũng được biểu diễn dưới dạng nhị phân. Các máy tính không thể biểu diễn một giá trị nhị phân tùy ý mà chỉ có thể biểu diễn giá trị với một kích thước nhất định.

Trong máy tính, các giá trị nhị phân được biểu diễn dưới dạng các *bit*. Một *bit* biểu diễn 2 giá trị khác nhau, có thể là *0* hoặc *1*, *đúng* hoặc *sai*, *có* hoặc *không*, ...

Các bit kết hợp với nhau sẽ tạo thành một *chuỗi bit*. Chúng ta có các chuỗi bit sau:

- Nibble: 
- Byte:
- Word:
- Double word:
- Quad word:
- Long word:
- Tbyte: 

Khi biểu diễn một chuỗi bit, ta sẽ đánh dấu các bit từ phải qua trái và bắt đầu từ 0. Bit bên phải cùng ứng với bit vị trí thấp nhất gọi là *bit LO* (low-order), bên trái cùng là *bit HO* (high-order). Cũng dùng LO để chỉ vị trí từ bên phải qua và HO cho vị trí từ bên trái qua.

*Hình*



# 2. Những đặc trưng thú vị

1. Nếu bit LO của số nhị phân (số nguyên) là 1 thì số đó là số lẻ. Ngược lại, nếu là 0 thì là số chẵn.

Ví dụ: 

2. Nếu một lượng n-bit LO đều là 0, thì số đó có thể chia hết cho 2^n.

Ví dụ: 

3. Nếu số nhị phân có bit thứ n là 1, tất cả các bit còn lại là 0 thì số đó bằng 2^n.

Ví dụ:

4. If a binary value contains all ones from bit position zero up to (but not including) bit position n, and all other bits are zero, then that value is equal to 2n−1.
nếu số nhị phân chỉ chứa toàn số 1 từ vị trí 0 đến vị trí n -1, và các bit còn lại là 0, thì số đó = 2^n -1.

5. Shifting all the bits in a number to the left by one position multiplies the
binary value by two.
Dịch trái 1 bit toàn bộ các bit trong số nhị phân sẽ tương đương với phép nhân với 2.

6. Shifting all the bits of an unsigned binary number to the right by one position effectively divides that number by two (this does not apply to signed integer values). Odd numbers are rounded down.
Dịch phải 1 bit của số nhị phân không dấu tương đương với phép chia cho 2 (phần lẻ sẽ được làm tròn xuống). Không áp dụng với số nguyên có dấu.

7. Multiplying two n-bit binary values together may require as many as 2*n bits to hold the result.
Nhân 2 giá trị nhị phân n-bit có thể cần 2*n bit để lưu kết quả.

8. Adding or subtracting two n-bit binary values never requires more than n+1 bits to hold the result.
cộng hoặc trừ 2 số nhị phân n bit sẽ không cần quá n+1 bit để lưu

9. Inverting all the bits in a binary number (that is, changing all the zeros to ones and all the ones to zeros) is the same thing as negating (chang- ing the sign) of the value and then subtracting one from the result.


10. Incrementing (adding one to) the largest unsigned binary value for a given number of bits always produces a value of zero.


11. Decrementing (subtracting one from) zero always produces the largest unsigned binary value for a given number of bits.


12. An n-bit value provides 2n unique combinations of those bits.


13. The value 2n−1 contains n bits, each containing the value one.

# 3. Các phép toán thú vị

1. Kiểm tra 1 bit bên trong dãy bit dùng phép toán AND

2. Kiểm tra 1 tập bit có phải là 0 dùng phép toán AND

3. So sánh một tập bit bên trong chuỗi số nhị phân

4. Tạo bộ đếm phép chia dư dùng phép toán AND

