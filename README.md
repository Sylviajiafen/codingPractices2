# codingPractices -2
## Pass Value

### **FirstPageViewController**

1. 有一 UITableView, 四邊貼齊 SafeArea。

2. 此 UITableView 的 Cell 左側有一個 UILabel, 右側有一個 UIButton。

3. App 開啟時，畫面會預設有 4 個 Cell, Cell 的文字分別是 2, 3, 4, 5。

4. 按下 Cell 裡的右側按鈕，會將 Cell 刪除，可用下列三種方法實現：

```
1. Closure
2. Target-Action (Target 請設定為 UIViewController)
3. Delegate Pattern
```

5. 有 Navigation Bar，上面右側有個 + 按鈕，點擊會推出 **NextPage**。

6. 點擊 UITableViewCell 會推出相同的 **NextPage**，並會把 Cell 內的文字傳到第二頁。


### **NextPageViewController**

1. 此頁的 UI 僅以程式碼建構。

2. 畫面上有一 UITextField ，其下方有一 UIButton。

3. 上述兩物件的 Layout 滿足以下需求：

   * UITextfield

     * top to safe area: 100
     * Width 為 SuperView 的 2/3
     * 水平置中
     * Height 為 40

   * UIButton

     * Width 為 SuperView 的 2/3
     * 水平置中
     * Height 為 40
     * top 在 super view 的 centerYAnchor 的下方 20 pt 

4. 不管從何種方式連過來，點擊 UIButton 都會回到上一頁（**FirstPage**）。

5. 若是從 **FirstPage** 的 Cell 連過來，UITextField 會顯示與點擊的 Cell 的 label 上的內容。

6. 若是從 **FirstPage** 的 ＋ 連過來，UITextField 的內容為空白。
   
7. 若是從 **FirstPage** 的 Cell 連過來，此時若修改 UITextField 的內容，點擊 UIButton 回到 **FirstPage** 時，
   **FirstPage** 剛剛被點擊 Cell 的 label 內容也會被更動成 UITextField 的內容。
   
8. 若是從 **FirstPage** 的 ＋ 連過來，此時若新增 UITextField 的內容，點擊 UIButton 回到 **FirstPage** 時，
   **FirstPage** 會新增一個 Cell，其 label 內容為 UITextField 的內容。
   
9. 上述 7. 8. 的功能，可以下列兩種方式實現：

```
1. Closure
2. Delegate Pattern
```

![GITHUB](https://github.com/Sylviajiafen/codingPractices2/blob/master/PassValue.gif)
