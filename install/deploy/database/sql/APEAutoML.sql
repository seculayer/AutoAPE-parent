SET NAMES utf8mb4;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
