//
//function put(name){
//console.log("Hello "+name);
//
//};
//put(%@);


//使用1或2
//1
(function(){
 console.log("ProgectInit");
 //JS脚本加载完成后 自动render界面
 return render();
 })();

//2
//render();


//JS标签类
function Label(rect,text,color, backgroundColor){
    this.rect = rect;
    this.text = text;
    this.color = color;
    this.backgroundColor = backgroundColor;
    this.typeName = "Label";
}
//JS按钮类
function Button(rect,text,callFunc){
    this.rect = rect;
    this.text = text;
    this.callFunc = callFunc;
    this.typeName = "Button";
}
//JS Rect类
function Rect(x,y,width,height){
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
}
//JS颜色类
function Color(r,g,b,a){
    this.r = r;
    this.g = g;
    this.b = b;
    this.a = a;
}
function BackgrouncColor(r,g,b,a) {
    this.r = r;
    this.g = g;
    this.b = b;
    this.a = a;
}

//渲染方法 界面的渲染写在这里面
function render(){
    var rect = new Rect(20,100,280,30);
    var color = new Color(1,0,0,1);
    var backgroundColor = new BackgrouncColor(0,1,0,1)
    var label = new Label(rect,"Hello World",color, backgroundColor);
    
    var rect2 = new Rect(20,150,280,30);
    var color2 = new Color(0,1,0,1);
    var backgroundColor2 = new BackgrouncColor(0,1,0,1)
    var label2 = new Label(rect2,"Hello Native",color2);
    
    var rect3 = new Rect(20,200,280,30);
    var color3 = new Color(0,0,1,1);
    var backgroundColor3 = new BackgrouncColor(0,1,0,1)
    var label3 = new Label(rect3,"Hello JavaScript",color3);
    
    var rect4 = new Rect(20,240,280,30);
    var button = new Button(rect4,"我是一个按钮",function(){
                            var randColor = new Color(Math.random(),Math.random(),Math.random(),1);
                            Globle.changeBackgroundColor(randColor);
                            });
    //将控件以数组形式返回
    return [label,label2,label3,button];
}

