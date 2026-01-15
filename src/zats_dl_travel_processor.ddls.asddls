@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View Of Travel Processor'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define root view entity ZATS_DL_TRAVEL_PROCESSOR as projection on ZATS_DL_TRAVEL_M
{   
    @ObjectModel.text.element: [ 'Description' ]
    key TravelId,
    @ObjectModel.text.element: [ 'AgencyName' ]
    @Consumption.valueHelpDefinition: [{ entity.name: '/DMO/I_Agency', entity.element: 'AgencyID' }]
    AgencyId,
    @Semantics.text:true
    _Agency.Name as AgencyName,
    @ObjectModel.text.element:[ 'CustomerName' ]
    CustomerId,
    @Semantics.text:true
    _CUSTOMER.LastName as CustomerName,
    BeginDate,
    EndDate,
    BookingFee,
    TotalPrice,
    CurrencyCode,
    Description,
    @ObjectModel.text.element:[ 'StatusText' ]
    @Consumption.valueHelpDefinition: [{ entity.name: '/DMO/I_Overall_Status_VH', entity.element: 'OverallStatus' }]
    OverallStatus,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    @Semantics.text:true
    StatusText,
    Criticality,
    /* Associations */
    _Agency,
    _Booking: redirected to composition child ZATS_DL_BOOKING_PROCESSOR,
    _CURRENCY,
    _CUSTOMER,
    _OVERALLSTATUS
}
