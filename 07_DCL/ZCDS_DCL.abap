@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS for DCL'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Zcds_dcl as select from mara as _mat
left outer join marc as _matplant
on _mat.matnr = _matplant.matnr
{
    key _mat.matnr, 
     _mat.mtart,
     _matplant.werks
     
}
