@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Association concept'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_assoc as select from mara as _mat
association[0..1] to makt as _text
on _mat.matnr = _text.matnr
and _text.spras = $session.system_language
{
    key _mat.matnr as MaterialNumber,
    _mat.mtart as MaterialType,
    _text.maktx as MaterialDescription,
    _text
}
