# TripletexRubyClient::Order

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**customer** | [**Customer**](Customer.md) |  | 
**contact** | [**Contact**](Contact.md) |  | [optional] 
**attn** | [**Contact**](Contact.md) |  | [optional] 
**receiver_email** | **String** |  | [optional] 
**overdue_notice_email** | **String** |  | [optional] 
**number** | **String** |  | [optional] 
**reference** | **String** |  | [optional] 
**our_contact** | [**Contact**](Contact.md) | If the contact is not an employee | [optional] 
**our_contact_employee** | [**Employee**](Employee.md) | If the contact is an employee | [optional] 
**department** | [**Department**](Department.md) |  | [optional] 
**order_date** | **String** |  | 
**project** | [**Project**](Project.md) |  | [optional] 
**invoice_comment** | **String** | Comment to be displayed in the invoice based on this order. Can be also found in Invoice.invoiceComment on Invoice objects. | [optional] 
**currency** | [**Currency**](Currency.md) |  | [optional] 
**invoices_due_in** | **Integer** | Number of days/months in which invoices created from this order is due | [optional] 
**invoices_due_in_type** | **String** | Set the time unit of invoicesDueIn. The special case RECURRING_DAY_OF_MONTH enables the due date to be fixed to a specific day of the month, in this case the fixed due date will automatically be set as standard on all invoices created from this order. Note that when RECURRING_DAY_OF_MONTH is set, the due date will be set to the last day of month if \&quot;31\&quot; is set in invoicesDueIn. | [optional] 
**is_show_open_posts_on_invoices** | **BOOLEAN** | Show account statement - open posts on invoices created from this order | [optional] 
**is_closed** | **BOOLEAN** | Denotes if this order is closed. A closed order can no longer be invoiced unless it is opened again. | [optional] 
**delivery_date** | **String** |  | 
**delivery_address** | [**DeliveryAddress**](DeliveryAddress.md) | Delivery address of this order. This can be a new or existing address (useful to know, especially if the delivery is to a private person: if &#39;deliveryAddress.name&#39; is set, we ignore the state of &#39;customer.id&#39;) | [optional] 
**delivery_comment** | **String** |  | [optional] 
**is_prioritize_amounts_including_vat** | **BOOLEAN** |  | [optional] 
**order_line_sorting** | **String** |  | [optional] 
**order_lines** | [**Array&lt;OrderLine&gt;**](OrderLine.md) | Order lines tied to the order. New OrderLines may be embedded here, in some endpoints. | [optional] 
**is_subscription** | **BOOLEAN** | If true, the order is a subscription, which enables periodical invoicing of order lines. First, create an order with isSubscription&#x3D;true, then approve it for subscription invoicing with the :approveSubscriptionInvoice method. | [optional] 
**subscription_duration** | **Integer** | Number of months/years the subscription shall run | [optional] 
**subscription_duration_type** | **String** | The time unit of subscriptionDuration | [optional] 
**subscription_periods_on_invoice** | **Integer** | Number of periods on each invoice | [optional] 
**subscription_periods_on_invoice_type** | **String** | The time unit of subscriptionPeriodsOnInvoice | [optional] 
**subscription_invoicing_time_in_advance_or_arrears** | **String** | Invoicing in advance/in arrears | [optional] 
**subscription_invoicing_time** | **Integer** | Number of days/months invoicing in advance/in arrears | [optional] 
**subscription_invoicing_time_type** | **String** | The time unit of subscriptionInvoicingTime | [optional] 
**is_subscription_auto_invoicing** | **BOOLEAN** | Automatic invoicing. Starts when the subscription is approved | [optional] 
**preliminary_invoice** | [**Invoice**](Invoice.md) | [BETA] Preliminary invoice if order is not charged | [optional] 
**attachment** | [**Array&lt;Document&gt;**](Document.md) | [BETA] Attachments belonging to this order | [optional] 
**send_method_description** | **String** | Description of how this invoice will be sent | [optional] 
**can_create_backorder** | **BOOLEAN** |  | [optional] 
**invoice_on_account_vat_high** | **BOOLEAN** | Is the on account(a konto) amounts including vat  | [optional] 
**total_invoiced_on_account_amount_absolute_currency** | **Float** | Amount paid on account(a konto) | [optional] 


