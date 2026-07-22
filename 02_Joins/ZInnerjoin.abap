@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds view for view entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Zcds_ventity as select from mara as _materialTable
inner join makt as _desc on _materialTable.matnr = _desc.matnr
{
    key _materialTable.matnr ,
    _materialTable.mtart ,
    _materialTable.meins as Unitofmeasurement,
    _desc.maktx as Materialdescription,
       ltrim(matnr,'0') as materialnum,
       upper(mtart) as MaterialType
}
