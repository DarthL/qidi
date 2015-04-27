//
//  ClassRankViewController.m
//  启迪学堂
//
//  Created by 梁伟 on 15/4/27.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "ClassRankViewController.h"
@interface ClassRankViewController()<UITableViewDataSource,UITableViewDelegate>{
    UITableView *subTableView;
    int memberCount;
}
@end
@implementation ClassRankViewController
-(void)viewDidLoad{

    [super viewDidLoad];
    memberCount = 14;
    subTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64 -32)];
    subTableView.delegate = self;
    subTableView.dataSource = self;
    [self.view addSubview:subTableView];
}
#pragma mark - UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row != 2) {
        return 140;
    }
    return 140 + 100*(memberCount/4);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString* titleCellIdentifier = [NSString stringWithFormat:@"cell:%d_%d",indexPath.section,indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:titleCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:titleCellIdentifier];
    }else{
        [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    cell.contentView.backgroundColor=[UIColor whiteColor];
    CellChangeSelectedColor;
    




    if (indexPath.row == 0) {
        UILabel *rankLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 60, 15)];
        rankLabel.text = @"第一名";
        rankLabel.textColor = [HandleTools colorStringToInt:@"ff8a00"];
        [cell.contentView addSubview:rankLabel];
        UIImageView *profileImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, rankLabel.frame.origin.y+rankLabel.frame.size.height+20, 50, 50)];
        profileImageView.image = [UIImage imageNamed:@"profile.jpg"];
        [cell.contentView addSubview:profileImageView];
        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(profileImageView.frame.origin.x, profileImageView.frame.size.height+profileImageView.frame.origin.y+15, 80, 15)];
        nameLabel.text = @"Sandy";
        nameLabel.textAlignment = NSTextAlignmentCenter;
        [nameLabel sizeToFit];
        [cell.contentView addSubview:nameLabel];
    }
    else if (indexPath.row == 1){
        UILabel *rankLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 60, 15)];
        rankLabel.text = @"第二名";
        rankLabel.textColor = [HandleTools colorStringToInt:@"ff8a00"];
        [cell.contentView addSubview:rankLabel];
        UIImageView *profileImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, rankLabel.frame.origin.y+rankLabel.frame.size.height+20, 50, 50)];
        profileImageView.image = [UIImage imageNamed:@"profile.jpg"];
        [cell.contentView addSubview:profileImageView];
        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(profileImageView.frame.origin.x, profileImageView.frame.size.height+profileImageView.frame.origin.y+15, 80, 15)];
        nameLabel.text = @"Sandy";
        nameLabel.textAlignment = NSTextAlignmentCenter;
        [nameLabel sizeToFit];
        [cell.contentView addSubview:nameLabel];
    }
    else if (indexPath.row ==2) {
        for (int i = 0; i<memberCount; i++) {
            UIImageView *profileImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15+(i%4)*(150+WIDTH-230)/3,40+100*(i/4), 50, 50)];
            profileImageView.image = [UIImage imageNamed:@"profile.jpg"];
            [cell.contentView addSubview:profileImageView];
            
            UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(profileImageView.frame.origin.x, profileImageView.frame.size.height+profileImageView.frame.origin.y+15, 80, 15)];
            nameLabel.text = @"Sandy";
            nameLabel.textAlignment = NSTextAlignmentCenter;
            [nameLabel sizeToFit];
            [cell.contentView addSubview:nameLabel];
            
        }
        
    }
    //        [cell setFrame:CGRectMake(cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, 140+100*(memberCount/4))];
    
    
    return cell;
}

@end
