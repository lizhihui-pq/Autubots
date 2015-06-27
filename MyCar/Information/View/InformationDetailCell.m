//
//  InformationDetailCell.m
//  MyCar
//
//  Created by lanou3g on 15-6-25.
//  Copyright (c) 2015年 李智慧. All rights reserved.
//

#import "InformationDetailCell.h"

@implementation InformationDetailCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 图片
        self.news_pic =[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 120, 70)];
        //self.news_pic.backgroundColor =[UIColor redColor];
        self.news_pic.image =[UIImage imageNamed:@"333.jpg"];
        [self.contentView addSubview:_news_pic];
        // 新闻标题
        self.titleLable =[[UILabel alloc]initWithFrame:CGRectMake(150, 5, 100, 40)];
        // 自动换行
        _titleLable.numberOfLines=0;
//        _titleLable.adjustsFontSizeToFitWidth =YES;
       // _titleLable.lineBreakMode = UILineBreakModeWordWrap;
        [self.contentView addSubview:_titleLable];
        // 时间
        self.timeLable =[[UILabel alloc]initWithFrame:CGRectMake(150, 66, 200, 20)];
        _timeLable.font =[UIFont fontWithName:@"American Typewriter" size:13];
        _timeLable.textColor =[UIColor lightGrayColor];
        [self.contentView addSubview:_timeLable];
    }
    return self;
}

// 当接收到News 的数据时 进行赋值
- (void)setNews:(News *)news
{
    

        //控件赋值
        _timeLable.text =news.time;
    
        _titleLable.text =news.title;
        _news_pic.image =[UIImage imageNamed:news.smallpic];
        // 重新计算新闻标题的高度
        CGFloat height =[InformationDetailCell getHeightWithString:news.title];
        _titleLable.frame =CGRectMake(150, 5, 200, height);
    
    }


+ (CGFloat)getHeightWithString:(NSString *)string{
    NSDictionary *dic =@{NSFontAttributeName:[UIFont systemFontOfSize:17]};
    CGRect rect =[string boundingRectWithSize:CGSizeMake(170, 10000000) options:(NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin) attributes:dic context:nil];
    //返回高度
    return rect.size.height;
}
@end
