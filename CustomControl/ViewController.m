//
//  ViewController.m
//  CustomControl
//
//  Created by LDH on 16/12/2.
//  Copyright © 2016年 LDH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *content;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
     UIView *view  = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 100, 100)];
    
    CATextLayer *textLayer = [CATextLayer layer];

    textLayer.foregroundColor = [UIColor blueColor].CGColor;
    textLayer.frame = CGRectMake(50, 0, 50, 50);
    textLayer.font = (__bridge CFTypeRef _Nullable)([UIFont systemFontOfSize:15]);
    view.layer.backgroundColor = [UIColor redColor].CGColor;
    textLayer.contentsScale = 3.0;
   // textLayer.wrapped = YES;
    textLayer.fontSize = 13;
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.truncationMode = kCATruncationEnd;
   // textLayer.position = CGPointMake(10, 10);
    textLayer.backgroundColor = [UIColor greenColor].CGColor;
    [view.layer addSublayer:textLayer];
    
    CALayer *layer1 = [CALayer layer];
    layer1.contents = (__bridge id _Nullable)([UIImage imageNamed:@"img1"].CGImage);
    [view.layer addSublayer:layer1];
    layer1.frame = CGRectMake(0, 0, 50, 50);
//    layer1.anchorPoint = CGPointMake(25, 25);
    
    CALayer *layer2 = [CALayer layer];
    layer2.contents = (__bridge id _Nullable)([UIImage imageNamed:@"img2"].CGImage);
    [view.layer addSublayer:layer2];
    layer2.frame = CGRectMake(50, 50, 50, 50);
    //layer2.anchorPoint = CGPointMake(75, 75);
    
    
    
    [self.view addSubview:view];
    UIView *view1  = [[UIView alloc]initWithFrame:CGRectMake(150, 150, 150, 150)];
//    UIGraphicsBeginImageContext(view1.frame.size);
        view1.layer.bounds = view1.bounds;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            textLayer.string = @"helloworld";//绘制字符串异步延迟，view.layer的内容不完整
        UIGraphicsBeginImageContextWithOptions(view1.frame.size, NO, 0.0);
        [view.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *img1 = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        dispatch_async(dispatch_get_main_queue(), ^{
            view1.layer.contents = (__bridge id _Nullable)(img1.CGImage);
        });
    });
    
    [self.view addSubview:view1];
    view1.layer.backgroundColor = [UIColor purpleColor].CGColor;
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, 200, 200)];
//    label.numberOfLines = 2;
//    label.lineBreakMode = NSLineBreakByTruncatingTail;
//    label.text = @"NSLineBreakByTruncatingMiddleNSLineBreakByTruncatingMiddleNSLineBreakByTruncatingMiddleNSLineBreakByTruncatingMiddleNSLineBreakByTruncatingMiddleNSLineBreakByTruncatingMiddle";
//    label.backgroundColor = [UIColor redColor];
//    label.font = [UIFont systemFontOfSize:30];
//    CGRect rect = [label textRectForBounds:label.frame limitedToNumberOfLines:2];
//    label.frame = rect;
//    [self.view addSubview:label];
//    
//    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(100, 200, 200, 200)];
//    label1.numberOfLines = 2;
//    label1.lineBreakMode = NSLineBreakByTruncatingTail;
//    label1.text = @"NSLineBreakByTruncatingMiddleNSLineBreakByTruncatingMiddleNSLineBreakByTruncatingMiddleNSLineBreakByTruncatingMiddleNSLineBreakByTruncatingMiddleNSLineBreakByTruncatingMiddle";
//    label1.backgroundColor = [UIColor redColor];
//    label1.adjustsFontSizeToFitWidth = YES;
//    NSLog(@"%f,%f", self.content.frame.size.height,self.content.frame.size
//          .width  );
//    self.content.backgroundColor = [UIColor greenColor];
////    self.content.text = label.text;
////    CGRect rect1 = [self.content textRectForBounds:self.content.frame limitedToNumberOfLines:2];
////    self.content.frame = rect1;
////    CGRect rect3 = [@"yTruncatingMiddleNSLineBreakByTruncatingMiddleNSLineBreakByTruncatingMiddleNSLineBreakByTruncatingMiddleNSLineBreakByTruncatingMiddleNSLineBr" boundingRectWithSize:CGSizeMake(50, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]} context:nil];
////    //[self.view addSubview:label1];
////    self.content.frame = rect3;
//    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(30, 50, 200, 100)];
//    CustomL *l = [[CustomL alloc]initWithFrame:CGRectMake(0, 300, 100, 100)];
//    l.text = @"eNSLineBreakByTruncatingMiddleNSLineBreakByTruncatingMiddleNSLineBreakByTruncatingMiddleNSLineBreakByTruncatingMid";
//    l.numberOfLines = 3;
//    l.backgroundColor = [UIColor blueColor];
//    l.lineBreakMode = NSLineBreakByTruncatingTail;
//    [self.view addSubview:l];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
@implementation CustomL

-(void)drawRect:(CGRect)rect{
    //An opaque type that represents a Quartz 2D drawing environment.
       //一个不透明类型的Quartz 2D绘画环境,相当于一个画布,你可以在上面任意绘画
        CGContextRef context = UIGraphicsGetCurrentContext();

        /*写文字*/
        UIFont  *font = [UIFont boldSystemFontOfSize:12.0];//定义默认字体
    
            NSMutableParagraphStyle* paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
//            paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    
            paragraphStyle.alignment=NSTextAlignmentCenter;//文字居中：发现只能水平居中，而无法垂直居中
            NSDictionary* attribute = @{
                                        NSForegroundColorAttributeName:[UIColor redColor],//设置文字颜色
                                        NSFontAttributeName:font,//设置文字的字体
                                           NSKernAttributeName:@1,//文字之间的字距
                                        NSParagraphStyleAttributeName:paragraphStyle,};//设置文字的样式
                                        

                //计算文字的宽度和高度：支持多行显示
                CGSize sizeText = [self.text boundingRectWithSize:self.bounds.size
                                                                                    options:NSStringDrawingUsesLineFragmentOrigin
                                                                                attributes:@{
                                                                                                                                                      NSFontAttributeName:font,//设置文字的字体
                                                                                                                                                       NSKernAttributeName:@1,//文字之间的字距
                                                                                                                                                     }
                                                                                   context:nil].size;
                
              CGFloat width = self.bounds.size.width;
               CGFloat height = self.bounds.size.height;
                  
                //为了能够垂直居中，需要计算显示起点坐标x,y
//                CGRect rect1 = CGRectMake((width-sizeText.width)/2, (height-sizeText.height)/2, sizeText.width, sizeText.height);
      CGRect rect1 = CGRectMake(0, 0, sizeText.width, sizeText.height);
                [self.text drawInRect:rect1 withAttributes:attribute];
//            }else{
//                CGContextSetRGBFillColor (context,  1, 0, 0, 1.0);//设置填充颜色:红色
//                [_text drawInRect:self.bounds withFont:font];
//            }

}

@end
