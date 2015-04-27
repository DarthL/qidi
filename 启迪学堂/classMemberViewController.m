//
//  classMemberViewController.m
//  启迪学堂
//
//  Created by 梁伟 on 15/4/27.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "classMemberViewController.h"



@interface classMemberViewController()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *subTableView;
    NSArray *positions;
    NSArray *positionIconNames;
    int memberCount;
}
@end
@implementation classMemberViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    positions = [NSArray arrayWithObjects:@"组长",@"副组长",@"成员", nil];
    positionIconNames = [NSArray arrayWithObjects:@"banzhang_icon",@"fubanzhang_icon",@"zuyuan_icon", nil];
    memberCount = 7;
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
    
    UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 12, 14)];
    iconImageView.image = [UIImage imageNamed:positionIconNames[indexPath.row]];
    [cell.contentView addSubview:iconImageView];
    
    UILabel *positionLabel = [[UILabel alloc] initWithFrame:CGRectMake(iconImageView.frame.origin.x+iconImageView.frame.size.width + 5, iconImageView.frame.origin.y, 60, 15)];
    positionLabel.text = positions[indexPath.row];
    if (indexPath.row == 0) {
        positionLabel.textColor = [HandleTools colorStringToInt:@"ff8a00"];
    }
    else{
        positionLabel.textColor = [HandleTools colorStringToInt:@"00b4ff"];
    }
    [cell.contentView addSubview:positionLabel];
    
    
    
    //int memberCount = 1;//成员个数
    if (indexPath.row == 0) {
        UIImageView *profileImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, iconImageView.frame.origin.y+iconImageView.frame.size.height+20, 50, 50)];
        profileImageView.image = [UIImage imageNamed:@"profile.jpg"];
        [cell.contentView addSubview:profileImageView];
        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(profileImageView.frame.origin.x, profileImageView.frame.size.height+profileImageView.frame.origin.y+15, 80, 15)];
        nameLabel.text = @"Sandy";
        nameLabel.textAlignment = NSTextAlignmentCenter;
        [nameLabel sizeToFit];
        [cell.contentView addSubview:nameLabel];
    }
    else if (indexPath.row == 1){
    
        UIImageView *profileImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, iconImageView.frame.origin.y+iconImageView.frame.size.height+20, 50, 50)];
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
            UIImageView *profileImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15+(i%4)*(150+WIDTH-230)/3, iconImageView.frame.origin.y+iconImageView.frame.size.height+20+100*(i/4), 50, 50)];
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
