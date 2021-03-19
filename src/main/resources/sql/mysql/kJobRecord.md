allCount
===
    *今日执行Job数
        SELECT Count(*) FROM 
        k_job_record where TO_DAYS(start_time)=TO_DAYS(NOW())
         @if(!isEmpty(kJobRecord.addUser)){
                    and add_user =#kJobRecord.addUser#
             @}

successToday
===
    *今日执行成功Job数
        SELECT Count(*) FROM 
        k_job_record where TO_DAYS(start_time)=TO_DAYS(NOW())
        @if(!isEmpty(kJobRecord.addUser)){
                            and add_user =#kJobRecord.addUser# and record_status='1'
                     @}
failToday
===
    *今日执行失败Job数
        SELECT Count(*) FROM 
        k_job_record where TO_DAYS(start_time)=TO_DAYS(NOW())
        @if(!isEmpty(kJobRecord.addUser)){
                            and add_user =#kJobRecord.addUser# and record_status='2'
                     @}
