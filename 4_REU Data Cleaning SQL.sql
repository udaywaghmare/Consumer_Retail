ct tmp_work_db.RTL_END_USERS_1 as sas_pulse_stg.RTL_END_USERS_1 with data; 
ct tmp_work_db.RTL_END_USERS_2 as sas_pulse_stg.RTL_END_USERS_2 with data; 
ct tmp_work_db.RTL_END_USERS_3 as sas_pulse_stg.RTL_END_USERS_3 with data; 
delete from sas_pulse_stg.RTL_END_USERS_1 all; 
delete from sas_pulse_stg.RTL_END_USERS_2 all; 
delete from sas_pulse_stg.RTL_END_USERS_3 all;

update sas_pulse_stg.RTL_END_USERS_2 set COUNTRY_REGISTRATION = 'IN' , DIRECT_FLG = 'T' ;


Select a.EMAIL_ADDR_ID
From (select * from sas_pulse_stg.RTL_END_USERS_1 qualify rank() over (partition by email_addr_id order by reg_date desc, svc_tag_id desc) = 1) a
Group by 1 
having count(1) > 1 
;

--Old

delete from sas_pulse_stg.RTL_END_USERS all; 
insert into sas_pulse_stg.RTL_END_USERS
select 
COMPANY_NAME	,
CAST(reg_date AS DATE FORMAT 'yyyy-mm-dd')	,
--CAST(reg_date AS DATE FORMAT 'mm/dd/yyyy')	,
SVC_TAG_ID	,
SVC_TAG_BU_ID	,
SO_NBR	,
CUST_NBR	,
PROD_LINE_DESC	,
GROUP_DESC	,
EMAIL_ADDR_ID	,
FULL_NM	,
STATE_PROV	,
DIRECT_FLG	,
COUNTRY_REGISTRATION	,
PH_NBR
FROM sas_pulse_stg.RTL_END_USERS_1
qualify rank() over (partition by email_addr_id order by reg_date desc, svc_tag_id desc) = 1


Select EMAIL_ADDR_ID
From sas_pulse_stg.RTL_END_USERS_FY17H2M12
Group by 1 
having count(1) > 1 

















----OLD -------------------------------------------------------------------------------------------------------------------



----Checking Tally record match with Merkel 
Select Count(1), Sum(Case When B.Svc_tag_Id IS NULL THen 0 ELse 1 End)  AS Match_Record
From sas_pulse_stg.RTL_END_USERS_1 A 
Left Join 
(
Select  *  From 
(
Select *
From sas_pulse_stg.RTL_END_USERS_IND
QUALIFY RANK() OVER( Partition by svc_tag_id,svc_tag_bu_id order by reg_date desc,Cust_Nbr desc, Prod_Line_Desc desc) = 1  
) A 
QUALIFY RANK() OVER(Partition by EMAIL_ADDR_ID order by reg_date desc , Svc_tag_Id , Group_Desc ) = 1  
) B on A.Svc_tag_id = B.Svc_tag_id And A.Svc_Tag_BU_Id = B.Svc_Tag_Bu_Id 
Where A.Country_Registration = 'IN'

--Merkel : Checking  Duplicate email_Id
Select EMAIL_ADDR_ID
From sas_pulse_stg.RTL_END_USERS_1
Group by 1 
having count(1) > 1 

--Merkel 
Select *
From sas_pulse_stg.RTL_END_USERS_1;



--Tally : Checking  Duplicate email_Id
Select EMAIL_ADDR_ID from(
Select  *  From 
(
Select *
From sas_pulse_stg.RTL_END_USERS_IND
QUALIFY RANK() OVER( Partition by svc_tag_id,svc_tag_bu_id order by reg_date desc,Cust_Nbr desc, Prod_Line_Desc desc) = 1  
) A 
QUALIFY RANK() OVER(Partition by EMAIL_ADDR_ID order by reg_date desc , Svc_tag_Id , Group_Desc ) = 1  
) A Group by 1 having count(1) >1 



--Tally
Select  *  From 
(
Select *
From sas_pulse_stg.RTL_END_USERS_IND
QUALIFY RANK() OVER( Partition by svc_tag_id,svc_tag_bu_id order by reg_date desc,Cust_Nbr desc, Prod_Line_Desc desc) = 1  
) A 
QUALIFY RANK() OVER(Partition by EMAIL_ADDR_ID order by reg_date desc , Svc_tag_Id , Group_Desc ) = 1  



--Merkel : 1903477 rows processed.
Insert into SAS_PULSE_STG.RTL_END_USERS_FY15H2
Select *
From sas_pulse_stg.RTL_END_USERS_1;


--Tally : 9053 rows processed.
Insert into SAS_PULSE_STG.RTL_END_USERS_FY15H2
Select  *  From 
(
Select *
From sas_pulse_stg.RTL_END_USERS_IND
QUALIFY RANK() OVER( Partition by svc_tag_id,svc_tag_bu_id order by reg_date desc,Cust_Nbr desc, Prod_Line_Desc desc) = 1  
) A 
QUALIFY RANK() OVER(Partition by EMAIL_ADDR_ID order by reg_date desc , Svc_tag_Id , Group_Desc ) = 1  ;


---REU Final Audience 1912530 
Select Count(1) From SAS_PULSE_STG.RTL_END_USERS_FY15H2
