---1912530 ---REU Source 
---1906660 ---REU Event 
---1442820 --- REU Selected lcl_Chnl_Cd

COLLECT STATISTICS COLUMN (REG_DATE ,SVC_TAG_ID ,EMAIL_ADDR_ID,FULL_NM ,STATE_PROV ,DIRECT_FLG ,PH_NBR) ON sas_pulse_stg.RTL_END_USERS_1;
COLLECT STATISTICS COLUMN (CUST_NBR) ON sas_pulse_stg.RTL_END_USERS_1;
COLLECT STATISTICS COLUMN (REG_DATE) ON sas_pulse_stg.RTL_END_USERS_1;
COLLECT STATISTICS COLUMN (SVC_TAG_ID) ON sas_pulse_stg.RTL_END_USERS_1;
COLLECT STATISTICS COLUMN (SVC_TAG_BU_ID) ON sas_pulse_stg.RTL_END_USERS_1;
COLLECT STATISTICS COLUMN (REG_DATE ,SVC_TAG_BU_ID) ON sas_pulse_stg.RTL_END_USERS_1;
COLLECT STATISTICS COLUMN (SVC_TAG_ID ,SVC_TAG_BU_ID) ON sas_pulse_stg.RTL_END_USERS_1;

--ct tmp_work_db.RTL_END_USERS_extrnl as SAS_PULSE_STG.RTL_END_USERS_extrnl with data; 
---DELETE SAS_PULSE_STG.RTL_END_USERS_extrnl ALL;
INSERT INTO SAS_PULSE_STG.RTL_END_USERS_extrnl ----SAS_PULSE_STG.ev_gbl_extrnl
(
	evnt_ldr_Id,
	evnt_type_cd,
	evnt_subtype_cd,
	evnt_dt,
	evnt_dts,
	cnsld_src_txn_id,
	cnsld_src_txn_bu_id,
	so_nbr,
	so_bu_id,
	so_lcl_chnl_cd,
	so_dt,
	so_inv_dt,
	qte_nbr,
	qte_bu_id,
	qte_lcl_chnl_cd,
	qte_dt,
	sls_rep_bdge_nbr,
	sls_rep_email_addr_id,
	acct_exec_bdge_nbr,
	acct_exec_email_addr_id,
	insd_sls_mgr_bdge_nbr,
	insd_sls_mgr_email_addr_id,
	rgnl_sls_mgr_bdge_nbr,
	rgnl_sls_mgr_email_addr_id,
	sys_itm_cls_nm,
	sys_flg,
	snp_flg,
	svcs_flg,
	sls_chnl_cd,
	tot_revn_disc_amt,
	svc_req_nbr,
	svc_req_type,
	svc_req_crt_dt,
	svc_req_clos_dt,
	svc_req_crtd_by_bdge_nbr,
	svc_req_owner_bdge_nbr,
	svc_req_last_actvy_dt,
	svc_req_last_actvy_bdge_nbr,
	svc_tag_bu_id,
	svc_tag_lcl_chnl_cd,
	svc_tag_id,
	wrnty_type_cd,
	wrnty_stat_cd,
	dspch_nbr,
	dspch_type_cd,
	dspch_stat_cd,
	dspch_stat_dt,
	auth_guid_cd,
	top_lvl_acct_id,
	grp_acct_id,
	grp_co_nm,
	acct_id,
	acct_co_nm,
	acct_prim_cntct_nm,
	acct_owner_email_addr_id,
	cust_bu_id,
	cust_nbr,
	cust_lcl_chnl_cd,
	cust_co_nm,
	gbl_seg_desc,
	sub_seg_desc,
	sls_seg_desc,
	sls_vert_desc,
	ptnr_acct_type_cd,
	ptnr_nm,
	acct_rnkg_id,
	rad_cd,
	rad_nbr,
	gtm_gmm_nbr,
	iso_ctry_2_cd,
	iso_lang_cd,
	frst_nm,
	last_nm,
	full_nm,
	sfdc_cntct_id,
	email_addr_id,
	domain_email_addr_id,
	ph_nbr,
	job_ttl_nm,
	decsn_mkg_role_nm,
	prsn_grtg_txt,
	bnced_alert_flg,
	no_rsp_alert_flg,
	cntct_src_sys_nm,
	signatory_nm,
	signatory_ttl_nm,
	ce_email_addr_id,
	extrnl_src_txn_id,
	extrnl_src_attr_nm,
	extrnl_src_bu_id,
	attr_1_val,
	attr_2_val,
	attr_3_val,
	attr_4_val,
	attr_5_val
)

SELECT	 DISTINCT
	--300 AS Evnt_Ldr_Id,
	320 AS evnt_ldr_id,
	'B2CNPS' AS evnt_type_cd,
	--'RTLEUNPS' AS evnt_type_cd,
	/*'FY'||(SELECT  TRIM(y.fiscal_year) FROM   CORP.FISCAL_YEAR_INFO y WHERE CURRENT_DATE BETWEEN y.BEGIN_DATE AND y.END_DATE GROUP BY 1) ||
     'Q'||(SELECT  TRIM(q.FISCAL_QUARTER) FROM   CORP.FISCAL_QUARTER_INFO q WHERE CURRENT_DATE BETWEEN q.BEGIN_DATE AND q.END_DATE GROUP BY 1) || 	
	 'M'||(SELECT  TRIM(m.FISCAL_MONTH) FROM   CORP.FISCAL_MONTH_INFO m WHERE CURRENT_DATE BETWEEN m.BEGIN_DATE AND m.END_DATE GROUP BY 1) ||
	 'W'||(SELECT SUBSTR(TRIM(FISCAL_WEEK), 5,6) FROM corp.FISCAL_DAY d WHERE d.ACTUAL_DATE = CURRENT_DATE) ||
	 'D' ||(SELECT TRIM(FISCAL_DAY_OF_WEEK_CODE) FROM corp.FISCAL_DAY d2 WHERE d2.ACTUAL_DATE = CURRENT_DATE)
	AS evnt_subtype_cd,*/
	'RETAIL' AS evnt_subtype_cd,
	re.REG_DATE AS evnt_dt,
	CAST(re.REG_DATE AS TIMESTAMP(6)) AS evnt_dts,
	re.SVC_TAG_ID AS cnsld_src_txn_id,
	re.SVC_TAG_BU_ID AS cnsld_src_txn_bu_id,
	COALESCE(re.SO_NBR,	p.src_ord_nbr) AS so_nbr,
	re.SVC_TAG_BU_ID AS so_bu_id,
	--NULL AS so_lcl_chnl_cd,
	ch.lcl_chnl_code AS so_lcl_chnl_cd,
	NULL AS so_dt,
	NULL AS so_inv_dt,
	NULL AS qte_nbr,
	NULL AS qte_bu_id,
	NULL AS qte_lcl_chnl_cd,
	NULL AS qte_dt,
	NULL AS sls_rep_bdge_nbr,
	NULL AS sls_rep_email_addr_id,
	NULL AS acct_exec_bdge_nbr,
	NULL AS acct_exec_email_addr_id,
	NULL AS insd_sls_mgr_bdge_nbr,
	NULL AS insd_sls_mgr_email_addr_id,
	NULL AS rgnl_sls_mgr_bdge_nbr,
	NULL AS rgnl_sls_mgr_email_addr_id,
	p.ITM_CLS_CD AS sys_itm_cls_nm,
	NULL AS sys_flg,
	NULL AS snp_flg,
	NULL AS svcs_flg,
	NULL AS sls_chnl_cd,
	NULL AS tot_revn_disc_amt,
	NULL AS svc_req_nbr,
	NULL AS svc_req_type,
	NULL AS svc_req_crt_dt,
	NULL AS svc_req_clos_dt,
	NULL AS svc_req_crtd_by_bdge_nbr,
	NULL AS svc_req_owner_bdge_nbr,
	NULL AS svc_req_last_actvy_dt,
	NULL AS svc_req_last_actvy_bdge_nbr,
	re.SVC_TAG_BU_ID AS svc_tag_bu_id,
	--NULL AS svc_tag_lcl_chnl_cd,
	ch.lcl_chnl_code AS svc_tag_lcl_chnl_cd,
	re.SVC_TAG_ID AS svc_tag_id,
	NULL AS wrnty_type_cd,
	NULL AS wrnty_stat_cd,
	NULL AS dspch_nbr,
	NULL AS dspch_type_cd,
	NULL AS dspch_stat_cd,
	NULL AS dspch_stat_dt,
	NULL AS auth_guid_cd,
	NULL AS top_lvl_acct_id,
	NULL AS grp_acct_id,
	NULL AS grp_co_nm,
	NULL AS acct_id,
	NULL AS acct_co_nm,
	NULL AS acct_prim_cntct_nm,
	NULL AS acct_owner_email_addr_id,
	re.SVC_TAG_BU_ID AS cust_bu_id,
	--COALESCE(re.CUST_NBR, p.src_cust_nbr) AS cust_nbr,
	ssc.cust_nbr AS cust_nbr,
	ch.lcl_chnl_code AS cust_lcl_chnl_cd,
	--Shp.lcl_Chnl_Cd AS cust_lcl_chnl_cd,
	--COALESCE(re.COMPANY_NAME,Shp.COMPANY_NAME,ca.PARENT_CUSTOMER_NAME, ce.customer_name, pa.COMPANY_NAME) AS cust_co_nm,
	--COALESCE(re.COMPANY_NAME,	ca.PARENT_CUSTOMER_NAME, 
	--	       ce.customer_name, pa.COMPANY_NAME) AS cust_co_nm,
	COALESCE(CASE WHEN TRIM(re.COMPANY_NAME) = 'NULL' THEN NULL ELSE re.COMPANY_NAME end,ssc.cust_nm) AS cust_co_nm,
	NULL AS gbl_seg_desc,
	NULL AS sub_seg_desc,
	NULL AS sls_seg_desc,
	NULL AS sls_vert_desc,
	NULL AS ptnr_acct_type_cd,
	NULL AS ptnr_nm,
	NULL AS acct_rnkg_id,
	NULL AS rad_cd,
	NULL AS rad_nbr,
	NULL AS gtm_gmm_nbr,
	pgh.ISO_CTRY_CODE_2 AS iso_ctry_2_cd,
	cll.iso_lang_cd AS iso_lang_cd,
	NULL AS frst_nm,
	NULL AS last_nm,
	re.FULL_NM AS full_nm,
	NULL AS sfdc_cntct_id,
	re.EMAIL_ADDR_ID AS email_addr_id,
	SUBSTR(re.EMAIL_ADDR_ID,  POSITION('@' IN re.email_addr_id) ) AS domain_email_addr,
	PH_NBR AS ph_nbr,
	NULL AS job_ttl_nm,
	NULL AS decsn_mkg_role_nm,
	NULL AS prsn_grtg_txt,
	NULL AS bnced_alert_flg,
	NULL AS no_rsp_alert_flg,
	NULL AS cntct_src_sys_nm,
	NULL AS signatory_nm,
	NULL AS signatory_ttl_nm,
	NULL AS ce_email_addr_id,
	re.SVC_TAG_ID AS extrnl_src_txn_id,
	'SVCTAG' AS extrnl_src_attr_nm,
	re.SVC_TAG_BU_ID AS extrnl_src_bu_id,
	CASE WHEN (SELECT MAX(reg_date) FROM sas_pulse_stg.RTL_END_USERS ) - re.reg_date < 180 THEN  '0-6 Months' 
			WHEN (SELECT MAX(reg_date) FROM sas_pulse_stg.RTL_END_USERS ) - re.reg_date BETWEEN 180 AND 367 THEN  '7-12 Months'
			 ELSE '13-18 Months' END AS attr_1_val,
	--UPPER(COALESCE(re.PROD_LINE_DESC,	ph.PRODUCT_LINE_DESC)) AS attr_1_val,
	--COALESCE(CASE WHEN re.GROUP_DESC = 'DESKTOP' THEN 'Desktops' WHEN re.GROUP_DESC = 'NOTEBOOK' THEN 
 	--'EUC Mobility' ELSE re.GROUP_DESC END ,	ph.GROUP_DESC) AS attr_2_val,
	prod.comb_hier_cd AS attr_2_val,
	re.STATE_PROV AS attr_3_val,
	re.DIRECT_FLG AS attr_4_val,
	--CASE WHEN CAST(CAST('2015-02-01' AS DATE FORMAT 'yyyy-mm-dd') - re.REG_DATE AS INTEGER) > 180 
	--	THEN '2' ELSE '1' END AS attr_5_val
	NULL AS attr_5_val
FROM  sas_pulse_stg.RTL_END_USERS_1 re	
INNER JOIN svc_base.cust_prod p ON re.svc_tag_id = p.asst_id AND re.svc_tag_bu_id = p.cust_bu_id
INNER JOIN corp_drm_pkg.chnl_hier ch ON p.cust_bu_id = ch.bu_id AND p.lcl_chnl_cd = ch.lcl_chnl_code
INNER JOIN corp_drm_pkg.phys_geo_hier pgh ON ch.bu_id = pgh.bu_id
LEFT OUTER JOIN ce_base.survey_ctry_lang_lkup cll ON pgh.bu_id = cll.bu_id AND pgh.iso_ctry_code_2 = cll.iso_ctry_2_cd
INNER JOIN itm_pkg.base_prod_hier_dim AS base_prod ON p.itm_cls_cd = base_prod.itm_cls_code				
INNER JOIN itm_pkg.comb_prod_hier prod ON base_prod.base_code = prod.comb_hier_cd
INNER JOIN corp_ww.format_fiscal_day_info sd ON p.shipd_dt = sd.format_actual_date
INNER JOIN corp_ww.format_fiscal_day_info rd ON re.reg_date = rd.format_actual_date
INNER JOIN party_pkg.sls_svc_cust ssc ON ch.bu_id = ssc.src_bu_id AND ch.lcl_chnl_code = ssc.lcl_chnl_cd AND re.cust_nbr = ssc.cust_nbr
WHERE ch.seg_code = 'COSLR' AND sd.format_fiscal_week_id >= 201540
;
INSERT INTO SAS_PULSE_STG.RTL_END_USERS_extrnl ----SAS_PULSE_STG.ev_gbl_extrnl
(
	evnt_ldr_Id,
	evnt_type_cd,
	evnt_subtype_cd,
	evnt_dt,
	evnt_dts,
	cnsld_src_txn_id,
	cnsld_src_txn_bu_id,
	so_nbr,
	so_bu_id,
	so_lcl_chnl_cd,
	so_dt,
	so_inv_dt,
	qte_nbr,
	qte_bu_id,
	qte_lcl_chnl_cd,
	qte_dt,
	sls_rep_bdge_nbr,
	sls_rep_email_addr_id,
	acct_exec_bdge_nbr,
	acct_exec_email_addr_id,
	insd_sls_mgr_bdge_nbr,
	insd_sls_mgr_email_addr_id,
	rgnl_sls_mgr_bdge_nbr,
	rgnl_sls_mgr_email_addr_id,
	sys_itm_cls_nm,
	sys_flg,
	snp_flg,
	svcs_flg,
	sls_chnl_cd,
	tot_revn_disc_amt,
	svc_req_nbr,
	svc_req_type,
	svc_req_crt_dt,
	svc_req_clos_dt,
	svc_req_crtd_by_bdge_nbr,
	svc_req_owner_bdge_nbr,
	svc_req_last_actvy_dt,
	svc_req_last_actvy_bdge_nbr,
	svc_tag_bu_id,
	svc_tag_lcl_chnl_cd,
	svc_tag_id,
	wrnty_type_cd,
	wrnty_stat_cd,
	dspch_nbr,
	dspch_type_cd,
	dspch_stat_cd,
	dspch_stat_dt,
	auth_guid_cd,
	top_lvl_acct_id,
	grp_acct_id,
	grp_co_nm,
	acct_id,
	acct_co_nm,
	acct_prim_cntct_nm,
	acct_owner_email_addr_id,
	cust_bu_id,
	cust_nbr,
	cust_lcl_chnl_cd,
	cust_co_nm,
	gbl_seg_desc,
	sub_seg_desc,
	sls_seg_desc,
	sls_vert_desc,
	ptnr_acct_type_cd,
	ptnr_nm,
	acct_rnkg_id,
	rad_cd,
	rad_nbr,
	gtm_gmm_nbr,
	iso_ctry_2_cd,
	iso_lang_cd,
	frst_nm,
	last_nm,
	full_nm,
	sfdc_cntct_id,
	email_addr_id,
	domain_email_addr_id,
	ph_nbr,
	job_ttl_nm,
	decsn_mkg_role_nm,
	prsn_grtg_txt,
	bnced_alert_flg,
	no_rsp_alert_flg,
	cntct_src_sys_nm,
	signatory_nm,
	signatory_ttl_nm,
	ce_email_addr_id,
	extrnl_src_txn_id,
	extrnl_src_attr_nm,
	extrnl_src_bu_id,
	attr_1_val,
	attr_2_val,
	attr_3_val,
	attr_4_val,
	attr_5_val
)
SELECT	 DISTINCT
	320 AS evnt_ldr_id,
	'B2CNPS' AS evnt_type_cd,
	'RETAIL' AS evnt_subtype_cd,
	re.reg_date  AS evnt_dt,
	re.reg_date  AS evnt_dts,
	re.SVC_TAG_ID AS cnsld_src_txn_id,
	re.SVC_TAG_BU_ID AS cnsld_src_txn_bu_id,
	p.src_ord_nbr AS so_nbr,
	re.SVC_TAG_BU_ID AS so_bu_id,
	ch.lcl_chnl_code AS so_lcl_chnl_cd,
	NULL AS so_dt,
	NULL AS so_inv_dt,
	NULL AS qte_nbr,
	NULL AS qte_bu_id,
	NULL AS qte_lcl_chnl_cd,
	NULL AS qte_dt,
	NULL AS sls_rep_bdge_nbr,
	NULL AS sls_rep_email_addr_id,
	NULL AS acct_exec_bdge_nbr,
	NULL AS acct_exec_email_addr_id,
	NULL AS insd_sls_mgr_bdge_nbr,
	NULL AS insd_sls_mgr_email_addr_id,
	NULL AS rgnl_sls_mgr_bdge_nbr,
	NULL AS rgnl_sls_mgr_email_addr_id,
	p.ITM_CLS_CD AS sys_itm_cls_nm,
	NULL AS sys_flg,
	NULL AS snp_flg,
	NULL AS svcs_flg,
	NULL AS sls_chnl_cd,
	NULL AS tot_revn_disc_amt,
	NULL AS svc_req_nbr,
	NULL AS svc_req_type,
	NULL AS svc_req_crt_dt,
	NULL AS svc_req_clos_dt,
	NULL AS svc_req_crtd_by_bdge_nbr,
	NULL AS svc_req_owner_bdge_nbr,
	NULL AS svc_req_last_actvy_dt,
	NULL AS svc_req_last_actvy_bdge_nbr,
	re.SVC_TAG_BU_ID AS svc_tag_bu_id,
	ch.lcl_chnl_code AS svc_tag_lcl_chnl_cd,
	re.SVC_TAG_ID AS svc_tag_id,
	NULL AS wrnty_type_cd,
	NULL AS wrnty_stat_cd,
	NULL AS dspch_nbr,
	NULL AS dspch_type_cd,
	NULL AS dspch_stat_cd,
	NULL AS dspch_stat_dt,
	NULL AS auth_guid_cd,
	NULL AS top_lvl_acct_id,
	NULL AS grp_acct_id,
	NULL AS grp_co_nm,
	NULL AS acct_id,
	NULL AS acct_co_nm,
	NULL AS acct_prim_cntct_nm,
	NULL AS acct_owner_email_addr_id,
	re.SVC_TAG_BU_ID AS cust_bu_id,
	ssc.cust_nbr AS cust_nbr,
	ch.lcl_chnl_code AS cust_lcl_chnl_cd,
	COALESCE(CASE WHEN TRIM(re.COMPANY_NAME) = 'NULL' THEN NULL ELSE re.COMPANY_NAME end,ssc.cust_nm) AS cust_co_nm,
	NULL AS gbl_seg_desc,
	NULL AS sub_seg_desc,
	NULL AS sls_seg_desc,
	NULL AS sls_vert_desc,
	NULL AS ptnr_acct_type_cd,
	NULL AS ptnr_nm,
	NULL AS acct_rnkg_id,
	NULL AS rad_cd,
	NULL AS rad_nbr,
	NULL AS gtm_gmm_nbr,
	pgh.ISO_CTRY_CODE_2 AS iso_ctry_2_cd,
	cll.iso_lang_cd AS iso_lang_cd,
	NULL AS frst_nm,
	NULL AS last_nm,
	TRIM(td_sysfnlib.OREPLACE(re.FULL_NM,'"',''))  AS full_nm,
	NULL AS sfdc_cntct_id,
	TRIM(re.EMAIL_ADDR_ID) AS email_addr_id,
	TRIM(SUBSTR(re.EMAIL_ADDR_ID,  POSITION('@' IN re.email_addr_id) )) AS domain_email_addr,
	--TRIM(td_sysfnlib.OREPLACE(re.ph_nbr,'"',''))  AS ph_nbr,
	re.ph_nbr AS ph_nbr,
	NULL AS job_ttl_nm,
	NULL AS decsn_mkg_role_nm,
	NULL AS prsn_grtg_txt,
	NULL AS bnced_alert_flg,
	NULL AS no_rsp_alert_flg,
	NULL AS cntct_src_sys_nm,
	NULL AS signatory_nm,
	NULL AS signatory_ttl_nm,
	NULL AS ce_email_addr_id,
	re.SVC_TAG_ID AS extrnl_src_txn_id,
	'SVCTAG' AS extrnl_src_attr_nm,
	re.SVC_TAG_BU_ID AS extrnl_src_bu_id,
CASE WHEN (SELECT MAX(reg_date) FROM sas_pulse_stg.RTL_END_USERS_2 ) - re.reg_date < 180 THEN  '0-6 Months' 
			WHEN (SELECT MAX(reg_date) FROM sas_pulse_stg.RTL_END_USERS_2 ) - re.reg_date BETWEEN 180 AND 367 THEN  '7-12 Months'
			 ELSE '13-18 Months' END AS attr_1_val,
	prod.comb_hier_cd AS attr_2_val,
	re.STATE_PROV AS attr_3_val,
	'Tally' AS attr_4_val,
	'FY17 H1' AS attr_5_val
FROM  sas_pulse_stg.RTL_END_USERS_2  re	
INNER JOIN svc_base.cust_prod p ON re.svc_tag_id = p.asst_id AND re.svc_tag_bu_id = p.cust_bu_id
INNER JOIN corp_drm_pkg.chnl_hier ch ON p.cust_bu_id = ch.bu_id AND p.lcl_chnl_cd = ch.lcl_chnl_code
INNER JOIN corp_drm_pkg.phys_geo_hier pgh ON ch.bu_id = pgh.bu_id
LEFT OUTER JOIN ce_base.survey_ctry_lang_lkup cll ON pgh.bu_id = cll.bu_id AND pgh.iso_ctry_code_2 = cll.iso_ctry_2_cd
INNER JOIN itm_pkg.base_prod_hier_dim AS base_prod ON p.itm_cls_cd = base_prod.itm_cls_code				
INNER JOIN itm_pkg.comb_prod_hier prod ON base_prod.base_code = prod.comb_hier_cd
INNER JOIN corp_ww.format_fiscal_day_info sd ON p.shipd_dt = sd.format_actual_date
INNER JOIN corp_ww.format_fiscal_day_info rd ON re.reg_date = rd.format_actual_date
INNER JOIN party_pkg.sls_svc_cust ssc ON ch.bu_id = ssc.src_bu_id AND ch.lcl_chnl_code = ssc.lcl_chnl_cd AND p.cust_nbr = ssc.cust_nbr
WHERE ch.seg_code = 'COSLR' AND sd.format_fiscal_week_id >= 201540 AND prod.prod_grp_desc IN ('Consumer','CS SOFTWARE AND PERIPHERALS','Tablet Devices')	
AND TRIM(re.email_addr_id) NOT IN (SELECT TRIM(email_addr_id) FROM SAS_PULSE_STG.RTL_END_USERS_extrnl)
AND TRIM(re.svc_tag_bu_id) || '-' || TRIM(re.svc_tag_id) NOT IN (SELECT TRIM(TRAILING '.' FROM CAST(SVC_TAG_BU_ID AS  VARCHAR(20))) || '-' ||TRIM(SVC_TAG_ID) FROM SAS_PULSE_STG.RTL_END_USERS_extrnl)			
;

INSERT INTO SAS_PULSE_STG.RTL_END_USERS_extrnl ----SAS_PULSE_STG.ev_gbl_extrnl
(
	evnt_ldr_Id,
	evnt_type_cd,
	evnt_subtype_cd,
	evnt_dt,
	evnt_dts,
	cnsld_src_txn_id,
	cnsld_src_txn_bu_id,
	so_nbr,
	so_bu_id,
	so_lcl_chnl_cd,
	so_dt,
	so_inv_dt,
	qte_nbr,
	qte_bu_id,
	qte_lcl_chnl_cd,
	qte_dt,
	sls_rep_bdge_nbr,
	sls_rep_email_addr_id,
	acct_exec_bdge_nbr,
	acct_exec_email_addr_id,
	insd_sls_mgr_bdge_nbr,
	insd_sls_mgr_email_addr_id,
	rgnl_sls_mgr_bdge_nbr,
	rgnl_sls_mgr_email_addr_id,
	sys_itm_cls_nm,
	sys_flg,
	snp_flg,
	svcs_flg,
	sls_chnl_cd,
	tot_revn_disc_amt,
	svc_req_nbr,
	svc_req_type,
	svc_req_crt_dt,
	svc_req_clos_dt,
	svc_req_crtd_by_bdge_nbr,
	svc_req_owner_bdge_nbr,
	svc_req_last_actvy_dt,
	svc_req_last_actvy_bdge_nbr,
	svc_tag_bu_id,
	svc_tag_lcl_chnl_cd,
	svc_tag_id,
	wrnty_type_cd,
	wrnty_stat_cd,
	dspch_nbr,
	dspch_type_cd,
	dspch_stat_cd,
	dspch_stat_dt,
	auth_guid_cd,
	top_lvl_acct_id,
	grp_acct_id,
	grp_co_nm,
	acct_id,
	acct_co_nm,
	acct_prim_cntct_nm,
	acct_owner_email_addr_id,
	cust_bu_id,
	cust_nbr,
	cust_lcl_chnl_cd,
	cust_co_nm,
	gbl_seg_desc,
	sub_seg_desc,
	sls_seg_desc,
	sls_vert_desc,
	ptnr_acct_type_cd,
	ptnr_nm,
	acct_rnkg_id,
	rad_cd,
	rad_nbr,
	gtm_gmm_nbr,
	iso_ctry_2_cd,
	iso_lang_cd,
	frst_nm,
	last_nm,
	full_nm,
	sfdc_cntct_id,
	email_addr_id,
	domain_email_addr_id,
	ph_nbr,
	job_ttl_nm,
	decsn_mkg_role_nm,
	prsn_grtg_txt,
	bnced_alert_flg,
	no_rsp_alert_flg,
	cntct_src_sys_nm,
	signatory_nm,
	signatory_ttl_nm,
	ce_email_addr_id,
	extrnl_src_txn_id,
	extrnl_src_attr_nm,
	extrnl_src_bu_id,
	attr_1_val,
	attr_2_val,
	attr_3_val,
	attr_4_val,
	attr_5_val
)
SELECT	 DISTINCT
	320 AS evnt_ldr_id,
	'B2CNPS' AS evnt_type_cd,
	'RETAIL' AS evnt_subtype_cd,
	re.reg_date   AS evnt_dt,
	re.reg_date   AS evnt_dts,
	re.SVC_TAG_ID AS cnsld_src_txn_id,
	re.SVC_TAG_BU_ID AS cnsld_src_txn_bu_id,
	p.src_ord_nbr AS so_nbr,
	re.SVC_TAG_BU_ID AS so_bu_id,
	ch.lcl_chnl_code AS so_lcl_chnl_cd,
	NULL AS so_dt,
	NULL AS so_inv_dt,
	NULL AS qte_nbr,
	NULL AS qte_bu_id,
	NULL AS qte_lcl_chnl_cd,
	NULL AS qte_dt,
	NULL AS sls_rep_bdge_nbr,
	NULL AS sls_rep_email_addr_id,
	NULL AS acct_exec_bdge_nbr,
	NULL AS acct_exec_email_addr_id,
	NULL AS insd_sls_mgr_bdge_nbr,
	NULL AS insd_sls_mgr_email_addr_id,
	NULL AS rgnl_sls_mgr_bdge_nbr,
	NULL AS rgnl_sls_mgr_email_addr_id,
	p.ITM_CLS_CD AS sys_itm_cls_nm,
	NULL AS sys_flg,
	NULL AS snp_flg,
	NULL AS svcs_flg,
	NULL AS sls_chnl_cd,
	NULL AS tot_revn_disc_amt,
	NULL AS svc_req_nbr,
	NULL AS svc_req_type,
	NULL AS svc_req_crt_dt,
	NULL AS svc_req_clos_dt,
	NULL AS svc_req_crtd_by_bdge_nbr,
	NULL AS svc_req_owner_bdge_nbr,
	NULL AS svc_req_last_actvy_dt,
	NULL AS svc_req_last_actvy_bdge_nbr,
	re.SVC_TAG_BU_ID AS svc_tag_bu_id,
	ch.lcl_chnl_code AS svc_tag_lcl_chnl_cd,
	re.SVC_TAG_ID AS svc_tag_id,
	NULL AS wrnty_type_cd,
	NULL AS wrnty_stat_cd,
	NULL AS dspch_nbr,
	NULL AS dspch_type_cd,
	NULL AS dspch_stat_cd,
	NULL AS dspch_stat_dt,
	NULL AS auth_guid_cd,
	NULL AS top_lvl_acct_id,
	NULL AS grp_acct_id,
	NULL AS grp_co_nm,
	NULL AS acct_id,
	NULL AS acct_co_nm,
	NULL AS acct_prim_cntct_nm,
	NULL AS acct_owner_email_addr_id,
	re.SVC_TAG_BU_ID AS cust_bu_id,
	ssc.cust_nbr AS cust_nbr,
	ch.lcl_chnl_code AS cust_lcl_chnl_cd,
	COALESCE(CASE WHEN TRIM(re.COMPANY_NAME) = 'NULL' THEN NULL ELSE re.COMPANY_NAME end,ssc.cust_nm) AS cust_co_nm,
	NULL AS gbl_seg_desc,
	NULL AS sub_seg_desc,
	NULL AS sls_seg_desc,
	NULL AS sls_vert_desc,
	NULL AS ptnr_acct_type_cd,
	NULL AS ptnr_nm,
	NULL AS acct_rnkg_id,
	NULL AS rad_cd,
	NULL AS rad_nbr,
	NULL AS gtm_gmm_nbr,
	pgh.ISO_CTRY_CODE_2 AS iso_ctry_2_cd,
	cll.iso_lang_cd AS iso_lang_cd,
	NULL AS frst_nm,
	NULL AS last_nm,
	TRIM(td_sysfnlib.OREPLACE(re.FULL_NM,'"',''))  AS full_nm,
	NULL AS sfdc_cntct_id,
	TRIM(re.EMAIL_ADDR_ID) AS email_addr_id,
	TRIM(SUBSTR(re.EMAIL_ADDR_ID,  POSITION('@' IN re.email_addr_id) )) AS domain_email_addr,
	--TRIM(td_sysfnlib.OREPLACE(re.ph_nbr,'"',''))  AS ph_nbr,
	PH_NBR AS ph_nbr,
	NULL AS job_ttl_nm,
	NULL AS decsn_mkg_role_nm,
	NULL AS prsn_grtg_txt,
	NULL AS bnced_alert_flg,
	NULL AS no_rsp_alert_flg,
	NULL AS cntct_src_sys_nm,
	NULL AS signatory_nm,
	NULL AS signatory_ttl_nm,
	NULL AS ce_email_addr_id,
	re.SVC_TAG_ID AS extrnl_src_txn_id,
	'SVCTAG' AS extrnl_src_attr_nm,
	re.SVC_TAG_BU_ID AS extrnl_src_bu_id,
CASE WHEN (SELECT MAX(reg_date ) FROM sas_pulse_stg.RTL_END_USERS_3 ) - re.reg_date  < 180 THEN  '0-6 Months' 
			WHEN (SELECT MAX(reg_date ) FROM sas_pulse_stg.RTL_END_USERS_3 ) - re.reg_date  BETWEEN 180 AND 367 THEN  '7-12 Months'
			 ELSE '13-18 Months' END AS attr_1_val,
	prod.comb_hier_cd AS attr_2_val,
	re.STATE_PROV AS attr_3_val,
	null AS attr_4_val,
	'FY17 H1' AS attr_5_val
FROM  sas_pulse_stg.RTL_END_USERS_3  re	
INNER JOIN svc_base.cust_prod p ON re.svc_tag_id = p.asst_id AND re.svc_tag_bu_id = p.cust_bu_id
INNER JOIN corp_drm_pkg.chnl_hier ch ON p.cust_bu_id = ch.bu_id AND p.lcl_chnl_cd = ch.lcl_chnl_code
INNER JOIN corp_drm_pkg.phys_geo_hier pgh ON ch.bu_id = pgh.bu_id
LEFT OUTER JOIN ce_base.survey_ctry_lang_lkup cll ON pgh.bu_id = cll.bu_id AND pgh.iso_ctry_code_2 = cll.iso_ctry_2_cd
INNER JOIN itm_pkg.base_prod_hier_dim AS base_prod ON p.itm_cls_cd = base_prod.itm_cls_code				
INNER JOIN itm_pkg.comb_prod_hier prod ON base_prod.base_code = prod.comb_hier_cd
INNER JOIN corp_ww.format_fiscal_day_info sd ON p.shipd_dt = sd.format_actual_date
INNER JOIN corp_ww.format_fiscal_day_info rd ON re.reg_date  = rd.format_actual_date
INNER JOIN party_pkg.sls_svc_cust ssc ON ch.bu_id = ssc.src_bu_id AND ch.lcl_chnl_code = ssc.lcl_chnl_cd AND p.cust_nbr = ssc.cust_nbr
WHERE ch.seg_code IN ('COSLR','SMBSH') AND sd.format_fiscal_week_id >= 201540 AND prod.prod_grp_desc IN ('Consumer','CS SOFTWARE AND PERIPHERALS','Tablet Devices')	
AND TRIM(re.email_addr_id) NOT IN (SELECT TRIM(email_addr_id) FROM SAS_PULSE_STG.RTL_END_USERS_extrnl)
AND TRIM(re.svc_tag_bu_id) || '-' || TRIM(re.svc_tag_id) NOT IN (SELECT TRIM(TRAILING '.' FROM CAST(SVC_TAG_BU_ID AS  VARCHAR(20))) || '-' ||TRIM(SVC_TAG_ID) FROM SAS_PULSE_STG.RTL_END_USERS_extrnl)
AND ch.lcl_Chnl_Code IN ('22667','23716','23716','85907','73957','83957') -- Indonesian Local Channel Code
;


del from SAS_PULSE_STG.RTL_END_USERS_tmp all;
insert into SAS_PULSE_STG.RTL_END_USERS_tmp
select * 
FROM  SAS_PULSE_STG.RTL_END_USERS_extrnl tmp 		
WHERE 
tmp.email_addr_id NOT IN (SELECT TRIM(es.email_address) FROM marcom.email_subscriber es WHERE es.emailable_flag = 'N')
AND tmp.email_addr_id NOT IN 
(
sel email_address from  SAS_PULSE_STG.fy17h2m11_nps_audience union 
sel email_address from  SAS_PULSE_STG.FY17H2M12_NPS_AUDIENCE union 
sel email_addr_id from sas_pulse_stg.comm_nps_aud_inv union
sel email_address from  SAS_PULSE_STG.FY18H1M01_NPS_AUDIENCE  union
sel email_address from  SAS_PULSE_STG.FY18H1M02_NPS_AUDIENCE  
)
AND tmp.email_addr_id NOT IN (SELECT EMAIL_ADDR_ID FROM CE_BASE.SURVEY_DO_NOT_DSTRB_LIST) 	
AND tmp.domain_email_addr_id NOT IN (SELECT EMAIL_ADDR_ID FROM CE_BASE.SURVEY_DO_NOT_DSTRB_LIST) 	
AND tmp.email_addr_id NOT IN 
(
SEL email_address FROM SAS_PULSE_STG.CSB_NPS_AUDIENCE_SB_DDW UNION 
SEL email_address FROM SAS_PULSE_STG.CSB_NPS_AUDIENCE_SB_SFDC UNION 
SEL email_addr_id AS email_address FROM SAS_PULSE_STG.b2c_ev_gbl_extrnl union
SEL email_address FROM SAS_PULSE_STG.CSB_NPS_AUDIENCE_CON_DDW union
SEL email_address FROM SAS_PULSE_STG.CSB_NPS_AUDIENCE_CON_RTL 
)
;


---Checking Duplicate record 
Select svc_tag_Id,Svc_tag_Bu_Id 
From SAS_PULSE_STG.RTL_END_USERS_extrnl 
Group by 1,2
Having count(1) >1
;

DEL FROM SAS_PULSE_STG.RTL_END_USERS_extrnl WHERE svc_tag_id IN (
---Checking Duplicate record 
SELECT svc_tag_Id 
FROM SAS_PULSE_STG.RTL_END_USERS_extrnl 
GROUP BY 1
HAVING COUNT(svc_tag_Id ) >1
)

/****** Insert into ce_base stg table. Insert will be trigger by AP job ******/
del from SAS_PULSE_STG.b2c_ev_gbl_extrnl_rtl all;
insert into SAS_PULSE_STG.b2c_ev_gbl_extrnl_rtl
SELECT * FROM  SAS_PULSE_STG.RTL_END_USERS_tmp tmp 	
sample
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '0-6 Months' AND cust_co_nm = 	'BEST BUY PURCHASING LLC' THEN 	2782
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '0-6 Months' AND cust_co_nm = 	'QVC INC' THEN 	522
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '0-6 Months' AND cust_co_nm = 	'STAPLES INC' THEN 	507
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '0-6 Months' AND cust_co_nm = 	'WAL-MART STORES' THEN 	481
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '0-6 Months' AND cust_co_nm = 	'OFFICE DEPOT B2B' THEN 	420
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '0-6 Months' AND cust_co_nm = 	'SAM''S CLUB STORES' THEN 	187
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '0-6 Months' AND cust_co_nm = 	'COSTCO WHOLESALE' THEN 	167
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '0-6 Months' AND cust_co_nm = 	'AMAZON COM' THEN 	162
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '0-6 Months' AND cust_co_nm = 	'OFFICEMAX B2B' THEN 	148
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '0-6 Months' AND cust_co_nm = 	'MICRO CENTER, INC' THEN 	136
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '0-6 Months' AND cust_co_nm = 	'COSTCO WHOLESALE GROUP' THEN 	112
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '0-6 Months' AND cust_co_nm = 	'C R MCMULLEN CO , INC' THEN 	83
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '0-6 Months' AND cust_co_nm = 	'FRY''S ELECTRONICS' THEN 	55
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '0-6 Months' AND cust_co_nm = 	'D&H DISTRIBUTING CO' THEN 	29
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '0-6 Months' AND cust_co_nm = 	'MAGNELL ASSOC' THEN 	25
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '0-6 Months' AND cust_co_nm = 	'O''ROURKE' THEN 	14
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '0-6 Months' AND cust_co_nm = 	'AAFES COM VENDOR NET' THEN 	12
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '0-6 Months' AND cust_co_nm = 	'RENT-A-CENTER, INC' THEN 	10
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '0-6 Months' AND cust_co_nm = 	'SAM''S CLUB' THEN 	2
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '0-6 Months' AND cust_co_nm = 	'MICROSOFT' THEN 	1
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '7-12 Months' AND cust_co_nm = 	'BEST BUY PURCHASING LLC' THEN 	2502
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '7-12 Months' AND cust_co_nm = 	'QVC INC' THEN 	469
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '7-12 Months' AND cust_co_nm = 	'STAPLES INC' THEN 	456
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '7-12 Months' AND cust_co_nm = 	'WAL-MART STORES' THEN 	433
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '7-12 Months' AND cust_co_nm = 	'OFFICE DEPOT B2B' THEN 	378
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '7-12 Months' AND cust_co_nm = 	'SAM''S CLUB STORES' THEN 	168
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '7-12 Months' AND cust_co_nm = 	'COSTCO WHOLESALE' THEN 	150
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '7-12 Months' AND cust_co_nm = 	'AMAZON COM' THEN 	146
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '7-12 Months' AND cust_co_nm = 	'OFFICEMAX B2B' THEN 	133
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '7-12 Months' AND cust_co_nm = 	'MICRO CENTER, INC' THEN 	123
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '7-12 Months' AND cust_co_nm = 	'COSTCO WHOLESALE GROUP' THEN 	100
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '7-12 Months' AND cust_co_nm = 	'C R MCMULLEN CO , INC' THEN 	75
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '7-12 Months' AND cust_co_nm = 	'FRY''S ELECTRONICS' THEN 	49
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '7-12 Months' AND cust_co_nm = 	'D&H DISTRIBUTING CO' THEN 	26
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '7-12 Months' AND cust_co_nm = 	'MAGNELL ASSOC' THEN 	22
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '7-12 Months' AND cust_co_nm = 	'O''ROURKE' THEN 	13
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '7-12 Months' AND cust_co_nm = 	'AAFES COM VENDOR NET' THEN 	11
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '7-12 Months' AND cust_co_nm = 	'RENT-A-CENTER, INC' THEN 	30
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '7-12 Months' AND cust_co_nm = 	'SAM''S CLUB' THEN 	2
WHEN iso_ctry_2_cd = 'US' AND attr_1_val = '7-12 Months' AND cust_co_nm = 	'MICROSOFT' THEN 	1


WHEN attr_1_val = '0-6 Months' AND iso_ctry_2_cd = 'IN' AND (attr_4_val IS NULL OR attr_4_val <> 'Tally' ) THEN 388
WHEN attr_1_val = '0-6 Months' AND iso_ctry_2_cd = 'IN' AND attr_4_val = 'Tally' THEN 1555
WHEN attr_1_val = '7-12 Months' AND iso_ctry_2_cd = 'IN' AND (attr_4_val IS NULL OR attr_4_val <> 'Tally' ) THEN 266
WHEN attr_1_val = '7-12 Months' AND iso_ctry_2_cd = 'IN' AND attr_4_val = 'Tally'  THEN 1064

WHEN attr_1_val = '0-6 Months' AND iso_ctry_2_cd = 'BR' THEN 1500
WHEN attr_1_val = '7-12 Months' AND iso_ctry_2_cd = 'BR' THEN 1380
WHEN attr_1_val = '0-6 Months' AND iso_ctry_2_cd = 'CN' THEN 2036
WHEN attr_1_val = '7-12 Months' AND iso_ctry_2_cd = 'CN' THEN 1368

WHEN attr_1_val = '0-6 Months' AND iso_ctry_2_cd = 'AU' THEN 1304
WHEN attr_1_val = '7-12 Months' AND iso_ctry_2_cd = 'AU' THEN 1186

/*
WHEN attr_1_val = '0-6 Months' AND iso_ctry_2_cd = 'ID' THEN 200
WHEN attr_1_val = '7-12 Months' AND iso_ctry_2_cd = 'ID' THEN 50
WHEN attr_1_val = '0-6 Months' AND iso_ctry_2_cd = 'MX' THEN 230
WHEN attr_1_val = '7-12 Months' AND iso_ctry_2_cd = 'MX' THEN 623
*/
end

;



select max(adnc_seltn_id) from
(
select max(adnc_seltn_id) as adnc_seltn_id from  SAS_PULSE_STG.b2b_adnc_seltn_ids union
select max(adnc_seltn_id) as adnc_seltn_id from  SAS_PULSE_STG.b2c_adnc_seltn_ids
) xc


insert into SAS_PULSE_STG.b2c_adnc_seltn_ids
select
	(ROW_NUMBER() OVER (ORDER BY cnsld_src_txn_id, cnsld_src_txn_bu_id) + 811847020),
	 cnsld_src_txn_id, cnsld_src_txn_bu_id
from SAS_PULSE_STG.b2c_ev_gbl_extrnl_rtl
;
DELETE FROM SAS_PULSE_STG.CSB_NPS_AUDIENCE_CON_RTL ALL;
INSERT INTO SAS_PULSE_STG.CSB_NPS_AUDIENCE_CON_RTL
SEL 
NULL        AS          EVNT_ID              ,
a.adnc_seltn_id     AS          PULSE_ADNC_SELTN_ID               ,
ev.FULL_NM           AS          CONTACT_NAME             ,
ev.EMAIL_ADDR_ID             AS          EMAIL_ADDRESS              ,
td_sysfnlib.oreplace(td_sysfnlib.oreplace(ev.PH_NBR,'09'XC,' '),'0D0A'XC,' ')      AS          PHONE_NUMBER                ,
lnk_lkup.enum_lang     AS          'LANGUAGE'n   ,
lnk_lkup.Survey_Close_DT          AS          SURVEY_CLOSE_DATE   ,
CASE WHEN direct_flg = 'x' THEN lnk_lkup.supp_link  ELSE NULL END   AS          SUPPORT_LINK ,
CASE WHEN direct_flg = 'x' THEN lnk_lkup.prv_link  ELSE NULL END       AS          PRIVACY_LINK  ,
TRIM(TRAILING '.' FROM CAST(ev.CUST_BU_ID AS VARCHAR(20))) || '-' || TRIM(ev.cust_lcl_chnl_cd)   AS          ACCOUNT_ID                ,
'B2C NPS'            AS          SURVEY                ,
'FY18 H1'             AS          WAVE   ,
'No'       AS          OVERSAMPLE_FLAG       ,
ev.attr_1_val   AS          PURCHASE_RECENCY    ,
TRIM(TRAILING '.' FROM CAST(ev.SO_BU_ID AS  VARCHAR(20))) || '-' ||TRIM(ev.SO_NBR)            AS          ORDER_NUMBER             ,
TRIM(TRAILING '.' FROM CAST(ev.SVC_TAG_BU_ID AS  VARCHAR(20))) || '-' ||TRIM(ev.SVC_TAG_ID)       AS          SVC_TAG             ,
CAST(CAST(TRIM(SUBSTR(coalesce(ev.SO_DT,ev.evnt_dt),1,10))               AS  DATE FORMAT'YYYY-MM-DD')         AS VARCHAR(10)) AS  ORDER_DATE     ,
TRIM(TRAILING '.' FROM CAST(ev.CUST_BU_ID AS VARCHAR(20))) || '-' ||TRIM(ev.CUST_NBR)       AS          CUSTOMER_NUMBER   ,

COALESCE( RSP_ST.rsp_status, 'Not-Invited') AS REPEAT_RESPONDERS,
NULL AS ACCOUNT_TYPE,

NULL     AS          CONTACT_ID     ,
'Unknown/Blank'            AS          DECISION_MAKING_ROLE           ,
NULL   AS          SALUTATION      ,
NULL       AS          SIGNATORY_NAME_1   ,
NULL         AS          SIGNATORY_TITLE_1      ,
NULL     AS          SIGNATORY_NAME_2   ,
NULL     AS          SIGNATORY_TITLE_2      ,
NULL          AS          LETTER_CUST_TYPE        ,
'No'       AS          SERVICES_CONTACT_FLAG         ,
'No'       AS          SOFTWARE_CONTACT_FLAG     ,
NULL     AS          SFDC_TASK_LINK             ,
NULL     AS          SR_EMAIL           ,
NULL     AS          AE_EMAIL           ,
NULL     AS          ISM_EMAIL        ,
NULL     AS          RSM_EMAIL       ,
NULL     AS          GAM_EMAIL      ,
NULL     AS          TAM_EMAIL       ,
NULL     AS          CAM_EMAIL      ,
NULL     AS          PDM_EMAIL      ,
NULL     AS          GCP_PM_EMAIL              ,
NULL     AS          OEM_SE_EMAIL               ,
NULL     AS          OEM_PM_EMAIL             ,
NULL     AS          SERVICES_PPOC_EMAIL               ,
NULL     AS          SERVICES_DELEGATE_EMAIL      ,
NULL     AS          SERVICES_OPS_LEAD_EMAIL     ,
NULL     AS          SERVICES_MAILBOX_EMAIL       ,
NULL     AS          CX_EMAIL           ,
NULL     AS          DET_TASK_OWNER_ID ,
NULL     AS          PAS_TASK_OWNER_ID ,
NULL     AS          PRO_TASK_OWNER_ID ,
TRIM(TRAILING '.' FROM CAST(ev.CUST_BU_ID AS VARCHAR(20))) || '-' ||TRIM(ev.CUST_NBR)      AS          SUB_ACCOUNT_ID         ,
ev.cust_co_nm     AS          SUB_ACCOUNT_NAME ,
NULL     AS          JOB_TITLE           ,
CASE 
	WHEN ev.sls_chnl_cd = 'ONLINE' THEN 'Online' 
	WHEN ev.sls_chnl_cd = 'OFFLINE' THEN 'Offline' 
	WHEN ev.evnt_subtype_CD = 'RETAIL' then 'Retail' end           AS                 TRANS_SALES_CHANNEL             ,
case when prod.PROD_GRP_DESC in  ('Consumer','Tablet Devices','Thin Client') then 'Client Products'		
	when prod.PROD_GRP_DESC = 'CS SOFTWARE AND PERIPHERALS' then 'Client S&P'		
	else prod.PROD_GRP_DESC end as PRODUCT_LVL1,		
case when prod.LOB_DESC = 'CS 3RD PARTY SOFTWARE' then '3rd Party Software'			
	when prod.LOB_DESC = 'CLIENT PERIPHERALS' then		
		case when prod.BRAND_CATG_DESC = 'PARTNER' then '3rd Party Peripherals'	
			when prod.BRAND_CATG_DESC = 'DELL-BRANDED' then 'Dell-Branded Peripherals'
			else 'Peripherals' end
	when prod.LOB_DESC = 'DISPLAYS' then		
		case when prod.BRAND_CATG_DESC = 'PARTNER' then '3rd Party Displays'	
			when prod.BRAND_CATG_DESC = 'DELL-BRANDED' then 'Dell-Branded Displays'
			else 'Displays' end
	else prod.LOB_DESC end as PRODUCT_LVL2,		
case when prod.LOB_DESC in ('CS 3RD PARTY SOFTWARE',  'CLIENT PERIPHERALS', 'DISPLAYS') then prod.BASE_PROD_OFFRG_GRP_DESC			
	else prod.BRAND_CATG_DESC end as PRODUCT_LVL3,		
case when prod.LOB_DESC in ('CS 3RD PARTY SOFTWARE',  'CLIENT PERIPHERALS', 'DISPLAYS') then prod.PROD_OFFRG_DESC end as PRODUCT_LVL4,			
coalesce(ev.attr_2_val, ev.attr_3_val) as PRODUCT_LVL5			
FROM SAS_PULSE_STG.b2c_ev_gbl_extrnl_rtl ev
INNER JOIN SAS_PULSE_STG.b2c_adnc_seltn_ids a on ev.cnsld_src_txn_id = a.cnsld_src_txn_id and ev.cnsld_src_txn_bu_id = a.cnsld_src_txn_bu_id
LEFT OUTER JOIN sas_pulse_stg.comm_nps_link_lkup lnk_lkup ON ev.iso_ctry_2_cd = lnk_lkup.iso_ctry_cd AND ev.iso_lang_cd=lnk_lkup.ISO_LANG_CD
inner join itm_pkg.comb_prod_hier prod on coalesce(ev.attr_2_val, ev.attr_3_val)  = prod.comb_hier_cd	
LEFT OUTER JOIN SAS_PULSE_STG.COMM_NPS_PREV_RESP_STATUS rsp_st ON EV.email_addr_ID = rsp_st.email_address
;

update SAS_PULSE_STG.CSB_NPS_AUDIENCE_CON_RTL
set contact_name = trim(td_sysfnlib.oreplace(td_sysfnlib.oreplace(contact_name,'09'XC,' '),'0D0A'XC,' '));  

delete from  SAS_PULSE_STG.CSB_NPS_AUDIENCE_CON_RTL where product_lvl5 in ('DSE2716HN',
'DUZ2315HN',
'DSE2216HN',
'DP2314TN',
'DE2416HN',
'DSE2416HN'
);

create table tmp_work_db.b2b_acct_medallia_6 as SAS_PULSE_STG.medallia_nps_acct_master with no data; 


insert into tmp_work_db.b2b_acct_medallia_6
select
	a.ACCOUNT_ID as ACCOUNT_ID,	
	ch.lcl_chnl_desc as ACCOUNT_NAME,	
	'Transactional' as CUSTOMER_REL_TYPE,
	null as ACCOUNT_TYPE,
	null as ACCOUNT_RANKING,
	'CSB12' AS SALES_SEG_LVL1, 
	pgh.ctry_desc  AS SALES_SEG_LVL2,
	'Direct'  AS SALES_SEG_LVL3,
	'SB' AS SALES_SEG_LVL4,
	case when pgh.ctry_desc = 'United States' and ch.seg_code not in  ('COSLA','COSLR')  then 
			case 
				when ch.seg_code = 'CSEPP' then 'MPP'
				when ch.seg_code = 'COSLO' then 'Online'
				else 'Offline'
			end
	else null end as SALES_SEG_LVL5,	
	'[' || a.account_id || '] ' || ch.lcl_chnl_desc as SALES_SEG_LVL6,	
	'Consumer' as GLOBAL_SEGMENT,
	wt.weightid as WEIGHT_ID,
	case when pgh.ctry_desc in ('United States','Canada') then 'NA'	
		when pgh.rgn_desc = 'Americas' then 'LA'
		else pgh.rgn_desc end AS REGION,
	case when pgh.ctry_desc = 'Australia' then 'ANZ' else pgh.ctry_desc end as SUB_REGION,	
	pgh.ctry_desc as COUNTRY,
	null as RAD_CODE,	
	null as GLOBAL_ACCOUNT_ID,	
	null as GLOBAL_ACCOUNT_NAME,	
	null as GMM,	
	null as PARTNER_REL_TYPE,	
	null as PARTNER_TYPE,	
	null as PARTNER_TIER,	
	null as PARTNER_CERT,	
	null as SERVICES_INDUSTRY,
	'YES' AS ACTIVE_FLG
from SAS_PULSE_STG.CSB_NPS_AUDIENCE_CON_RTL a
inner join corp_drm_pkg.phys_geo_hier pgh on substring(a.account_id,1,position('-' in  a.account_id)-1) = pgh.bu_id    
inner join corp_drm_pkg.chnl_hier  ch on substring(a.account_id,1,position('-' in  a.account_id)-1) 
	= ch.bu_id and substring(a.account_id,position('-' in  a.account_id)+1,character_length(a.account_id)) = ch.lcl_chnl_code
--left outer join sas_pulse_stg.COMM_NPS_CTRY_SEG_WT wt on pgh.iso_ctry_code_2 = wt.iso_country_code and wt.global_segment = 'CONS' and case when ch.seg_code = 'COSLR' then 'Retail' when ch.seg_code = 'COSLA' then 'GDO' else 'Direct' end = wt.sub_segment
left outer join SAS_GBL_CEANALYTICS_STAG.rsc_FY17_rev_SSL4_BU wt on  '[' || a.account_id || '] ' || ch.lcl_chnl_desc =WT.SSL6
where survey = 'B2C NPS' and a.ACCOUNT_ID not in (select ACCOUNT_ID from SAS_PULSE_STG.medallia_nps_acct_master)
group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24
;


sel iso_ctry_2_cd, attr_1_val, 'curr' as wave, count(*) from SAS_PULSE_STG.b2c_ev_gbl_extrnl_rtl
where evnt_subtype_cd <> 'RETAIL'
group by 1,2,3
union
sel iso_ctry_2_cd, attr_1_val,'m09' as wave, count(*) from SAS_PULSE_STG.b2c_fy17h2m10_ev_gbl_extrnl
where evnt_subtype_cd <> 'RETAIL'
group by 1,2,3
;

Update SAS_PULSE_STG.CSB_NPS_AUDIENCE_CON_RTL
set 'language'n='Hindi'
where account_id in (sel account_id from SAS_PULSE_STG.medallia_nps_acct_master where country = 'India' )
and trans_sales_channel = 'Retail'


INSERT INTO tmp_work_db.b2b_acct_medallia_3
SELECT
	a.ACCOUNT_ID AS ACCOUNT_ID,	
	ch.lcl_chnl_desc AS ACCOUNT_NAME,	
	'Transactional' AS CUSTOMER_REL_TYPE,
	NULL AS ACCOUNT_TYPE,
	NULL AS ACCOUNT_RANKING,
	CASE WHEN pgh.ctry_desc IN ('Brazil','Mexico','China','India','Japan','United States','Canada','United Kingdom') THEN 'CSB9' 	
		WHEN pgh.ctry_desc = 'Australia' THEN 'APJ CSES' 
		WHEN pgh.ctry_desc IN ('France','Germany') THEN 'EMEA CSES' end AS SALES_SEG_LVL1,
	CASE WHEN pgh.ctry_desc IN ('Brazil','Mexico','China','India','Japan','United States','Canada','United Kingdom') THEN pgh.ctry_desc	
		WHEN pgh.ctry_desc = 'Australia' THEN 'ANZ' 
		WHEN pgh.ctry_desc IN ('France','Germany') THEN pgh.ctry_desc end AS SALES_SEG_LVL2,
	CASE WHEN pgh.ctry_desc IN ('Brazil','Mexico','China','India','Japan','United States','Canada','United Kingdom') THEN
			CASE 
				WHEN ch.seg_code = 'COSLA' THEN 'GDO'
				WHEN ch.seg_code = 'COSLR' THEN 'Retail'
				ELSE 'Direct' end	
		WHEN pgh.ctry_desc = 'Australia' THEN pgh.ctry_desc
		WHEN pgh.ctry_desc IN ('France','Germany') THEN 'Consumer' end AS SALES_SEG_LVL3,
	CASE WHEN pgh.ctry_desc IN ('Brazil','Mexico','China','India','Japan','United States','Canada','United Kingdom') THEN
			CASE 
				WHEN ch.seg_code NOT IN  ('COSLA','COSLR') THEN 'Consumer'
				ELSE NULL end	
		WHEN pgh.ctry_desc = 'Australia' THEN 'Consumer'
		WHEN pgh.ctry_desc IN ('France','Germany') THEN NULL end AS SALES_SEG_LVL4,
	CASE WHEN pgh.ctry_desc = 'United States' AND ch.seg_code NOT IN  ('COSLA','COSLR')  THEN 
			CASE 
				WHEN ch.seg_code = 'CSEPP' THEN 'MPP'
				WHEN ch.seg_code = 'COSLO' THEN 'Online'
				ELSE 'Offline'
			end
	ELSE NULL end AS SALES_SEG_LVL5,	
	'[' || a.account_id || '] ' || ch.lcl_chnl_desc AS SALES_SEG_LVL6,	
	'Consumer' AS GLOBAL_SEGMENT,
	wt.weightid AS WEIGHT_ID,
	CASE WHEN pgh.ctry_desc IN ('United States','Canada') THEN 'NA'	
		WHEN pgh.rgn_desc = 'Americas' THEN 'LA'
		ELSE pgh.rgn_desc end AS REGION,
	CASE WHEN pgh.ctry_desc = 'Australia' THEN 'ANZ' ELSE pgh.ctry_desc end AS SUB_REGION,	
	pgh.ctry_desc AS COUNTRY,
	NULL AS RAD_CODE,	
	NULL AS GLOBAL_ACCOUNT_ID,	
	NULL AS GLOBAL_ACCOUNT_NAME,	
	NULL AS GMM,	
	NULL AS PARTNER_REL_TYPE,	
	NULL AS PARTNER_TYPE,	
	NULL AS PARTNER_TIER,	
	NULL AS PARTNER_CERT,	
	NULL AS SERVICES_INDUSTRY,
	'YES' AS ACTIVE_FLG
FROM SAS_PULSE_STG.CSB_NPS_AUDIENCE_CON_RTL a
INNER JOIN corp_drm_pkg.phys_geo_hier pgh ON SUBSTRING(a.account_id,1,POSITION('-' IN  a.account_id)-1) = pgh.bu_id    
INNER JOIN corp_drm_pkg.chnl_hier  ch ON SUBSTRING(a.account_id,1,POSITION('-' IN  a.account_id)-1) 
	= ch.bu_id AND SUBSTRING(a.account_id,POSITION('-' IN  a.account_id)+1,CHARACTER_LENGTH(a.account_id)) = ch.lcl_chnl_code
--left outer join sas_pulse_stg.COMM_NPS_CTRY_SEG_WT wt on pgh.iso_ctry_code_2 = wt.iso_country_code and wt.global_segment = 'CONS' and case when ch.seg_code = 'COSLR' then 'Retail' when ch.seg_code = 'COSLA' then 'GDO' else 'Direct' end = wt.sub_segment
LEFT OUTER JOIN SAS_GBL_CEANALYTICS_STAG.rsc_FY17_rev_SSL4_BU wt ON  '[' || a.account_id || '] ' || ch.lcl_chnl_desc =WT.SSL6
--WHERE survey = 'B2C NPS' AND a.ACCOUNT_ID NOT IN (SELECT ACCOUNT_ID FROM SAS_PULSE_STG.medallia_nps_acct_master)
GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24
;

/*
update SAS_PULSE_STG.CSB_NPS_AUDIENCE_CON_RTL
set 
'language'n='Indonesian',
survey_close_date = '24/01/2016',
support_link ='http://supportapj.dell.com/support/index.aspx?c=id&l=en&s=gen&~ck=cr',
privacy_link ='http://www.dell.com/learn/id/en/incorp1/policies-privacy?c=in&cs=incorp1&l=en&s=corp'
where 'language'n is null
;*/