w,h=eval(input('请输入体重（公斤）和身高（米）[用逗号隔开]：'))
x=w/h**2
if x<18.5:
    print('国际标准：偏瘦，国内标准：偏瘦')
elif 18.5<=x<=24:
    print('国际标准：正常，国内标准：正常')
elif 24<x<25:
    print('国际标准：正常，国内标准：偏胖')
elif 25<=x<=8:
    print('国际标准：偏胖，国内标准：偏胖')
elif 28<x<30:
    print('国际标准：偏胖，国内标准：肥胖')
else:
    print('国际标准：肥胖，国内标准：肥胖')
print('BMI='+str(round(x,2)))
