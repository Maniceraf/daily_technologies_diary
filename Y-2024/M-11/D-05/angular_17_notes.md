# Learning Angular

    Tôi kết hợp thực hành dựa vào project thực tế + với hỏi cha gpt mà đưa ra notes tổng kết cho việc học này:

## Có bao nhiêu cách load component trong route angular:

    Tổng kết ngắn gọn, có bốn cách để load component trong Angular:
        - Load Component Tĩnh: Khai báo component trong template của component khác mà không cần sử dụng route.
        - Load Component qua Lazy Loading Module: Sử dụng loadChildren để tải một module chứa các component khi cần thiết.
        - Load Component qua Route Resolver: Sử dụng resolver để lấy dữ liệu trước khi load component, nhưng không trực tiếp load component.
        - Load Component với loadComponent (Angular 14+): Sử dụng thuộc tính loadComponent trong cấu hình route để tải một component riêng lẻ khi cần thiết.
    => Mỗi cách có ứng dụng và lợi ích riêng, tùy thuộc vào yêu cầu của dự án và cấu trúc ứng dụng.

## Signal trong Angular là gì?:

    Trong Angular, signals (tín hiệu) là một khái niệm mới được giới thiệu trong Angular v16 nhằm cải thiện cách quản lý trạng thái và tương tác giữa các component. Tín hiệu cho phép bạn theo dõi và phản ứng với các thay đổi trong dữ liệu một cách hiệu quả và dễ dàng hơn.

    Các điểm nổi bật về Signals:
        - Reactive Programming: Signals hỗ trợ lập trình phản ứng, giúp quản lý trạng thái và dữ liệu theo cách tương tác hơn. Điều này cho phép bạn tạo ra các ứng dụng mà có thể phản hồi nhanh chóng với các thay đổi trong trạng thái mà không cần phải viết quá nhiều mã.

    Quản lý Trạng Thái: 
        - Bạn có thể tạo và sử dụng signals để theo dõi trạng thái trong component hoặc dịch vụ. Khi giá trị của signal thay đổi, các component phụ thuộc sẽ tự động được cập nhật mà không cần phải tự gọi lại quá trình render.

    Cú Pháp Đơn Giản: 
        - Signals có cú pháp đơn giản hơn so với việc sử dụng RxJS để quản lý các trạng thái trong Angular. Điều này giúp giảm độ phức tạp và dễ hiểu hơn cho người mới bắt đầu.

    Cách sử dụng Signals
        - Để sử dụng signals trong Angular, bạn thường sẽ làm theo các bước sau:

    Lợi ích của Signals:
        - Hiệu suất cao hơn: Signals chỉ cập nhật các phần cần thiết của UI khi có thay đổi, giúp cải thiện hiệu suất.
        - Giảm độ phức tạp: Giúp loại bỏ nhu cầu về các subscriptions phức tạp và quản lý lifecycle cho RxJS.
        - Cú pháp rõ ràng: Cú pháp đơn giản và dễ hiểu hơn so với các phương pháp truyền thống.
    Kết luận:
        - Signals là một trong những cải tiến mới trong Angular, giúp lập trình viên dễ dàng quản lý trạng thái và tương tác giữa các component một cách hiệu quả và rõ ràng hơn.

## Làm sao để xác định active trong router link:

Để xác định và hiển thị trạng thái active cho một link trong Angular router, bạn có thể sử dụng directive routerLinkActive. Directive này cho phép bạn áp dụng một class hoặc một style cho link khi route tương ứng đang được kích hoạt.

Cách sử dụng routerLinkActive
    - Cấu hình Router: Đầu tiên, bạn cần có một cấu hình router với các route đã định nghĩa.
    - Sử dụng routerLink và routerLinkActive: Trong template của component, bạn sử dụng directive routerLink để chỉ định link đến route và routerLinkActive để chỉ định class sẽ được áp dụng khi link đang được kích hoạt.

Ví dụ:

```html
<nav>
  <a routerLink="/home" routerLinkActive="active">Home</a>
  <a routerLink="/about" routerLinkActive="active">About</a>
  <a routerLink="/contact" routerLinkActive="active">Contact</a>
</nav>
```

Giải thích:
    - routerLink: Định nghĩa đường dẫn đến route mà bạn muốn điều hướng tới.
    - routerLinkActive="active": Khi route tương ứng với link được kích hoạt (active), class active sẽ được thêm vào element <a> đó. Bạn có thể tùy chỉnh tên class này theo ý muốn.

Để thấy được hiệu ứng của routerLinkActive, bạn có thể thêm một số CSS như sau:

```css
.active {
  font-weight: bold;
  color: blue;
}
```

Sử dụng Nhiều Class
Nếu bạn muốn áp dụng nhiều class khi link được kích hoạt, bạn có thể làm như sau:

```html
<a routerLink="/home" routerLinkActive="active highlighted">Home</a>
```

Trong ví dụ này, khi link đến /home được kích hoạt, cả hai class active và highlighted sẽ được thêm vào.

Kết hợp với Router Events
Ngoài việc sử dụng routerLinkActive, bạn cũng có thể lắng nghe các sự kiện router để thực hiện các hành động phức tạp hơn, nhưng trong hầu hết các trường hợp, routerLinkActive đã đủ để quản lý trạng thái active cho các link trong navigation.