@AbapCatalog.sqlViewName: 'ZJOINS_CDS1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Joins'
define view Zjoins_cds as select from vbak as _sheader
right outer join I_AddressEmailAddress as _email on _customer.adrnr = _email.AddressID
{
 key _sheader.vbeln as SalesOrder,
     _sheader.vbtyp as Order_type,
     _sitem.posnr as SalesItem,
     _sitem.matnr as Material,
     _sbilling.aubel as BillingDocument,
     _customer.kunnr as Customer,
     _email.EmailAddress as Customeremail
}
