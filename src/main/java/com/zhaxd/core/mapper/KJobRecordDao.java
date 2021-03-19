package com.zhaxd.core.mapper;

import org.beetl.sql.core.annotatoin.SqlStatement;
import org.beetl.sql.core.mapper.BaseMapper;

import com.zhaxd.core.model.*;

import java.util.List;


public interface KJobRecordDao extends BaseMapper<KJobRecord> {


//    @SqlStatement(params = "kJobRecord,start,size,categoryId")
//    List<KTransMonitor> pageQuery(KJobRecord kJobRecord, Integer start, Integer size, Integer categoryId);

    @SqlStatement(params = "kJobRecord")
    Integer allCount(KJobRecord kJobRecord);

    @SqlStatement(params = "kJobRecord")
    Integer successToday(KJobRecord kJobRecord);

    @SqlStatement(params = "kJobRecord")
    Integer failToday(KJobRecord kJobRecord);
}
