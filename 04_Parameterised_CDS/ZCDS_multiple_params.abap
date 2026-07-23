@AbapCatalog.sqlViewName: 'ZCDS_IP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds view with input parameters'
define view zcds_input_params 
with parameters p_mtype : mtart, p_mgroup : matkl 
as select from mara
{
    key matnr,
    mtart,
    matkl,
    ntgew
}where mtart = :p_mtype
and matkl = :p_mgroup
