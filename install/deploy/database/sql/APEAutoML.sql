SET NAMES utf8mb4;
/*Table structure for table `ALGORITHM_INFO` */

CREATE TABLE `ALGORITHM_INFO` (
  `alg_id` varchar(30) NOT NULL,
  `alg_nm` varchar(30) DEFAULT NULL,
  `algorithm_code` varchar(30) NOT NULL,
  `alg_type` varchar(30) NOT NULL,
  `dist_yn` varchar(1) NOT NULL DEFAULT 'N',
  `alg_cont` text DEFAULT NULL,
  `alg_ver` varchar(20) DEFAULT NULL,
  `proc_id` varchar(10) DEFAULT NULL,
  `proc_dt` varchar(14) DEFAULT NULL,
  `lib_type` varchar(2) NOT NULL,
  `user_made_yn` varchar(1) DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ALGORITHM_PARAM` */

CREATE TABLE `ALGORITHM_PARAM` (
  `alg_id` bigint(18) NOT NULL,
  `param_id` bigint(18) NOT NULL,
  `param_name` varchar(450) DEFAULT NULL,
  `param_code` varchar(450) DEFAULT NULL,
  `param_value` varchar(450) DEFAULT NULL,
  `param_type` char(3) DEFAULT NULL,
  `param_type_value` varchar(450) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ALG_ANAL_INFO` */

CREATE TABLE `ALG_ANAL_INFO` (
  `alg_anal_id` varchar(30) NOT NULL,
  `alg_id` varchar(30) NOT NULL,
  `metadata_json` longtext DEFAULT NULL,
  `alg_type` varchar(30) DEFAULT NULL,
  `alg_json` longtext DEFAULT NULL,
  `algorithm_code` varchar(30) DEFAULT NULL,
  `dp_analysis_id` varchar(30) NOT NULL,
  `project_id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `APE_ALGORITHM_PARAM` */

CREATE TABLE `APE_ALGORITHM_PARAM` (
  `algorithm_id` bigint(18) DEFAULT NULL,
  `param_id` bigint(18) DEFAULT NULL,
  `param_name` varchar(450) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `param_code` varchar(450) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `param_value` varchar(450) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `param_type` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `param_type_value` varchar(450) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DATASET` */

CREATE TABLE `DATASET` (
  `dataset_id` varchar(30) NOT NULL,
  `dataset_format` varchar(1) NOT NULL,
  `n_cols` varchar(30) NOT NULL,
  `dataset_size` varchar(30) NOT NULL,
  `n_rows` varchar(30) NOT NULL,
  `status_cd` varchar(3) DEFAULT NULL,
  `format_json` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DATA_ANLS_INFO` */

CREATE TABLE `DATA_ANLS_INFO` (
  `data_analysis_id` varchar(30) NOT NULL,
  `metadata_json` longtext NOT NULL,
  `label_yn` varchar(1) NOT NULL DEFAULT 'N',
  `dist_file_cnt` varchar(3) DEFAULT NULL,
  `analysis_file_nm` text DEFAULT NULL,
  `dataset_id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DP_ANLS_INFO` */

CREATE TABLE `DP_ANLS_INFO` (
  `dp_analysis_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_analysis_json` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_analysis_id` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `EDA_INFO` */

CREATE TABLE `EDA_INFO` (
  `eda_id` varchar(30) NOT NULL,
  `status` varchar(2) NOT NULL DEFAULT '1',
  `selection_field` longtext,
  `pca_yn` varchar(1) NOT NULL DEFAULT 'N',
  `dp_analysis_id` varchar(30) NOT NULL,
  `project_id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `FIELD_CONV_INFO` */

CREATE TABLE `FIELD_CONV_INFO` (
  `field_cnvr_id` varchar(30) NOT NULL,
  `field_cnvr_nm` varchar(30) NOT NULL,
  `field_sn_list` text DEFAULT NULL,
  `proc_id` varchar(10) DEFAULT NULL,
  `proc_dt` varchar(14) DEFAULT NULL,
  `field_cnvr_comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `FIELD_INFO` */

CREATE TABLE `FIELD_INFO` (
  `field_sn` varchar(30) NOT NULL,
  `field_cnvr_id` varchar(30) NOT NULL,
  `field_nm` varchar(30) NOT NULL,
  `func_tags` text NOT NULL,
  `is_label` varchar(1) NOT NULL,
  `stt_label` varchar(1) NOT NULL,
  `unique_yn` varchar(1) NOT NULL DEFAULT 'N',
  `dispersion` varchar(1) DEFAULT 'N',
  `max_length` varchar(1) NOT NULL,
  `is_multiple` varchar(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `LEARN_HIST` */

CREATE TABLE `LEARN_HIST` (
  `learn_hist_no` varchar(30) NOT NULL,
  `param_id` varchar(30) NOT NULL,
  `alg_id` varchar(30) NOT NULL,
  `project_id` varchar(30) NOT NULL,
  `learn_sttus_cd` varchar(2) NOT NULL,
  `start_time` varchar(14) DEFAULT NULL,
  `end_time` varchar(14) DEFAULT NULL,
  `ml_result_json` text DEFAULT NULL,
  `eval_result_json` text DEFAULT NULL,
  `ml_score` varchar(10) DEFAULT NULL,
  `eps` varchar(32) DEFAULT NULL,
  `issue_task_idx` varchar(1) DEFAULT NULL,
  `alg_anal_id` varchar(30) NOT NULL,
  `dp_analysis_id` varchar(30) NOT NULL,
  `logs` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_bookmark` char(1) DEFAULT 'N',
  `model_alias` varchar(100) DEFAULT NULL,
  `select_yn` char(1) DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `INFERENCE_HIST` */

CREATE TABLE `INFERENCE_HIST` (
  `infr_hist_no` varchar(30) NOT NULL,
  `learn_hist_no` varchar(30) NOT NULL,
  `infr_sttus_cd` varchar(2) NOT NULL,
  `start_time` varchar(14) DEFAULT NULL,
  `end_time` varchar(14) DEFAULT NULL,
  `issue_task_idx` varchar(1) DEFAULT NULL,
  `xai_create_yn` char(1) DEFAULT 'N',
  `logs` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_field` varchar(200) DEFAULT NULL,
  `data_analysis_id` varchar(30) NOT NULL,
  `infr_accuracy` VARCHAR(10) NOT NULL DEFAULT '0',
  `infr_f1score` VARCHAR(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `XAI_HIST` */

CREATE TABLE `XAI_HIST` (
  `xai_hist_no` varchar(30) NOT NULL,
  `infr_hist_no` varchar(30) NOT NULL,
  `learn_hist_no` varchar(30) NOT NULL,
  `xai_sttus_cd` varchar(2) NOT NULL,
  `start_time` varchar(14) DEFAULT NULL,
  `end_time` varchar(14) DEFAULT NULL,
  `logs` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_field` varchar(200) DEFAULT NULL,
  `data_analysis_id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ML_PARAM_INFO` */

CREATE TABLE `ML_PARAM_INFO` (
  `param_id` varchar(30) NOT NULL,
  `alg_id` varchar(30) NOT NULL,
  `project_id` varchar(30) NOT NULL,
  `param_json` longtext DEFAULT NULL,
  `alg_anal_id` varchar(30) NOT NULL,
  `dp_analysis_id` varchar(30) NOT NULL,
  `used_yn` varchar(1) DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `PROJECT_INFO` */

CREATE TABLE `PROJECT_INFO` (
  `project_id` varchar(30) NOT NULL,
  `project_purpose_cd` varchar(2) NOT NULL,
  `data_analysis_id` varchar(30) NOT NULL,
  `status` varchar(2) NOT NULL,
  `start_time` varchar(14) NOT NULL,
  `end_time` varchar(14) DEFAULT NULL,
  `project_target_field` varchar(200) DEFAULT NULL,
  `modeling_mode` char(2) DEFAULT '1',
  `early_stop_param` longtext DEFAULT '{}',
  `tag` longtext DEFAULT '[]';
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `VAR_FUNC_INFO` */

CREATE TABLE `VAR_FUNC_INFO` (
  `conv_func_id` varchar(30) NOT NULL,
  `conv_func_nm` varchar(30) DEFAULT NULL,
  `conv_func_cls` varchar(30) NOT NULL,
  `conv_index` varchar(3) NOT NULL,
  `conv_func_tag` varchar(30) NOT NULL,
  `conv_func_param_cnt` varchar(2) NOT NULL,
  `conv_func_cont` text DEFAULT NULL,
  `proc_id` varchar(10) DEFAULT NULL,
  `proc_dt` varchar(14) DEFAULT NULL,
  `user_made_yn` varchar(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DETECT_HIST` */

CREATE TABLE `DETECT_HIST` (
  `detect_hist_no` varchar(30) NOT NULL,
  `learn_hist_no` varchar(30) NOT NULL,
  `detect_status_cd` varchar(2) NOT NULL,
  `start_time` varchar(14) DEFAULT NULL,
  `end_time` varchar(14) DEFAULT NULL,
  `use_yn` char(1) DEFAULT 'N',
  `result_fields` varchar(150) DEFAULT '',
  `input_folder_path` longtext DEFAULT '',
  `output_folder_path` longtext DEFAULT '',
  `num_replicas` int DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `DETECT_HIST` */

CREATE TABLE `MODEL_INFO` (
  `learn_hist_no` varchar(30) NOT NULL,
  `gpu_use` char(1) DEFAULT 'N',
  `algorithm_json` longtext DEFAULT NULL,
  `dataset_format` varchar(30) DEFAULT NULL,
  `dataset_json` longtext DEFAULT NULL,
  `project_target_field` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;