CREATE OR REPLACE VIEW LOOKER_VIEWS.BASE_SCHEMA.FB_ADS_INS_ACTION_VALUES AS
SELECT DISTINCT
ads.ACCOUNT_ID
,ads.ACCOUNT_NAME
,ads.ADSET_ID
,ads.ADSET_NAME
,ads.CAMP_ID
,ads.CAMP_NAME
,ads.AD_ID
,ads.AD_NAME
,ads.DATE_START
,ads.DATE_STOP
,a.value:"action_type"::VARCHAR AS ACTION_TYPE
,a.value:"value" AS ACTION_COUNT
,av.value:"value" AS ACTION_VALUE
FROM ETL.FACEBOOK_ADS.ADS_INSIGHTS ads,
lateral flatten(input => ads.ACTIONS) a,
LATERAL flatten(input => ads.ACTION_VALUES) av
WHERE a.value:"action_type"::VARCHAR = 'offsite_conversion.fb_pixel_purchase'
AND av.value:"action_type"::VARCHAR = 'offsite_conversion.fb_pixel_purchase';
