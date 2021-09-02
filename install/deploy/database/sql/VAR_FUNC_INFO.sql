CREATE TABLE VAR_FUNC_INFO (
       conv_func_id varchar(30) NOT NULL,
       conv_func_cls varchar(30) NULL,
       conv_index integer NULL,
       conv_func_tag varchar(30) NULL,
       conv_func_param_cnt integer NULL,
       conv_func_cont text NULL,
       proc_id varchar(10) NULL,
       proc_dt varchar(14) NULL,
       user_made_yn varchar(1) NOT NULL DEFAULT 'N'
);

INSERT INTO VAR_FUNC_INFO VALUES(
        '32', 'DevUsage', 'DevUsage', '29', '[[@dev_usage()]]',
         '0', '장비의 사용률을 -1~1 사이로 Normalize 한다.', 'admin', '202108301306', 'N'
);