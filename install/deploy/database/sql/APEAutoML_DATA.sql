SET NAMES utf8mb4;

INSERT INTO VAR_FUNC_INFO VALUES('1', '변환안함', 'NotNormal', '1', '[[@not_normal()]]', '0', '- 필드값을 변환하지 고 원본을 그대로 사용한다.', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('2', 'MinMaxNormalize', 'MinMaxNormal', '2', '[[@minmax_normal()]]', '0', '- min max normalization 변환 함수 태그<br />- 인자는 없고 최소값과 최대값은 통계정보를 사용한다.<br />- 최소값은 1, 최대값은 255 인경우 숫자 192를 변환 할 경우 설정과 결과값은 아래와 같다.<br />예> 192 => 0.7520', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('3', 'DecimalScaling', 'DecimalScaleNormal', '3', '[[@decimal_scale()]]', '0', '- decimal scaling 변환 함수 태그<br />- 인자는 없고 최대값은 통계 정보를 사용한다.<br />- 숫자 192를 변환 할 경우 설정과 결과값은 아래와 같다.<br />예> 192 => 0.7181848', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('4', 'BasicNormalize', 'BasicNormal', '4', '[[@basic_normal()]]', '0', '- 기본 변환 함수 태그<br />- 인자는 없고 min max normalization 정규화 방법을 사용한다.<br />- 최소값은 1이며, 최대값은 32767로 총 1개의 특성으로 변환한다.<br />- 숫자 1000을 변환할 경우 아래와 같다.<br />예> 1000 => 0.030489', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('5', 'IPNormalize', 'IPNormal', '5', '[[@ip_normal()]]', '0', '- 아이피 주소 변환 함수 태그<br />- 인자는 없고 min max normalization 정규화 방법을 사용한다.<br />- 최소값은 1이며, 최대값은 255로 총 4개의 특성으로 변환한다.<br />- 192.168.1.1 아이피 주소를 변환 할 경우 아래와 같다.<br />예> 192.168.1.1 => 0.7520,0.6575,0.0000,0.0000', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('6', 'PortNormalize', 'PortNormal', '6', '[[@port_normal()]]', '0', '- 포트 번호 변환 함수 태그<br />- 인자는 없고 min max normalization 정규화 방법을 사용한다.<br />- 최소값은 1이며, 최대값은 65535로 총 1개의 특성으로 변환한다.<br />- 8080 아이피 주소를 변환 할 경우 아래와 같다.<br />예> 8080 => 0.123280', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('8', 'ZScoreNormalize', 'ZScoreNormal', '7', '[[@zscore_normal()]]', '0', '- z-score 정규화 변환 함수 태그<br />- 인자는 없고 평균값은 통계 정보를 사용한다.<br />- 평균과 표준편차를 이용한 차원없는 수치로 변환한다.', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('9', 'OneHotEncoding', 'OneHotEncode', '8', '[[@one_hot_encode()]]', '0', '- one hot encoding 변환 함수 태그<br />- 인자는 없고, 1과 0로 변환하며 해당하지 않는 모든 항목은 0 해당하는 항목은 1 변환한다.', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('10', 'SignEncoding', 'SignEncode', '9', '[[@sign_encode()]]', '0', '- sign encoding 변환 함수 태그<br />- 인자는 없고,  1과 -1로 변환하며 0은 -1로 0이외는 1로 변환한다.', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('11', 'SpecialCharExtract', 'SpecialCharExtract', '10', '[[@special_char_extract()]]', '1', '- 문자열에서 특수기호만을 추출하는 기능<br />- 인자1 : 배열 수<br />- 문자열에서 인자1에 설정된 배열수만큼 특수기호만을 추출하여 수치화하여 변환한다.<br />예> [[@special_char_extract(\'4\')]] : example.com?param=1 => 46,63,61,255', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('12', 'Replace', 'Replace', '11', '[[@replace()]]', '2', '- 문자열 변환기능<br />- 인자 1의 문자열을 인자2의 문자열로 변환한다.<br />예> [[@replace(\'eye\', \'I\')]] : Aeye => AI', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('13', 'ReplaceAll', 'ReplaceAll', '12', '[[@replaceall()]]', '2', '- 정규식을 이용한 문자열변환 기능<br />- 인자 1의 정규식을 인자2의 문자열로 변환한다.<br />예> [[@replaceall(\'[a-z]\', \'\']] : Aeye-2.0 => A-2.0', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('14', 'RegexGet', 'RegexGet', '13', '[[@regex_get()]]', '1', '- 정규식을 이용한 문자열 추출 기능, ()로 감싼 정규표현을 추출한다.<br />- 인자 1의 정규표현식의 문자열을 추출한다.<br />예> [[@regex_get(\'[a-z]+_(d+)_[a-z]+\')]] : prefix_123_tail => 123', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('15', 'Substr', 'Substr', '14', '[[@substr()]]', '2', '- 문자열 자르기 기능<br />- 인자 1 : 문자열 자르기 시작 위치 값<br />- 인자 2 : 문자열 자르기 마지막 위치 값 (설정 하지 않은 경우 문자열 끝의 위치)<br />예> [[@substr(\'1\',\'8\')]] : Aeye-2.0 => eye-2.0', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('17', 'UnixTimeStamp', 'UnixTimeStamp', '15', '[[@unix_timestamp()]]', '0', '- Unix 시간 형태를 변환하는 기능<br />- 인자는없고 yyyyMMddHHmmss 포맷으로 변환한다.<br />예> 1351239803 -> 20121026172323', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('19', 'HexToString', 'HexToString', '16', '[[@hex_tostring()]]', '1', '- Payload Hex값을 문자열로 변환하는 기능<br />- 인자 1: 캐릭터셋<br />- 문자열 변환시 인자 1에 설정된 캐릭터셋을 적용한다.<br />예> [[@hex_tostring(\'UTF-8\')]] ', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('20', 'StringToMD5', 'StringToMD5', '17', '[[@stringtomd5()]]', '0', '- 문자열을 MD5문자열로 변환하는 기능', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('21', 'DecodeBase64', 'DecodeBase64', '18', '[[@decode_base64()]]', '0', '- BASE64문자열을 문자열로 변환하는 기능', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('22', 'LongToIP', 'LongToIP', '19', '[[@longtoip()]]', '0', '- 숫자형태로 된 아이피값을 문자열 아이피로 변환하는 기능', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('23', 'ToLowerCase', 'ToLowerCase', '20', '[[@tolowercase()]]', '0', '- 문자열을 소문자로 변환하는 기능', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('24', 'ToUpperCase', 'ToUpperCase', '21', '[[@touppercase()]]', '0', '- 문자열을 대문자로 변환하는 기능', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('25', 'ExtractDomain', 'ExtractDomain', '22', '[[@extract_domain()]]', '0', '- URL문자열에서 도메일을 추출하는 기능', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('26', 'IfNull', 'IfNull', '23', '[[@ifnull()]]', '1', '- Null을 변환하는 기능<br />- 인자1 : 문자열<br />- Null을 인자1에 설정된 문자열로 변환한다.<br />예> [[@ifnull(\'A\')]] : null => A', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('27', 'Trim', 'Trim', '24', '[[@trim()]]', '0', '- 문자열의 앞뒤 공백을 제거하는 기능<br />예> [[@trim()]] : \' Aeye-2.0 \' => \'Aeye-2.0\'', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('28', 'NgramTokenizer', 'NgramTokenizer', '25', '[[@ngram_tokenizer()]]', '3', '- Ngram을 통해 데이터를 추출하는 기능', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('29', 'Tokenizer', 'Tokenizer', '26', '[[@Tokenizer()]]', '1', '- Token 단위로 데이터를 split하는 기능<br />INPUT ARGS : MAX LENGTH<br />- CCOMMAA -> \',\'', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('30', 'SpecialWordChar', 'SpecialWordChar', '27', '[[@special_word_char()]]', '2', '- 특수문자와 사용자정의 문자 기준으로 추출하는 기능<br />- parameter_1: Max Length<br />- parameter_2: Basic, RCE(원격코드실행), XSS(Cross-Site Scripting), FD(File Download), FUP(File Upload), UAA(비인가접근), SQL(SQL Injection)<br />- CCOMMAA -> \',\'', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('31', 'CalUsage', 'CalUsage', '28', '[[@cal_usage()]]', '0', '장비의 사용률을 0~1 사이로 Normalize 한다.', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('32', 'DevUsage', 'DevUsage', '29', '[[@dev_usage()]]', '0', '장비의 사용률을 -1~1 사이로 Normalize 한다.', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('33', 'EqpDtTokenizer', 'EqpDtTokenizer', '30', '[[@eqp_dt_tokenizer()]]', '0', '장비 발생 시각에서 시간과 분을 추출한다.', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('34', 'IPTransferDivide', 'IPTransferDivide', '31', '[[@ip_transfer_divide()]]', '0', '- IP 주소를 “.”으로 Split 하여 반환한다.', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('35', 'IPTransferMerge', 'IPTransferMerge', '32', '[[@ip_transfer_merge()]]', '0', '두개의 ip 주소를 하나의 필드로 합한 문자열을 반환한다.', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('36', 'SplitSpecialChar', 'SplitSpecialChar', '33', '[[@split_special_char()]]', '1', '- 정규식 [~!#$%^&*|;,?/<br /><br />s]으로 데이터를 split 한다.<br /> - Fewshot 알고리즘 변환함수', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('37', 'String2ASCII', 'String2ASCII', '34', '[[@string_2_ascii()]]', '2', '- String을 ASCII Code로 변환한다.', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('38', 'MergeURLResCode', 'MergeURLResCode', '35', '[[@merge_url_rescode()]]', '1', '- URL과 HTTP Response Code를 결합한 결과를 반환한다<br />- 예> 200|/index.html<br />- parameter1 : input type<br />- 0 : GET (URL) (PROTOCOL) ...<br />- 1 : (URL)', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('39', 'UserAgentInfo', 'UserAgentInfo', '36', '[[@user_agent_info()]]', '0', '- User Agent의 Browser, OS, Device, Device Brand 정보를 추출하여 반환한다<br />- 예> Windows 98|Opera|Other|None', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('40', 'RefererInfo', 'RefererInfo', '37', '[[@referer_info()]]', '0', '- referer 정보를 반환한다<br />- 예> www.g2b.go.kr:8081/gov/koneps/co.css/base.css', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('41', 'TimeToSerial', 'TimeToSerial', '38', '[[@time_to_serial()]]', '2', '시간 데이터에서 원하는 값을 추출하여 반환한다.<br />- 예> 2019-06-26 11:00:05.297+0900 -> 1440.0<br />- parameter 1 : (0 : 하루), (1 : 일주일), (2 : 한달)<br />- parameter 2 : 시간간격 (단위:분)', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('42', 'SpecialWordCharURL', 'SpecialWordCharURL', '39', '[[@special_word_char_url()]]', '2', '- 특수문자와 사용자정의 문자 기준으로 추출하는 기능<br />- full payload에서 파라미터 값만 추출하여 사용<br />- parameter_1: Max Length<br />- parameter_2 : 1(디코딩 o) 0(디코딩 x)<br />- CCOMMAA -> \',\'', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('43', 'RobustScaler', 'RobustScaler', '40', '[[@robust_scaler()]]', '0', '- 모든 Feature를 일정 범위의 값으로 Scaling한다. </br>- Standard(Z-Score)와 유사하지만, 평균과 분산 대신 Median, quantile 값을 사용한다.', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('44', 'SpecialWordCharA', 'SpecialWordCharA', '41', '[[@special_word_char_a()]]', '3', '- 특수문자와 사용자정의 문자 기준으로 추출하는 기능<br />- parameter_1: Max Length<br />- parameter_2: Basic, RCE(원격코드실행), XSS(Cross-Site Scripting), FD(File Download), FUP(File Upload), UAA(비인가접근), SQL(SQL Injection)<br />- parameter_3 : 1(디코딩 o) 0(디코딩 x)<br />- CCOMMAA -> \',\'', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('45', 'FDSpWC', 'FDSpWC', '42', '[[@fdspwc()]]', '2', '- File Download 공격에 사용되는 특수문자와 사용자정의 문자 기준으로 추출하는 기능<br />- parameter_1: Max Length<br />- parameter_2: Padding Values(integer)', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('46', 'FUSpWC', 'FUSpWC', '43', '[[@fuspwc()]]', '2', '- File Upload 공격에 사용되는 특수문자와 사용자정의 문자 기준으로 추출하는 기능<br />- parameter_1: Max Length<br />- parameter_2: Padding Values(integer)', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('47', 'IDSpWC', 'IDSpWC', '44', '[[@idspwc()]]', '2', '- Insecure Deserialization 공격에 사용되는 특수문자와 사용자정의 문자 기준으로 추출하는 기능<br />- parameter_1: Max Length<br />- parameter_2: Padding Values(integer)', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('48', 'OCSpWC', 'OCSpWC', '45', '[[@ocspwc()]]', '2', '- OS Command Injection 공격에 사용되는 특수문자와 사용자정의 문자 기준으로 추출하는 기능<br />- parameter_1: Max Length<br />- parameter_2: Padding Values(integer)', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('49', 'PTSpWC', 'PTSpWC', '46', '[[@ptspwc()]]', '2', '- Path Traversal 공격에 사용되는 특수문자와 사용자정의 문자 기준으로 추출하는 기능<br />- parameter_1: Max Length<br />- parameter_2: Padding Values(integer)', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('50', 'SISpWC', 'SISpWC', '47', '[[@sispwc()]]', '2', '- SQL Injection 공격에 사용되는 특수문자와 사용자정의 문자 기준으로 추출하는 기능<br />- parameter_1: Max Length<br />- parameter_2: Padding Values(integer)', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('51', 'SSRFSpWC', 'SSRFSpWC', '48', '[[@ssrfspwc()]]', '2', '- Server Site Request Forger 공격에 사용되는 특수문자와 사용자정의 문자 기준으로 추출하는 기능<br />- parameter_1: Max Length<br />- parameter_2: Padding Values(integer)', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('52', 'UASpWC', 'UASpWC', '49', '[[@uaspwc()]]', '2', '- UnAuthorize Access(비인가접근)에 사용되는 특수문자와 사용자정의 문자 기준으로 추출하는 기능<br />- parameter_1: Max Length<br />- parameter_2: Padding Values(integer)', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('53', 'XISpWC', 'XISpWC', '50', '[[@xispwc()]]', '2', '- Xpath Injection 공격에 사용되는 특수문자와 사용자정의 문자 기준으로 추출하는 기능<br />- parameter_1: Max Length<br />- parameter_2: Padding Values(integer)', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('54', 'XSSpWC', 'XSSpWC', '51', '[[@xsspwc()]]', '2', '- XSS(Cross Site Script) 공격에 사용되는 특수문자와 사용자정의 문자 기준으로 추출하는 기능<br />- parameter_1: Max Length<br />- parameter_2: Padding Values(integer)', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('55', 'XXESpWC', 'XXESpWC', '52', '[[@xxespwc()]]', '2', '- XML External Entity 공격에 사용되는 특수문자와 사용자정의 문자 기준으로 추출하는 기능<br />- parameter_1: Max Length<br />- parameter_2: Padding Values(integer)', 'admin', '202108301306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('56', 'BOSpWC', 'BOSpWC', '53', '[[@bospwc()]]', '2', '- Buffer Overflow 공격에 사용되는 특수문자와 사용자정의 문자 기준으로 추출하는 기능<br />- parameter_1: Max Length<br />- parameter_2: Padding Values(integer)', 'admin', '202110011306', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('57', 'CFSpWC', 'CFSpWC', '54', '[[@cfspwc()]]', '2', '- Cross-Site Request Forgery 공격에 사용되는 특수문자와 사용자정의 문자 기준으로 추출하는 기능<br />- parameter_1: Max Length<br />- parameter_2: Padding Values(integer)', 'admin', '202110011306', 'N');

# 2022.11.03 DGA, DGA Meta, Packet
INSERT INTO VAR_FUNC_INFO VALUES('58', 'DGAChar2IDX', 'DGAChar2IDX', '55', '[[@dga_char2idx()]]', '0', 'DGA Char2IDX', 'admin', '202211031700', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('59', 'DNSMetaPreProcessing', 'DNSMetaPreProcessing', '56', '[[@dns_meta_preprocessing()]]', '0', '- DNSMetaPreProcessing : DGA Meta-Data 전처리함수', 'admin', '202211151932', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('60', 'DateRemaining', 'DateRemaining', '57', '[[@date_remaining()]]', '0', '- DateRemaining : DGA Meta-Data 전처리함수', 'admin', '202211151932', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('61', 'ListStddev', 'ListStddev', '58', '[[@list_stddev()]]', '0', '- ListStddev : DGA Meta-Data 전처리함수', 'admin', '202211151932', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('62', 'DateDiff', 'DateDiff', '59', '[[@date_diff()]]', '0', '- DateDiff : DGA Meta-Data 전처리함수', 'admin', '202211151932', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('63', 'ListUniqueType', 'ListUniqueType', '60', '[[@list_unique_type()]]', '0', '- ListUniqueType : DGA Meta-Data 전처리함수', 'admin', '202211151932', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('64', 'ListLength', 'ListLength', '61', '[[@list_length()]]', '0', '- ListLength : DGA Meta-Data 전처리함수', 'admin', '202211151932', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('65', 'ListFirstValue', 'ListFirstValue', '62', '[[@list_first_value()]]', '0', '- ListFirstValue : DGA Meta-Data 전처리함수', 'admin', '202211151932', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('66', 'VTMalicious', 'VTMalicious', '63', '[[@vt_malicious()]]', '0', '- VTMalicious : DGA Meta-Data 전처리함수', 'admin', '202211151932', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('67', 'VTPopularityRank', 'VTPopularityRank', '64', '[[@vt_popularity_rank()]]', '1', '- VTPopularityRank : DGA Meta-Data 전처리함수<br />- parameter_1: equipment company(?)', 'admin', '202211151932', 'N');
INSERT INTO VAR_FUNC_INFO VALUES('68', 'DNSDomainPreProcessing', 'DNSDomainPreProcessing', '65', '[[@dns_domain_preprocessing()]]', '1', '- DNSDomainPreProcessing : Packet 전처리함수', 'admin', '202211151932', 'N');


INSERT INTO ALGORITHM_INFO (alg_id, alg_nm, alg_type, algorithm_code, alg_ver, alg_cont, proc_id, proc_dt, lib_type, dist_yn, user_made_yn) VALUES('10000000000000001','TF-GPRM','10','TFGPRMV2','1.0','Tensorflow v2 Gaussian Process Regressor Model.','admin','202206211633','1','N','N');
INSERT INTO ALGORITHM_INFO (alg_id, alg_nm, alg_type, algorithm_code, alg_ver, alg_cont, proc_id, proc_dt, lib_type, dist_yn, user_made_yn) VALUES('20000000000000001','K-DNN','1,2','KDNN','1.0','Keras Deep Neural Network','admin','201905200900','2','Y','N');
INSERT INTO ALGORITHM_INFO (alg_id, alg_nm, alg_type, algorithm_code, alg_ver, alg_cont, proc_id, proc_dt, lib_type, dist_yn, user_made_yn) VALUES('20000000000000002','K-CNN','1,2','KCNN','1.0','Keras Convolutional Neural Network','admin','201905200900','2','Y','N');
INSERT INTO ALGORITHM_INFO (alg_id, alg_nm, alg_type, algorithm_code, alg_ver, alg_cont, proc_id, proc_dt, lib_type, dist_yn, user_made_yn) VALUES('20000000000000003','K-RNN','1,2','KRNN','1.0','Keras Recurrent Neural Network','admin','201905200900','2','Y','N');
INSERT INTO ALGORITHM_INFO (alg_id, alg_nm, alg_type, algorithm_code, alg_ver, alg_cont, proc_id, proc_dt, lib_type, dist_yn, user_made_yn) VALUES('20000000000000004','K-CNNAE','6','KCNNAE','1.0','Keras Convolutional Auto Encoder.','admin','201911141654','2','Y','N');
INSERT INTO ALGORITHM_INFO (alg_id, alg_nm, alg_type, algorithm_code, alg_ver, alg_cont, proc_id, proc_dt, lib_type, dist_yn, user_made_yn) VALUES('20000000000000005','K-DNNAE','6','KDNNAE','1.0','Keras Deep Neural Network Auto Encoder.','admin','201911141654','2','Y','N');
INSERT INTO ALGORITHM_INFO (alg_id, alg_nm, alg_type, algorithm_code, alg_ver, alg_cont, proc_id, proc_dt, lib_type, dist_yn, user_made_yn) VALUES('20000000000000006','K-DAEOD','7','KDAEOD','1.0','Keras Deep Neural Network Auto Encoder Outlier Detecttion.','admin','20210120','2','Y','N');
INSERT INTO ALGORITHM_INFO (alg_id, alg_nm, alg_type, algorithm_code, alg_ver, alg_cont, proc_id, proc_dt, lib_type, dist_yn, user_made_yn) VALUES('20000000000000007','K-GNN','7','KGNN','1.0','Tensorflow Keras Graph Neural Network','admin','202107081000','2','N','N');
INSERT INTO ALGORITHM_INFO (alg_id, alg_nm, alg_type, algorithm_code, alg_ver, alg_cont, proc_id, proc_dt, lib_type, dist_yn, user_made_yn) VALUES('40000000000000001','GS-SkipGram','4','GSSkipGram','1.0','Gensim Skip Gram Word2Vec','admin','201908291000','4','N','N');
INSERT INTO ALGORITHM_INFO (alg_id, alg_nm, alg_type, algorithm_code, alg_ver, alg_cont, proc_id, proc_dt, lib_type, dist_yn, user_made_yn) VALUES('40000000000000002','GS-CBOW','4','GSCBOW','1.0','Gensim Continuous Bag-Of-Words Word2Vec','admin','201908291000','4','N','N');
INSERT INTO ALGORITHM_INFO (alg_id, alg_nm, alg_type, algorithm_code, alg_ver, alg_cont, proc_id, proc_dt, lib_type, dist_yn, user_made_yn) VALUES('40000000000000003','GS-FastText','4','GSFastText','1.0','Gensim Fast Text Word2Vec','admin','201908291000','4','N','N');
INSERT INTO ALGORITHM_INFO (alg_id, alg_nm, alg_type, algorithm_code, alg_ver, alg_cont, proc_id, proc_dt, lib_type, dist_yn, user_made_yn) VALUES('50000000000000001','SKL-ExtraTrees','1','SKLExtraTrees','1.0','Scikit-Learn Extra Trees Classifier','admin','201908291000','5','N','N');
INSERT INTO ALGORITHM_INFO (alg_id, alg_nm, alg_type, algorithm_code, alg_ver, alg_cont, proc_id, proc_dt, lib_type, dist_yn, user_made_yn) VALUES('50000000000000002','SKL-RandomForest','1','SKLRandomForest','1.0','Scikit-Learn Random Forest Classifier','admin','201908291000','5','N','N');
INSERT INTO ALGORITHM_INFO (alg_id, alg_nm, alg_type, algorithm_code, alg_ver, alg_cont, proc_id, proc_dt, lib_type, dist_yn, user_made_yn) VALUES('50000000000000003','SKL-BernoulliNB','1','SKLBernoulliNB','1.0','Scikit-Learn Bernoulli Naive Bayes Classifier','admin','201908291000','5','N','N');
INSERT INTO ALGORITHM_INFO (alg_id, alg_nm, alg_type, algorithm_code, alg_ver, alg_cont, proc_id, proc_dt, lib_type, dist_yn, user_made_yn) VALUES('50000000000000004','SKL-GaussianNB','1','SKLGaussianNB','1.0','Scikit-Learn Gaussian Naive Bayes Classifier','admin','201908291000','5','N','N');
INSERT INTO ALGORITHM_INFO (alg_id, alg_nm, alg_type, algorithm_code, alg_ver, alg_cont, proc_id, proc_dt, lib_type, dist_yn, user_made_yn) VALUES('50000000000000005','SKL-KNeighbors','1','SKLKNeighbors','1.0','Scikit-Learn K Neighbors Classifier','admin','201908291000','5','N','N');
INSERT INTO ALGORITHM_INFO (alg_id, alg_nm, alg_type, algorithm_code, alg_ver, alg_cont, proc_id, proc_dt, lib_type, dist_yn, user_made_yn) VALUES('50000000000000006','SKL-MLP','1','SKLMLP','1.0','Scikit-Learn Multi Layer Perceptron Neural Network Classifier','admin','201908291000','5','N','N');
INSERT INTO ALGORITHM_INFO (alg_id, alg_nm, alg_type, algorithm_code, alg_ver, alg_cont, proc_id, proc_dt, lib_type, dist_yn, user_made_yn) VALUES('50000000000000007','SKL-LinearSVC','1','SKLLinearSVC','1.0','Scikit-Learn Linear SVC(SVM) Classifier','admin','201908291000','5','N','N');
INSERT INTO ALGORITHM_INFO (alg_id, alg_nm, alg_type, algorithm_code, alg_ver, alg_cont, proc_id, proc_dt, lib_type, dist_yn, user_made_yn) VALUES('50000000000000008','SKL-NuSVC','1','SKLNuSVC','1.0','Scikit-Learn Nu-SVC(SVM) Classifier','admin','201908291000','5','N','N');
INSERT INTO ALGORITHM_INFO (alg_id, alg_nm, alg_type, algorithm_code, alg_ver, alg_cont, proc_id, proc_dt, lib_type, dist_yn, user_made_yn) VALUES('50000000000000009','SKL-SVC','1','SKLSVC','1.0','Scikit-Learn Basic SVC(SVM) Classifier','admin','201908291000','5','N','N');
INSERT INTO ALGORITHM_INFO (alg_id, alg_nm, alg_type, algorithm_code, alg_ver, alg_cont, proc_id, proc_dt, lib_type, dist_yn, user_made_yn) VALUES('50000000000000010','SKL-DecisionTree','1','SKLDecisionTree','1.0','Scikit-Learn Decision Tree Classifier','admin','201908291000','5','N','N');
INSERT INTO ALGORITHM_INFO (alg_id, alg_nm, alg_type, algorithm_code, alg_ver, alg_cont, proc_id, proc_dt, lib_type, dist_yn, user_made_yn) VALUES('50000000000000011','SKL-DBSCAN','3','SKLDBSCAN','1.0','Scikit-Learn Density-based spatial clustering of applications with noise','admin','201908291000','5','N','N');
INSERT INTO ALGORITHM_INFO (alg_id, alg_nm, alg_type, algorithm_code, alg_ver, alg_cont, proc_id, proc_dt, lib_type, dist_yn, user_made_yn) VALUES('50000000000000012','SKL-KMeans','3','SKLKMeans','1.0','Scikit-Learn K Means Clustering','admin','201908291000','5','N','N');
INSERT INTO ALGORITHM_INFO (alg_id, alg_nm, alg_type, algorithm_code, alg_ver, alg_cont, proc_id, proc_dt, lib_type, dist_yn, user_made_yn) VALUES('50000000000000013','SKL-PCA','6','SKLPCA','1.0','Scikit-Learn Principal Component Analysis Dimension Reduction','admin','201908291000','5','N','N');
INSERT INTO ALGORITHM_INFO (alg_id, alg_nm, alg_type, algorithm_code, alg_ver, alg_cont, proc_id, proc_dt, lib_type, dist_yn, user_made_yn) VALUES('50000000000000014','SKL-ODBKM','7','SKLODBKM','1.0','Scikit-Learn Outlier Detection Based K Means.','admin','201912111033','5','N','N');

# 2022.11.03 DGA, DGA Meta, Packet
INSERT INTO ALGORITHM_INFO (alg_id, alg_nm, alg_type, algorithm_code, alg_ver, alg_cont, proc_id, proc_dt, lib_type, dist_yn, user_made_yn) VALUES('10000000000000002','TF-XGBoost','1','XGBoost','1.0','XGBoost Model.','admin','202211111633','1','N','N');
INSERT INTO ALGORITHM_INFO (alg_id, alg_nm, alg_type, algorithm_code, alg_ver, alg_cont, proc_id, proc_dt, lib_type, dist_yn, user_made_yn) VALUES('50000000000000015','SKL-IsolationForest','1','SKLIsolationForest','1.0','Scikit Learn IsolationForest Model.','admin','202211151933','1','N','N');
INSERT INTO ALGORITHM_INFO (alg_id, alg_nm, alg_type, algorithm_code, alg_ver, alg_cont, proc_id, proc_dt, lib_type, dist_yn, user_made_yn) VALUES('10000000000000003','TF-LightGBM','1','LightGBM','1.0','LightGBM Model.','admin','202211151933','1','N','N');

INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('10000000000000001','1000001000001','주기','seq_type','week','3','week');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('10000000000000001','1000001000002','분단위','seq_term','1','1','60');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('10000000000000001','1000001000003','학습률','learning_rate','0.1','2','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('10000000000000001','1000001000002','lower 유무','use_lower','False','3','False');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000001','2000001000001','유닛수','hidden_units','64,32,4','1','list');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000001','2000001000002','학습률','learning_rate','0.1','2','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000001','2000001000003','활성화함수','act_fn','ReLU','3','ReLU,Sigmoid,Tanh');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000001','2000001000004','최적화함수','optimizer_fn','Adadelta','3','Adam,Adadelta,rmsprop');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000001','2000001000005','드롭아웃','dropout_prob','0.5','2','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000002','2000002000001','유닛수','hidden_units','64,32,4','1','list');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000002','2000002000002','초기가중치','initial_weight','1.0','2','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000002','2000002000003','활성화함수','act_fn','ReLU','3','ReLU,Sigmoid,Tanh');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000002','2000002000004','필터사이즈','filter_sizes','2,2,2','1','list');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000002','2000002000005','최적화함수','optimizer_fn','Adadelta','3','Adam,Adadelta,rmsprop');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000002','2000002000006','풀사이즈','pool_sizes','2,2,2','1','list');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000002','2000002000007','필터개수','num_filters','16','1','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000002','2000002000008','드롭아웃','dropout_prob','0.5','2','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000002','2000002000009','풀링함수','pooling_fn','Average1D','3','Max1D,Average1D');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000002','2000002000010','컨벌루션함수','conv_fn','Conv1D','3','Conv1D');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000002','2000002000011','학습률','learning_rate','0.1','2','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000003','2000003000001','유닛수','hidden_units','64,32,4','1','list');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000003','2000003000002','활성화함수','act_fn','ReLU','3','ReLU,Sigmoid,Tanh');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000003','2000003000003','셀유닛수','cell_units','4','1','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000003','2000003000004','RNN셀','rnn_cell','RNN','3','RNN,GRU,LSTM');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000003','2000003000005','드롭아웃','dropout_prob','0.5','2','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000003','2000003000006','최적화함수','optimizer_fn','Adam','3','Adam,Adadelta,rmsprop');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000003','2000003000007','학습률','learning_rate','0.1','2','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000003','2000003000008','시퀀스길이','seq_length','6','1','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000004','2000004000001','필터사이즈','filter_sizes','2,2,2','1','list');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000004','2000004000002','최적화함수','optimizer_fn','Adadelta','3','Adam,Adadelta,rmsprop');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000004','2000004000003','풀사이즈','pool_sizes','2,2,2','1','list');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000004','2000004000004','필터개수','num_filters','16','1','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000004','2000004000005','풀링함수','pooling_fn','Average1D','3','Max1D,Max2D,Max3D,Average1D,Average2D,Average3D');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000004','2000004000006','컨벌루션함수','conv_fn','Conv1D','3','Conv1D,Conv2D,Conv3D');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000004','2000004000007','학습률','learning_rate','0.1','2','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000005','2000005000001','학습률','learning_rate','0.1','2','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000005','2000005000002','최적화함수','optimizer_fn','Adadelta','3','Adam,Adadelta,rmsprop');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000005','2000005000003','유닛수','hidden_units','64,32,4','1','list');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000006','2000006000001','활성화함수','act_fn','ReLU','3','ReLU ,Sigmoid ,Tanh');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000006','2000006000002','드롭아웃','dropout_prob','0.5','2','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000006','2000006000003','유닛수','hidden_units','1024 ,512 ,256','1','list');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000006','2000006000004','최적화함수','optimizer_fn','Adam','3','Adam ,Adadelta ,rmsprop');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000006','2000006000005','학습률','learning_rate','0.01','2','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000006','2000006000006','URLPATH필터ID','path_keyword_id','','1','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000006','2000006000007','URLPARAM필터ID','param_keyword_id','','1','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000006','2000006000008','BrowserType필터ID','bt_keyword_id','','1','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000006','2000006000009','공격키워드필터ID','att_keyword_id','','1','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000007','2000007000001','활성화함수','act_fn','ReLU','3','ReLU');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000007','2000007000002','드롭아웃','dropout_prob','0.4','2','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000007','2000007000003','Layer Size(유닛수)','layer_size','128','1','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000007','2000007000004','학습률','learning_rate','0.1','2','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000007','2000007000005','최적화함수','optimizer_fn','Adam','3','Adam,Adadelta,rmsprop');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('20000000000000007','2000007000006','distance_ratio','dist_ratio','0.9','2','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('40000000000000001','4000001000001','스킵 윈도우','skip_window','2','1','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('40000000000000001','4000001000002','최소 단어수','min_char_num','1','1','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('40000000000000001','4000001000003','unknown 벡터 값','unknown_val','2.0','2','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('40000000000000002','4000002000001','스킵 윈도우','skip_window','2','1','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('40000000000000002','4000002000002','최소 단어수','min_char_num','1','1','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('40000000000000002','4000002000003','unknown 벡터 값','unknown_val','2.0','2','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('40000000000000003','4000003000001','스킵 윈도우','skip_window','2','1','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('40000000000000003','4000003000002','최소 단어수','min_char_num','1','1','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('50000000000000005','5000005000001','neighbors 개수','n_neighbors','2','1','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('50000000000000006','5000006000001','활성화함수','act_fn','ReLU','3','ReLU,Sigmoid,Tanh');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('50000000000000006','5000006000002','학습률','learning_rate','0.1','2','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('50000000000000006','5000006000003','유닛 크기','hidden_size','100','1','list');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('50000000000000008','5000008000001','커널 함수','kernel_fn','rbf','3','linear,poly,rbf,sigmoid');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('50000000000000009','5000009000001','커널 함수','kernel_fn','rbf','3','poly,rbf,sigmoid');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('50000000000000011','5000011000001','epsilon 값','eps','0.5','2','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('50000000000000011','5000011000002','최소 샘플 개수','min_samples','5','1','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('50000000000000012','5000012000001','클러스터수','num_cluster','2','1','');

# 2022.11.03 DGA, DGA Meta, Packet
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('10000000000000002','1000002000001','학습률','learning_rate','0.1','2','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('10000000000000002','1000002000002','n_estimators','n_estimators','1000','1','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('10000000000000002','1000002000003','max_depth','max_depth','6','1','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('10000000000000003','1000003000001','num_leaves','num_leaves','41','1','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('10000000000000003','1000003000002','max_depth','max_depth','21','1','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('50000000000000015','5000015000001','n_estimators','n_estimators','20','1','');
INSERT INTO ALGORITHM_PARAM (alg_id, param_id, param_name, param_code, param_value, param_type, param_type_value) VALUES('50000000000000015','5000015000002','contamination','contamination','0.1','2','');