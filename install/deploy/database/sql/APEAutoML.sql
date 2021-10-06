SET NAMES utf8mb4;

CREATE TABLE `DATASET` (
                           `dataset_id`	varchar(30)	NOT NULL,
                           `dataset_format`	Integer	NOT NULL,
                           `n_cols`	Integer	NOT NULL,
                           `dataset_size`	float	NOT NULL,
                           `n_rows`	Integer	NOT NULL,
                           `proc_id`	varchar(10)	NULL,
                           `proc_dt`	varchar(14)	NULL,
                           `status_cd`	integer	NULL,
                           `num_error_list`	text	NULL,
                           `format_json`	text	NULL,
                           `dataset_comment`	text	NULL
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE `FIELD_CONV_INFO` (
                                   `field_cnvr_id`	varchar(30)	NOT NULL,
                                   `field_cnvr_nm`	varchar(30)	NOT NULL,
                                   `field_sn_list`	text	NULL,
                                   `proc_id`	varchar(10)	NULL,
                                   `proc_dt`	varchar(14)	NULL,
                                   `field_cnvr_comment`	text	NULL
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE `VAR_FUNC_INFO` (
                                 `conv_func_id`	varchar(30)	NOT NULL,
                                 `conv_func_nm`	varchar(30)	NULL,
                                 `conv_func_cls`	varchar(30)	NOT NULL,
                                 `conv_index`	integer	NOT NULL,
                                 `conv_func_tag`	varchar(30)	NOT NULL,
                                 `conv_func_param_cnt`	integer	NOT NULL,
                                 `conv_func_cont`	text	NULL,
                                 `proc_id`	varchar(10)	NULL,
                                 `proc_dt`	varchar(14)	NULL,
                                 `user_made_yn`	varchar(1)	NOT NULL	DEFAULT 'N'
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE `ALGORITHM_INFO` (
                                  `alg_id`	varchar(30)	NOT NULL,
                                  `alg_nm`	varchar(30)	NULL,
                                  `alg_cls`	varchar(30)	NOT NULL,
                                  `alg_type`	text	NOT NULL,
                                  `dist_yn`	varchar(1)	NOT NULL	DEFAULT 'N',
                                  `alg_cont`	text	NULL,
                                  `alg_ver`	varchar(20)	NULL,
                                  `proc_id`	varchar(10)	NULL,
                                  `proc_dt`	varchar(14)	NULL,
                                  `lib_type`	integer	NOT NULL,
                                  `user_made_yn`	varchar(1)	NULL	DEFAULT 'N'
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE `ALGORITHM_PARAM` (
                                   `alg_id` bigint (18),
                                   `param_id` bigint (18),
                                   `param_name` varchar (450),
                                   `param_code` varchar (450),
                                   `param_value` varchar (450),
                                   `param_type` char (3),
                                   `param_type_value` varchar (450)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE `PROJECT_INFO` (
                                `project_id`	varchar(30)	NOT NULL,
                                `project_purpose`	integer	NOT NULL,
                                `dataset_id`	varchar(30)	NOT NULL
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE `ML_ALGORITHM_INFO` (
                                     `learn_alg_id`	varchar(30)	NOT NULL,
                                     `data_process_id`	varchar(30)	NOT NULL,
                                     `project_id`	varchar(30)	NOT NULL,
                                     `alg_anal_id`	varchar(30)	NOT NULL,
                                     `alg_id`	varchar(30)	NOT NULL,
                                     `alg_json`	text	NULL
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE `LEARN_HIST` (
                              `learn_hist_no`	varchar(30)	NOT NULL,
                              `param_id`	varchar(30)	NOT NULL,
                              `learn_alg_id`	varchar(30)	NOT NULL,
                              `data_process_id`	varchar(30)	NOT NULL,
                              `project_id`	varchar(30)	NOT NULL,
                              `learn_sttus_cd`	varchar(2)	NOT NULL,
                              `start_time`	varchar(14)	NULL,
                              `end_time`	varchar(14)	NULL,
                              `ml_result_json`	text	NULL,
                              `ml_score`	float	NULL,
                              `eps`	float	NULL,
                              `issue_task_idx`	varchar(1)	NULL,
                              `message`	text	NULL
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE `DATA_ANLS_INFO` (
                                  `data_analysis_id`	varchar(30)	NOT NULL,
                                  `metadata_json`	text	NOT NULL,
                                  `label_yn`	varchar(1)	NOT NULL	DEFAULT 'N',
                                  `dr_yn`	varchar(1)	NOT NULL	DEFAULT 'N',
                                  `dist_file_cnt`	integer	NULL,
                                  `analysis_file_nm`	text	NULL,
                                  `field_cnvr_json`	text	NULL,
                                  `dataset_id`	varchar(30)	NOT NULL
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE `DATA_PROCESS_INFO` (
                                     `data_process_id`	varchar(30)	NOT NULL,
                                     `project_id`	varchar(30)	NOT NULL,
                                     `data_analysis_id`	varchar(30)	NOT NULL,
                                     `field_cnvr_id`	varchar(30)	NOT NULL
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE `ML_PARAM_INFO` (
                                 `param_id`	varchar(30)	NOT NULL,
                                 `learn_alg_id`	varchar(30)	NOT NULL,
                                 `data_process_id`	varchar(30)	NOT NULL,
                                 `project_id`	varchar(30)	NOT NULL,
                                 `param_json`	text	NULL
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE `ALG_ANAL_INFO` (
                                 `alg_anal_id`	varchar(30)	NOT NULL,
                                 `alg_id`	varchar(30)	NOT NULL,
                                 `metadata_json`	text	NULL,
                                 `alg_type`	integer	NULL,
                                 `alg_json`	text	NULL
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE `FIELD_INFO` (
                              `field_sn`	integer	NOT NULL,
                              `field_cnvr_id`	varchar(30)	NOT NULL,
                              `field_nm`	varchar(30)	NOT NULL,
                              `func_tags`	text	NOT NULL,
                              `is_label`	varchar(1)	NOT NULL,
                              `stt_label`	varchar(1)	NOT NULL,
                              `unique_yn`	varchar(1)	NOT NULL	DEFAULT 'N',
                              `dispersion`	varchar(1)	NULL	DEFAULT 'N',
                              `max_length`	varchar(1)	NOT NULL,
                              `is_multiple`	varchar(1)	NOT NULL	DEFAULT 'N'
)ENGINE=INNODB DEFAULT CHARSET=utf8;

