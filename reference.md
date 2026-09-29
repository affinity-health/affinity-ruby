# Reference
## Locations
<details><summary><code>client.locations.<a href="/lib/Affinity/locations/client.rb">list_practice_locations</a>(practice_id) -> Affinity::Types::ListPracticeLocationsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires locations:read on a practice key or an authorized platform key. Lists active and archived locations by name, with cursor pagination. Use status to filter. Location records are shared between Test and Live for the same practice.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.locations.list_practice_locations(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  starting_after: "loc_01j2y8m6jcc9tt24af5pw9x1bc",
  ending_before: "loc_01j2y8m6jcc9tt24af5pw9x1bc"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**limit:** `Integer`

</dd>
</dl>

<dl>
<dd>

**starting_after:** `String`

</dd>
</dl>

<dl>
<dd>

**ending_before:** `String`

</dd>
</dl>

<dl>
<dd>

**status:** `Affinity::Locations::Types::ListPracticeLocationsRequestStatus`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Locations::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.locations.<a href="/lib/Affinity/locations/client.rb">create_practice_location</a>(practice_id, request) -> Affinity::Types::CreatePracticeLocationResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires locations:write and Idempotency-Key for API keys. Creates an active location with a unique name in this practice. Locations are shared between Test and Live. Use the returned ID for Team location access.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.locations.create_practice_location(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key",
  name: "name"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**city:** `String`

</dd>
</dl>

<dl>
<dd>

**country:** `String`

</dd>
</dl>

<dl>
<dd>

**line1:** `String`

</dd>
</dl>

<dl>
<dd>

**line2:** `String`

</dd>
</dl>

<dl>
<dd>

**name:** `String`

</dd>
</dl>

<dl>
<dd>

**phone:** `String`

</dd>
</dl>

<dl>
<dd>

**postal_code:** `String`

</dd>
</dl>

<dl>
<dd>

**state:** `String`

</dd>
</dl>

<dl>
<dd>

**timezone:** `String` — Optional IANA timezone override. Omit to leave unchanged; null clears it. No timezone is inferred when creating a record.

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Locations::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.locations.<a href="/lib/Affinity/locations/client.rb">get_practice_location</a>(practice_id, location_id) -> Affinity::Types::GetPracticeLocationResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires locations:read. Returns one active or archived location in the authorized practice.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.locations.get_practice_location(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  location_id: "loc_01j2y8m6jcc9tt24af5pw9x1bc"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**location_id:** `String`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Locations::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.locations.<a href="/lib/Affinity/locations/client.rb">update_practice_location</a>(practice_id, location_id, request) -> Affinity::Types::UpdatePracticeLocationResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires locations:write and Idempotency-Key for API keys. Updates only supplied fields; null clears optional contact and address fields. Archived locations cannot be updated. Changes apply to both Test and Live.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.locations.update_practice_location(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  location_id: "loc_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**location_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**city:** `String`

</dd>
</dl>

<dl>
<dd>

**country:** `String`

</dd>
</dl>

<dl>
<dd>

**line1:** `String`

</dd>
</dl>

<dl>
<dd>

**line2:** `String`

</dd>
</dl>

<dl>
<dd>

**name:** `String`

</dd>
</dl>

<dl>
<dd>

**phone:** `String`

</dd>
</dl>

<dl>
<dd>

**postal_code:** `String`

</dd>
</dl>

<dl>
<dd>

**state:** `String`

</dd>
</dl>

<dl>
<dd>

**timezone:** `String` — Optional IANA timezone override. Omit to leave unchanged; null clears it. No timezone is inferred when creating a record.

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Locations::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.locations.<a href="/lib/Affinity/locations/client.rb">archive_practice_location</a>(practice_id, location_id) -> Affinity::Types::ArchivePracticeLocationResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires locations:write and Idempotency-Key for API keys. Retains the location and historical associations. Archived locations cannot receive new Team assignments. Repeating archive returns the archived location. Changes apply to both Test and Live.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.locations.archive_practice_location(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  location_id: "loc_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**location_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Locations::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## API Keys
<details><summary><code>client.api_keys.<a href="/lib/Affinity/api_keys/client.rb">create_platform_practice_api_key</a>(practice_id, request) -> Affinity::Types::CreatePlatformPracticeAPIKeyResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a practice API key for a connected practice. Requires a platform key with service_keys:write and every requested scope. The practice key uses the platform key's Test or Live mode and cannot outlive it. Requires Idempotency-Key for safe retries; the secret is returned in the encrypted replay response for 24 hours.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.api_keys.create_platform_practice_api_key(
  practice_id: "practiceId",
  idempotency_key: "Idempotency-Key",
  name: "name"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**allowed_ips:** `Internal::Types::Array[String]`

</dd>
</dl>

<dl>
<dd>

**expires_at:** `String`

</dd>
</dl>

<dl>
<dd>

**name:** `String`

</dd>
</dl>

<dl>
<dd>

**scopes:** `Internal::Types::Array[Affinity::APIKeys::Types::CreatePlatformPracticeAPIKeyRequestScopesItem]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::APIKeys::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.api_keys.<a href="/lib/Affinity/api_keys/client.rb">get_api_access</a>() -> Affinity::Types::GetAPIAccessResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the subject, mode, and scopes for the API key.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.api_keys.get_api_access
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request_options:** `Affinity::APIKeys::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Account
<details><summary><code>client.account.<a href="/lib/Affinity/account/client.rb">get_account</a>() -> Affinity::Types::GetAccountResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the platform organization, request livemode, and effective access. API keys report scopes and the service_key role; dashboard sessions report membership permissions. operatingMode describes organization Live access, not the credential's Test/Live mode.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.account.get_account(org_id: "acct_01j2y8m6jcc9tt24af5pw9x1bc")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**org_id:** `String`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Account::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Catalog
<details><summary><code>client.catalog.<a href="/lib/Affinity/catalog/client.rb">list_catalog_items</a>() -> Affinity::Types::ListCatalogItemsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists catalog items for the authenticated account and mode. Use view=medications for priced prescription groups with offer counts, pharmacy counts, and strengths; the default view=offers returns individual offers. Use relatedToCatalogItemId to find offers for the same medication and route. When practiceId is supplied, a practice price overrides the platform price and missing overrides inherit the platform price.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.catalog.list_catalog_items(
  related_to_catalog_item_id: "cat_01j2y8m6jcc9tt24af5pw9x1bc",
  catalog_item_id: "cat_01j2y8m6jcc9tt24af5pw9x1bc",
  pharmacy_ids: "pharm_01j2y8m6jcc9tt24af5pw9x1bc",
  ending_before: "cat_01j2y8m6jcc9tt24af5pw9x1bc",
  org_id: "acct_01j2y8m6jcc9tt24af5pw9x1bc",
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  starting_after: "cat_01j2y8m6jcc9tt24af5pw9x1bc"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**view:** `Affinity::Catalog::Types::ListCatalogItemsRequestView`

</dd>
</dl>

<dl>
<dd>

**related_to_catalog_item_id:** `String`

</dd>
</dl>

<dl>
<dd>

**catalog_kind:** `Affinity::Catalog::Types::ListCatalogItemsRequestCatalogKind`

</dd>
</dl>

<dl>
<dd>

**sort:** `Affinity::Catalog::Types::ListCatalogItemsRequestSort`

</dd>
</dl>

<dl>
<dd>

**catalog_item_id:** `String`

</dd>
</dl>

<dl>
<dd>

**availability:** `Affinity::Catalog::Types::ListCatalogItemsRequestAvailability`

</dd>
</dl>

<dl>
<dd>

**pharmacy_ids:** `Affinity::Catalog::Types::ListCatalogItemsRequestPharmacyIDs`

</dd>
</dl>

<dl>
<dd>

**dosage_forms:** `Affinity::Catalog::Types::ListCatalogItemsRequestDosageForms`

</dd>
</dl>

<dl>
<dd>

**ending_before:** `String`

</dd>
</dl>

<dl>
<dd>

**hide_controlled_substances:** `Internal::Types::Boolean`

</dd>
</dl>

<dl>
<dd>

**hide_unpriced:** `Internal::Types::Boolean`

</dd>
</dl>

<dl>
<dd>

**limit:** `Integer`

</dd>
</dl>

<dl>
<dd>

**org_id:** `String`

</dd>
</dl>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**query:** `String`

</dd>
</dl>

<dl>
<dd>

**requirement:** `Affinity::Catalog::Types::ListCatalogItemsRequestRequirement`

</dd>
</dl>

<dl>
<dd>

**routes:** `Affinity::Catalog::Types::ListCatalogItemsRequestRoutes`

</dd>
</dl>

<dl>
<dd>

**starting_after:** `String`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Catalog::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.catalog.<a href="/lib/Affinity/catalog/client.rb">list_pharmacies</a>() -> Affinity::Types::ListPharmaciesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists pharmacies available to the authenticated account, including approved invite-only relationships.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.catalog.list_pharmacies(
  ending_before: "pharm_01j2y8m6jcc9tt24af5pw9x1bc",
  org_id: "acct_01j2y8m6jcc9tt24af5pw9x1bc",
  pharmacy_id: "pharm_01j2y8m6jcc9tt24af5pw9x1bc",
  starting_after: "pharm_01j2y8m6jcc9tt24af5pw9x1bc"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**ending_before:** `String`

</dd>
</dl>

<dl>
<dd>

**limit:** `Integer`

</dd>
</dl>

<dl>
<dd>

**org_id:** `String`

</dd>
</dl>

<dl>
<dd>

**pharmacy_id:** `String`

</dd>
</dl>

<dl>
<dd>

**query:** `String`

</dd>
</dl>

<dl>
<dd>

**ships_to_state:** `String`

</dd>
</dl>

<dl>
<dd>

**starting_after:** `String`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Catalog::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.catalog.<a href="/lib/Affinity/catalog/client.rb">list_shipping_options</a>(catalog_item_id) -> Internal::Types::Array[Affinity::Types::ListShippingOptionsResponseItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns an array of at most 50 reviewed shipping services eligible for a catalog item, destination, and API mode. destinationState must be a USPS state or territory code. Each option has one temperature; pharmacy catalog summaries list all supported temperatures.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.catalog.list_shipping_options(
  catalog_item_id: "cat_01j2y8m6jcc9tt24af5pw9x1bc",
  destination_state: "destinationState"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**catalog_item_id:** `String`

</dd>
</dl>

<dl>
<dd>

**destination_state:** `String`

</dd>
</dl>

<dl>
<dd>

**destination_type:** `Affinity::Catalog::Types::ListShippingOptionsRequestDestinationType`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Catalog::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.catalog.<a href="/lib/Affinity/catalog/client.rb">retrieve_prescribing_options</a>(catalog_item_id) -> Affinity::Types::RetrievePrescribingOptionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires catalog:read. Returns reviewed SIG presets, guided patterns, quantity constraints and product requirements for a practice and mode. Revisions identify changed defaults. No patient-specific rationale or diagnosis is inferred.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.catalog.retrieve_prescribing_options(
  catalog_item_id: "cat_01j2y8m6jcc9tt24af5pw9x1bc",
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**catalog_item_id:** `String`

</dd>
</dl>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Catalog::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Orders
<details><summary><code>client.orders.<a href="/lib/Affinity/orders/client.rb">list_orders</a>() -> Affinity::Types::ListOrdersResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.list_orders(
  ending_before: "ord_01j2y8m6jcc9tt24af5pw9x1bc",
  order_id: "ord_01j2y8m6jcc9tt24af5pw9x1bc",
  patient_id: "pat_01j2y8m6jcc9tt24af5pw9x1bc",
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  starting_after: "ord_01j2y8m6jcc9tt24af5pw9x1bc"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**query:** `String`

</dd>
</dl>

<dl>
<dd>

**external_order_id:** `String`

</dd>
</dl>

<dl>
<dd>

**created_after:** `String`

</dd>
</dl>

<dl>
<dd>

**created_before:** `String`

</dd>
</dl>

<dl>
<dd>

**ending_before:** `String`

</dd>
</dl>

<dl>
<dd>

**limit:** `Integer`

</dd>
</dl>

<dl>
<dd>

**order_id:** `String`

</dd>
</dl>

<dl>
<dd>

**patient_id:** `String`

</dd>
</dl>

<dl>
<dd>

**patient_external_id:** `String`

</dd>
</dl>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**sort:** `Affinity::Orders::Types::ListOrdersRequestSort`

</dd>
</dl>

<dl>
<dd>

**starting_after:** `String`

</dd>
</dl>

<dl>
<dd>

**status:** `Affinity::Orders::Types::ListOrdersRequestStatus`

</dd>
</dl>

<dl>
<dd>

**affinity_actor_id:** `String` — Required for user actors and optional for system actors. Omit both actor headers to use the authenticated service account as a system actor.

</dd>
</dl>

<dl>
<dd>

**affinity_actor_type:** `String` — Use user when a person initiated the action and system for autonomous work. Omit both actor headers to default to system.

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Orders::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.orders.<a href="/lib/Affinity/orders/client.rb">create_order</a>(request) -> Affinity::Types::CreateOrderResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates one unsigned order with 1–20 prescriptions for one patient in one practice. Supply patientId or patient; inline patient creation requires patients:write. Prescriber is optional: select by npi, provider id, or integration-scoped externalId, or leave the draft unassigned until signing. First-use prescriber registration requires team:write. Legacy userId is supported but cannot be combined with prescriber. Idempotency-Key is required.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.create_order(
  idempotency_key: "Idempotency-Key",
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  prescriptions: [{
    days_supply: 1,
    dispensing: {},
    directions: "directions",
    medication_id: "cat_01j2y8m6jcc9tt24af5pw9x1bc",
    quantity: "Infinity",
    quantity_unit: "quantityUnit",
    refills: 1
  }]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**affinity_actor_id:** `String` — Required for user actors and optional for system actors. Omit both actor headers to use the authenticated service account as a system actor.

</dd>
</dl>

<dl>
<dd>

**affinity_actor_type:** `String` — Use user when a person initiated the action and system for autonomous work. Omit both actor headers to default to system.

</dd>
</dl>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**user_id:** `String`

</dd>
</dl>

<dl>
<dd>

**prescriber:** `Affinity::Orders::Types::CreateOrderRequestPrescriber`

</dd>
</dl>

<dl>
<dd>

**otc_items:** `Internal::Types::Array[Affinity::Orders::Types::CreateOrderRequestOtcItemsItem]`

</dd>
</dl>

<dl>
<dd>

**external_order_id:** `String`

</dd>
</dl>

<dl>
<dd>

**metadata:** `Internal::Types::Hash[String, Affinity::Orders::Types::CreateOrderRequestMetadataValue]`

</dd>
</dl>

<dl>
<dd>

**patient_id:** `String`

</dd>
</dl>

<dl>
<dd>

**patient:** `Affinity::Orders::Types::CreateOrderRequestPatient`

</dd>
</dl>

<dl>
<dd>

**shipping_address_id:** `String`

</dd>
</dl>

<dl>
<dd>

**prescriptions:** `Internal::Types::Array[Affinity::Orders::Types::CreateOrderRequestPrescriptionsItem]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Orders::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.orders.<a href="/lib/Affinity/orders/client.rb">get_order</a>(order_id) -> Affinity::Types::GetOrderResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.get_order(order_id: "ord_01j2y8m6jcc9tt24af5pw9x1bc")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**order_id:** `String`

</dd>
</dl>

<dl>
<dd>

**affinity_actor_id:** `String` — Required for user actors and optional for system actors. Omit both actor headers to use the authenticated service account as a system actor.

</dd>
</dl>

<dl>
<dd>

**affinity_actor_type:** `String` — Use user when a person initiated the action and system for autonomous work. Omit both actor headers to default to system.

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Orders::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.orders.<a href="/lib/Affinity/orders/client.rb">cancel_order</a>(order_id, request) -> Affinity::Types::CancelOrderResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requests cancellation. HTTP 200 means the request was handled; check cancellation.status for confirmed, pending, partial, or failed. Only confirmed means the entire order is cancelled. Shipment possession makes a fulfillment cancellation too late.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.cancel_order(
  order_id: "ord_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key",
  reason: "reason"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**order_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**affinity_actor_id:** `String` — Required for user actors and optional for system actors. Omit both actor headers to use the authenticated service account as a system actor.

</dd>
</dl>

<dl>
<dd>

**affinity_actor_type:** `String` — Use user when a person initiated the action and system for autonomous work. Omit both actor headers to default to system.

</dd>
</dl>

<dl>
<dd>

**reason:** `String`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Orders::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.orders.<a href="/lib/Affinity/orders/client.rb">act_on_order_exception</a>(order_id, exception_id, request) -> Affinity::Types::ActOnOrderExceptionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Acknowledge, retry, contact, or resolve an order exception in the credential's Test/Live mode. assign_to_me requires a signed-in dashboard user; API keys receive 400 and may use acknowledge instead. Actor headers do not create a dashboard assignee.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.act_on_order_exception(
  order_id: "ord_01j2y8m6jcc9tt24af5pw9x1bc",
  exception_id: "fex_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key",
  action: "acknowledge"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**order_id:** `String`

</dd>
</dl>

<dl>
<dd>

**exception_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**affinity_actor_id:** `String` — Required for user actors and optional for system actors. Omit both actor headers to use the authenticated service account as a system actor.

</dd>
</dl>

<dl>
<dd>

**affinity_actor_type:** `String` — Use user when a person initiated the action and system for autonomous work. Omit both actor headers to default to system.

</dd>
</dl>

<dl>
<dd>

**action:** `Affinity::Orders::Types::ActOnOrderExceptionRequestAction`

</dd>
</dl>

<dl>
<dd>

**note:** `String`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Orders::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.orders.<a href="/lib/Affinity/orders/client.rb">list_order_events</a>(order_id) -> Affinity::Types::ListOrderEventsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.list_order_events(
  order_id: "ord_01j2y8m6jcc9tt24af5pw9x1bc",
  ending_before: "evt_01j2y8m6jcc9tt24af5pw9x1bc",
  starting_after: "evt_01j2y8m6jcc9tt24af5pw9x1bc"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**order_id:** `String`

</dd>
</dl>

<dl>
<dd>

**ending_before:** `String`

</dd>
</dl>

<dl>
<dd>

**limit:** `Integer`

</dd>
</dl>

<dl>
<dd>

**starting_after:** `String`

</dd>
</dl>

<dl>
<dd>

**affinity_actor_id:** `String` — Required for user actors and optional for system actors. Omit both actor headers to use the authenticated service account as a system actor.

</dd>
</dl>

<dl>
<dd>

**affinity_actor_type:** `String` — Use user when a person initiated the action and system for autonomous work. Omit both actor headers to default to system.

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Orders::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.orders.<a href="/lib/Affinity/orders/client.rb">get_order_test_simulation</a>(order_id) -> Affinity::Types::GetOrderTestSimulationResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires orders:write. Available only in Test mode.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.get_order_test_simulation(order_id: "ord_01j2y8m6jcc9tt24af5pw9x1bc")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**order_id:** `String`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Orders::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.orders.<a href="/lib/Affinity/orders/client.rb">update_order_test_simulation</a>(order_id, request) -> Affinity::Types::UpdateOrderTestSimulationResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires orders:write and Idempotency-Key. Configure before submission or queue a valid pharmacy event in manual mode. Events use normal order history and Test webhooks. Live requests are rejected.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.update_order_test_simulation(
  order_id: "ord_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key",
  mode: "automatic",
  scenario: "successful"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**order_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**mode:** `Affinity::Orders::Types::UpdateOrderTestSimulationRequestMode`

</dd>
</dl>

<dl>
<dd>

**scenario:** `Affinity::Orders::Types::UpdateOrderTestSimulationRequestScenario`

</dd>
</dl>

<dl>
<dd>

**action:** `Affinity::Orders::Types::UpdateOrderTestSimulationRequestAction`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Orders::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.orders.<a href="/lib/Affinity/orders/client.rb">preview_order</a>(request) -> Affinity::Types::PreviewOrderResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires orders:write and catalog:read. Supply exactly one of patientId, patientExternalId, or inline patient details. External-ID lookup additionally requires patients:read; inline details require patients:write. Resolves defaults and explicit edits for 1–20 prescriptions. Reuses stored patient details when identifiers match; otherwise previews inline details without creating a patient. Complete previews contain an orders.create input. Does not create records, reserve prices, sign, charge or transmit. No idempotency key is required. Creation and signing recheck current requirements.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.preview_order(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  prescriptions: [{
    medication_id: "cat_01j2y8m6jcc9tt24af5pw9x1bc"
  }]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**otc_items:** `Internal::Types::Array[Affinity::Orders::Types::PreviewOrderRequestOtcItemsItem]`

</dd>
</dl>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**patient_id:** `String`

</dd>
</dl>

<dl>
<dd>

**patient_external_id:** `String`

</dd>
</dl>

<dl>
<dd>

**patient:** `Affinity::Orders::Types::PreviewOrderRequestPatient`

</dd>
</dl>

<dl>
<dd>

**user_id:** `String`

</dd>
</dl>

<dl>
<dd>

**prescriber:** `Affinity::Orders::Types::PreviewOrderRequestPrescriber`

</dd>
</dl>

<dl>
<dd>

**shipping_address_id:** `String`

</dd>
</dl>

<dl>
<dd>

**external_order_id:** `String`

</dd>
</dl>

<dl>
<dd>

**prescriptions:** `Internal::Types::Array[Affinity::Orders::Types::PreviewOrderRequestPrescriptionsItem]`

</dd>
</dl>

<dl>
<dd>

**shipping:** `Affinity::Orders::Types::PreviewOrderRequestShipping`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Orders::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.orders.<a href="/lib/Affinity/orders/client.rb">sign_order</a>(order_id, request) -> Affinity::Types::SignOrderResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires orders:sign, Idempotency-Key, signatureAttestation, and expectedRevision from the reviewed order. Existing integrations may send expectedVersions instead; supply exactly one. A stale revision returns 409 and requires renewed clinician review. Select prescriber by npi, provider id, or integration-scoped externalId, or inherit the draft's prescriber. First-use registration requires team:write. Actor headers are optional audit metadata with prescriber; legacy userId requires matching clinician actor headers. Signing does not submit to a pharmacy.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.sign_order(
  order_id: "ord_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key",
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  signature_attestation: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**order_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**user_id:** `String`

</dd>
</dl>

<dl>
<dd>

**prescriber:** `Affinity::Orders::Types::SignOrderRequestPrescriber`

</dd>
</dl>

<dl>
<dd>

**signature_attestation:** `Internal::Types::Boolean`

</dd>
</dl>

<dl>
<dd>

**expected_revision:** `String` — Opaque revision of the complete order prescription set. Send the revision you reviewed as expectedRevision; never replace it automatically after a conflict.

</dd>
</dl>

<dl>
<dd>

**expected_versions:** `Internal::Types::Array[Affinity::Orders::Types::SignOrderRequestExpectedVersionsItem]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Orders::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.orders.<a href="/lib/Affinity/orders/client.rb">sign_and_submit_order</a>(order_id, request) -> Affinity::Types::SignAndSubmitOrderResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires orders:sign, Idempotency-Key, signatureAttestation, and expectedRevision from the reviewed order. Existing integrations may send expectedVersions instead; supply exactly one. A stale revision returns 409 and requires renewed clinician review. Select prescriber by npi, provider id, or externalId, or inherit the draft's prescriber. First-use registration requires team:write. Actor headers are optional with prescriber; legacy userId requires matching clinician actor headers. Signs the complete order, then attempts each submission. Signing remains committed if submission fails. Replay the same key after an uncertain response; retry reported submission failures through Submit order with a new key. Submitted means queued, not pharmacy acceptance.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.sign_and_submit_order(
  order_id: "ord_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key",
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  signature_attestation: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**order_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**user_id:** `String`

</dd>
</dl>

<dl>
<dd>

**prescriber:** `Affinity::Orders::Types::SignAndSubmitOrderRequestPrescriber`

</dd>
</dl>

<dl>
<dd>

**signature_attestation:** `Internal::Types::Boolean`

</dd>
</dl>

<dl>
<dd>

**expected_revision:** `String` — Opaque revision of the complete order prescription set. Send the revision you reviewed as expectedRevision; never replace it automatically after a conflict.

</dd>
</dl>

<dl>
<dd>

**expected_versions:** `Internal::Types::Array[Affinity::Orders::Types::SignAndSubmitOrderRequestExpectedVersionsItem]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Orders::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.orders.<a href="/lib/Affinity/orders/client.rb">submit_order</a>(order_id, request) -> Affinity::Types::SubmitOrderResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires orders:sign and Idempotency-Key. Queues signed prescriptions after rechecking authorization, signature integrity, billing, and fulfillment eligibility. Track pharmacy acceptance through order reads and webhooks. After a partial failure, retry submission with a new idempotency key; already queued prescriptions are not duplicated.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.submit_order(
  order_id: "ord_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key",
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**order_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**user_id:** `String`

</dd>
</dl>

<dl>
<dd>

**prescriber:** `Affinity::Orders::Types::SubmitOrderRequestPrescriber`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Orders::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.orders.<a href="/lib/Affinity/orders/client.rb">reject_order</a>(order_id, request) -> Affinity::Types::RejectOrderResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires orders:sign and Idempotency-Key. Select a prescriber or inherit the draft's prescriber. Legacy userId requires matching clinician actor headers. Supply expectedRevision from the reviewed order, or expectedVersions for existing integrations. Permanently rejects the complete unsigned order after checking its revision.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.reject_order(
  order_id: "ord_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key",
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  reason: "reason"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**order_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**user_id:** `String`

</dd>
</dl>

<dl>
<dd>

**prescriber:** `Affinity::Orders::Types::RejectOrderRequestPrescriber`

</dd>
</dl>

<dl>
<dd>

**reason:** `String`

</dd>
</dl>

<dl>
<dd>

**expected_revision:** `String` — Opaque revision of the complete order prescription set. Send the revision you reviewed as expectedRevision; never replace it automatically after a conflict.

</dd>
</dl>

<dl>
<dd>

**expected_versions:** `Internal::Types::Array[Affinity::Orders::Types::RejectOrderRequestExpectedVersionsItem]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Orders::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.orders.<a href="/lib/Affinity/orders/client.rb">add_order_prescription</a>(order_id, request) -> Affinity::Types::AddOrderPrescriptionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires orders:write, Idempotency-Key and expectedRevision from the order being edited. Existing integrations may send expectedVersions instead; supply exactly one. Adds a complete prescription to an unsigned Order and returns all new versions. Omitted actor context defaults to the authenticated service account as a system actor. Patient and prescriber attribution stay fixed. Signed orders cannot be amended through this endpoint. Signing and submission require orders:sign through their separate endpoints.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.add_order_prescription(
  order_id: "ord_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key",
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  prescription: {
    days_supply: 1,
    dispensing: {},
    directions: "directions",
    medication_id: "cat_01j2y8m6jcc9tt24af5pw9x1bc",
    quantity: "Infinity",
    quantity_unit: "quantityUnit",
    refills: 1
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**order_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**affinity_actor_id:** `String` — Required for user actors and optional for system actors. Omit both actor headers to use the authenticated service account as a system actor.

</dd>
</dl>

<dl>
<dd>

**affinity_actor_type:** `String` — Use user when a person initiated the action and system for autonomous work. Omit both actor headers to default to system.

</dd>
</dl>

<dl>
<dd>

**metadata:** `Internal::Types::Hash[String, Affinity::Orders::Types::AddOrderPrescriptionRequestMetadataValue]`

</dd>
</dl>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**expected_revision:** `String` — Opaque revision of the complete order prescription set. Send the revision you reviewed as expectedRevision; never replace it automatically after a conflict.

</dd>
</dl>

<dl>
<dd>

**expected_versions:** `Internal::Types::Array[Affinity::Orders::Types::AddOrderPrescriptionRequestExpectedVersionsItem]`

</dd>
</dl>

<dl>
<dd>

**prescription:** `Affinity::Orders::Types::AddOrderPrescriptionRequestPrescription`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Orders::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.orders.<a href="/lib/Affinity/orders/client.rb">update_order_prescription</a>(order_id, prescription_id, request) -> Affinity::Types::UpdateOrderPrescriptionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires orders:write, Idempotency-Key and expectedRevision from the order being edited. Existing integrations may send expectedVersions instead; supply exactly one. Replaces one prescription with complete medication instructions and returns all new versions. Omitted actor context defaults to the authenticated service account as a system actor. Patient and prescriber attribution stay fixed. Signed orders cannot be amended through this endpoint. Signing and submission require orders:sign through their separate endpoints.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.update_order_prescription(
  order_id: "ord_01j2y8m6jcc9tt24af5pw9x1bc",
  prescription_id: "rx_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key",
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  prescription: {
    days_supply: 1,
    dispensing: {},
    directions: "directions",
    medication_id: "cat_01j2y8m6jcc9tt24af5pw9x1bc",
    quantity: "Infinity",
    quantity_unit: "quantityUnit",
    refills: 1
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**order_id:** `String`

</dd>
</dl>

<dl>
<dd>

**prescription_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**affinity_actor_id:** `String` — Required for user actors and optional for system actors. Omit both actor headers to use the authenticated service account as a system actor.

</dd>
</dl>

<dl>
<dd>

**affinity_actor_type:** `String` — Use user when a person initiated the action and system for autonomous work. Omit both actor headers to default to system.

</dd>
</dl>

<dl>
<dd>

**metadata:** `Internal::Types::Hash[String, Affinity::Orders::Types::UpdateOrderPrescriptionRequestMetadataValue]`

</dd>
</dl>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**expected_revision:** `String` — Opaque revision of the complete order prescription set. Send the revision you reviewed as expectedRevision; never replace it automatically after a conflict.

</dd>
</dl>

<dl>
<dd>

**expected_versions:** `Internal::Types::Array[Affinity::Orders::Types::UpdateOrderPrescriptionRequestExpectedVersionsItem]`

</dd>
</dl>

<dl>
<dd>

**prescription:** `Affinity::Orders::Types::UpdateOrderPrescriptionRequestPrescription`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Orders::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.orders.<a href="/lib/Affinity/orders/client.rb">create_order_batch</a>(request) -> Affinity::Types::CreateOrderBatchResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates 1–20 orders for distinct patients in one practice, each with 1–20 prescriptions. Each accepts patientId or inline patient details. Orders and newly created patients commit atomically; any failure saves none. Requires orders:write and Idempotency-Key; inline patients also require patients:write. Omitted actor context defaults to the authenticated service account as a system actor. Sign and submit each resulting order separately using orders:sign.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.create_order_batch(
  idempotency_key: "Idempotency-Key",
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  orders: [{
    prescriptions: [{
      days_supply: 1,
      dispensing: {},
      directions: "directions",
      medication_id: "cat_01j2y8m6jcc9tt24af5pw9x1bc",
      quantity: "Infinity",
      quantity_unit: "quantityUnit",
      refills: 1
    }]
  }]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**affinity_actor_id:** `String` — Required for user actors and optional for system actors. Omit both actor headers to use the authenticated service account as a system actor.

</dd>
</dl>

<dl>
<dd>

**affinity_actor_type:** `String` — Use user when a person initiated the action and system for autonomous work. Omit both actor headers to default to system.

</dd>
</dl>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**user_id:** `String`

</dd>
</dl>

<dl>
<dd>

**prescriber:** `Affinity::Orders::Types::CreateOrderBatchRequestPrescriber`

</dd>
</dl>

<dl>
<dd>

**orders:** `Internal::Types::Array[Affinity::Orders::Types::CreateOrderBatchRequestOrdersItem]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Orders::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Webhooks
<details><summary><code>client.webhooks.<a href="/lib/Affinity/webhooks/client.rb">list_webhook_endpoints</a>() -> Affinity::Types::ListWebhookEndpointsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires webhooks:read. Returns endpoints owned by the key organization, or the organization selected with X-Affinity-Organization-Id. Platform delegation requires a webhook grant in the key's mode.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.webhooks.list_webhook_endpoints(
  ending_before: "whe_01j2y8m6jcc9tt24af5pw9x1bc",
  starting_after: "whe_01j2y8m6jcc9tt24af5pw9x1bc"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**ending_before:** `String`

</dd>
</dl>

<dl>
<dd>

**limit:** `Integer`

</dd>
</dl>

<dl>
<dd>

**starting_after:** `String`

</dd>
</dl>

<dl>
<dd>

**affinity_organization_id:** `String` — Defaults to the API key organization. A platform may select a practice or pharmacy only with an explicit webhook grant in this mode. This changes the webhook owner, not the caller or event subscriptions.

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Webhooks::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/lib/Affinity/webhooks/client.rb">create_webhook_endpoint</a>(request) -> Affinity::Types::CreateWebhookEndpointResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires webhooks:write and Idempotency-Key. Defaults to the API key organization. A platform can select a practice or pharmacy owner with X-Affinity-Organization-Id and an explicit webhook grant. For platform-owned endpoints, practiceIds narrows delivery to selected connected practices. An empty filter receives all otherwise-authorized events.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.webhooks.create_webhook_endpoint(
  idempotency_key: "Idempotency-Key",
  url: "url"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**affinity_organization_id:** `String` — Defaults to the API key organization. A platform may select a practice or pharmacy only with an explicit webhook grant in this mode. This changes the webhook owner, not the caller or event subscriptions.

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**practice_ids:** `Internal::Types::Array[String]`

</dd>
</dl>

<dl>
<dd>

**description:** `String`

</dd>
</dl>

<dl>
<dd>

**payload_style:** `Affinity::Webhooks::Types::CreateWebhookEndpointRequestPayloadStyle`

</dd>
</dl>

<dl>
<dd>

**subscribed_events:** `Internal::Types::Array[Affinity::Webhooks::Types::CreateWebhookEndpointRequestSubscribedEventsItem]`

</dd>
</dl>

<dl>
<dd>

**url:** `String`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Webhooks::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/lib/Affinity/webhooks/client.rb">delete_webhook_endpoint</a>(endpoint_id) -> Affinity::Types::DeleteWebhookEndpointResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.webhooks.delete_webhook_endpoint(
  endpoint_id: "whe_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**endpoint_id:** `String`

</dd>
</dl>

<dl>
<dd>

**affinity_organization_id:** `String` — Defaults to the API key organization. A platform may select a practice or pharmacy only with an explicit webhook grant in this mode. This changes the webhook owner, not the caller or event subscriptions.

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Webhooks::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/lib/Affinity/webhooks/client.rb">update_webhook_endpoint</a>(endpoint_id, request) -> Affinity::Types::UpdateWebhookEndpointResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires webhooks:write and Idempotency-Key. Updates an endpoint in the selected organization and mode. Omitted practiceIds preserves the filter; an empty array removes the practice filter. Subscription changes apply to newly generated events.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.webhooks.update_webhook_endpoint(
  endpoint_id: "whe_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**endpoint_id:** `String`

</dd>
</dl>

<dl>
<dd>

**affinity_organization_id:** `String` — Defaults to the API key organization. A platform may select a practice or pharmacy only with an explicit webhook grant in this mode. This changes the webhook owner, not the caller or event subscriptions.

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**practice_ids:** `Internal::Types::Array[String]`

</dd>
</dl>

<dl>
<dd>

**description:** `String`

</dd>
</dl>

<dl>
<dd>

**payload_style:** `Affinity::Webhooks::Types::UpdateWebhookEndpointRequestPayloadStyle`

</dd>
</dl>

<dl>
<dd>

**status:** `Affinity::Webhooks::Types::UpdateWebhookEndpointRequestStatus`

</dd>
</dl>

<dl>
<dd>

**subscribed_events:** `Internal::Types::Array[Affinity::Webhooks::Types::UpdateWebhookEndpointRequestSubscribedEventsItem]`

</dd>
</dl>

<dl>
<dd>

**url:** `String`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Webhooks::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/lib/Affinity/webhooks/client.rb">rotate_webhook_endpoint_secret</a>(endpoint_id) -> Affinity::Types::RotateWebhookEndpointSecretResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.webhooks.rotate_webhook_endpoint_secret(
  endpoint_id: "whe_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**endpoint_id:** `String`

</dd>
</dl>

<dl>
<dd>

**affinity_organization_id:** `String` — Defaults to the API key organization. A platform may select a practice or pharmacy only with an explicit webhook grant in this mode. This changes the webhook owner, not the caller or event subscriptions.

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Webhooks::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/lib/Affinity/webhooks/client.rb">test_webhook_endpoint</a>(endpoint_id) -> Affinity::Types::TestWebhookEndpointResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.webhooks.test_webhook_endpoint(
  endpoint_id: "whe_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**endpoint_id:** `String`

</dd>
</dl>

<dl>
<dd>

**affinity_organization_id:** `String` — Defaults to the API key organization. A platform may select a practice or pharmacy only with an explicit webhook grant in this mode. This changes the webhook owner, not the caller or event subscriptions.

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Webhooks::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/lib/Affinity/webhooks/client.rb">list_webhook_events</a>() -> Affinity::Types::ListWebhookEventsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.webhooks.list_webhook_events(
  ending_before: "evt_01j2y8m6jcc9tt24af5pw9x1bc",
  starting_after: "evt_01j2y8m6jcc9tt24af5pw9x1bc"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**ending_before:** `String`

</dd>
</dl>

<dl>
<dd>

**limit:** `Integer`

</dd>
</dl>

<dl>
<dd>

**status:** `Affinity::Webhooks::Types::ListWebhookEventsRequestStatus`

</dd>
</dl>

<dl>
<dd>

**starting_after:** `String`

</dd>
</dl>

<dl>
<dd>

**affinity_organization_id:** `String` — Defaults to the API key organization. A platform may select a practice or pharmacy only with an explicit webhook grant in this mode. This changes the webhook owner, not the caller or event subscriptions.

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Webhooks::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/lib/Affinity/webhooks/client.rb">get_webhook_event</a>(event_id) -> Affinity::Types::GetWebhookEventResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.webhooks.get_webhook_event(event_id: "evt_01j2y8m6jcc9tt24af5pw9x1bc")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**event_id:** `String`

</dd>
</dl>

<dl>
<dd>

**affinity_organization_id:** `String` — Defaults to the API key organization. A platform may select a practice or pharmacy only with an explicit webhook grant in this mode. This changes the webhook owner, not the caller or event subscriptions.

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Webhooks::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/lib/Affinity/webhooks/client.rb">replay_webhook_event</a>(event_id) -> Affinity::Types::ReplayWebhookEventResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.webhooks.replay_webhook_event(
  event_id: "evt_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**event_id:** `String`

</dd>
</dl>

<dl>
<dd>

**affinity_organization_id:** `String` — Defaults to the API key organization. A platform may select a practice or pharmacy only with an explicit webhook grant in this mode. This changes the webhook owner, not the caller or event subscriptions.

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Webhooks::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/lib/Affinity/webhooks/client.rb">list_webhook_grants</a>() -> Affinity::Types::ListWebhookGrantsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires webhooks:read on the owning practice or pharmacy key. Lists platform webhook grants in the key's mode. Platforms cannot list or grant themselves delegated access.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.webhooks.list_webhook_grants(
  starting_after: "acct_01j2y8m6jcc9tt24af5pw9x1bc",
  ending_before: "acct_01j2y8m6jcc9tt24af5pw9x1bc"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer`

</dd>
</dl>

<dl>
<dd>

**starting_after:** `String`

</dd>
</dl>

<dl>
<dd>

**ending_before:** `String`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Webhooks::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/lib/Affinity/webhooks/client.rb">save_webhook_grant</a>(platform_id, request) -> Affinity::Types::SaveWebhookGrantResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires webhooks:write on the owning practice or pharmacy key and Idempotency-Key. Grants or replaces a platform's webhook permissions in this mode. A practice must already be connected to that platform. The grant does not give the platform access to other API resources.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.webhooks.save_webhook_grant(
  platform_id: "acct_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key",
  scopes: ["webhooks:read"]
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**platform_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**scopes:** `Internal::Types::Array[Affinity::Webhooks::Types::SaveWebhookGrantRequestScopesItem]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Webhooks::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/lib/Affinity/webhooks/client.rb">revoke_webhook_grant</a>(platform_id) -> Affinity::Types::RevokeWebhookGrantResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires webhooks:write on the owning practice or pharmacy key and Idempotency-Key. Removes platform webhook access in this mode. Existing endpoints remain owned by the practice or pharmacy and continue operating.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.webhooks.revoke_webhook_grant(
  platform_id: "acct_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**platform_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Webhooks::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Team
<details><summary><code>client.team.<a href="/lib/Affinity/team/client.rb">register_user</a>(practice_id, request) -> Affinity::Types::RegisterUserResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires team:write and Idempotency-Key. Registers a practice member without an invitation. Test requires synthetic .test emails and Affinity Test NPIs. Live requires approved integration and practice access. Identity attestation records the integration's assertion; it does not verify login email or clinical credentials. Existing memberships and verified provider records are preserved. Use the returned user ID for orders and signing.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.team.register_user(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key",
  external_id: "externalId",
  email: "email",
  name: "name",
  role: "administrator",
  identity_attestation: true
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**external_id:** `String`

</dd>
</dl>

<dl>
<dd>

**email:** `String`

</dd>
</dl>

<dl>
<dd>

**name:** `String`

</dd>
</dl>

<dl>
<dd>

**role:** `Affinity::Team::Types::RegisterUserRequestRole`

</dd>
</dl>

<dl>
<dd>

**roles:** `Internal::Types::Array[Affinity::Team::Types::RegisterUserRequestRolesItem]`

</dd>
</dl>

<dl>
<dd>

**profile_details:** `Affinity::Team::Types::RegisterUserRequestProfileDetails`

</dd>
</dl>

<dl>
<dd>

**npi:** `String`

</dd>
</dl>

<dl>
<dd>

**licenses:** `Internal::Types::Array[Affinity::Team::Types::RegisterUserRequestLicensesItem]`

</dd>
</dl>

<dl>
<dd>

**legal_name:** `String`

</dd>
</dl>

<dl>
<dd>

**display_name:** `String`

</dd>
</dl>

<dl>
<dd>

**credentials:** `String`

</dd>
</dl>

<dl>
<dd>

**address:** `Affinity::Team::Types::RegisterUserRequestAddress`

</dd>
</dl>

<dl>
<dd>

**phone:** `String`

</dd>
</dl>

<dl>
<dd>

**location_ids:** `Internal::Types::Array[String]`

</dd>
</dl>

<dl>
<dd>

**identity_attestation:** `Internal::Types::Boolean`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Team::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.team.<a href="/lib/Affinity/team/client.rb">list_practice_team_invitations</a>(practice_id) -> Affinity::Types::ListPracticeTeamInvitationsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires team:read. Lists practice invitations, including invitations sent in Clinic. Filter by pending, expired, accepted, declined, or revoked status, exact email, or your integration externalId. Only your integration and API key mode can see its external identity and onboarding state. Follow person.nextActions after invitation acceptance.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.team.list_practice_team_invitations(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  starting_after: "invite_01j2y8m6jcc9tt24af5pw9x1bc",
  ending_before: "invite_01j2y8m6jcc9tt24af5pw9x1bc"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**limit:** `Integer`

</dd>
</dl>

<dl>
<dd>

**starting_after:** `String`

</dd>
</dl>

<dl>
<dd>

**ending_before:** `String`

</dd>
</dl>

<dl>
<dd>

**status:** `Affinity::Team::Types::ListPracticeTeamInvitationsRequestStatus`

</dd>
</dl>

<dl>
<dd>

**email:** `String`

</dd>
</dl>

<dl>
<dd>

**external_id:** `String` — Match this integration's external identity in the API key's mode.

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Team::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.team.<a href="/lib/Affinity/team/client.rb">invite_practice_team_person</a>(practice_id, request) -> Affinity::Types::InvitePracticeTeamPersonResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires team:write on the practice key or its platform key. Use roles to combine administrator, prescriber, clinical_staff, billing, or developer presets. Ownership uses the protected owner designation. The singular role field remains available for single-role assignments. Creates a real organization invitation and optional prescriber setup. The recipient must accept with their Affinity account. Repeating the same external identity retries pending invitation delivery. Accepted invitations do not change existing access. Team membership is shared between Test and Live; the external identity is mode-scoped. Keys cannot accept invitations. Headless registration and signing use separate endpoints.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.team.invite_practice_team_person(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key",
  external_id: "externalId",
  email: "email",
  name: "name"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**external_id:** `String`

</dd>
</dl>

<dl>
<dd>

**email:** `String`

</dd>
</dl>

<dl>
<dd>

**name:** `String`

</dd>
</dl>

<dl>
<dd>

**role:** `Affinity::Team::Types::InvitePracticeTeamPersonRequestRole`

</dd>
</dl>

<dl>
<dd>

**roles:** `Internal::Types::Array[Affinity::Team::Types::InvitePracticeTeamPersonRequestRolesItem]`

</dd>
</dl>

<dl>
<dd>

**profile_details:** `Affinity::Team::Types::InvitePracticeTeamPersonRequestProfileDetails`

</dd>
</dl>

<dl>
<dd>

**npi:** `String`

</dd>
</dl>

<dl>
<dd>

**licenses:** `Internal::Types::Array[Affinity::Team::Types::InvitePracticeTeamPersonRequestLicensesItem]`

</dd>
</dl>

<dl>
<dd>

**legal_name:** `String`

</dd>
</dl>

<dl>
<dd>

**display_name:** `String`

</dd>
</dl>

<dl>
<dd>

**credentials:** `String`

</dd>
</dl>

<dl>
<dd>

**address:** `Affinity::Team::Types::InvitePracticeTeamPersonRequestAddress`

</dd>
</dl>

<dl>
<dd>

**phone:** `String`

</dd>
</dl>

<dl>
<dd>

**location_ids:** `Internal::Types::Array[String]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Team::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.team.<a href="/lib/Affinity/team/client.rb">get_practice_team</a>(practice_id) -> Affinity::Types::GetPracticeTeamResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires team:read. Returns counts of members, invitations, and prescribers. Use the paginated members, prescribers, and invitations collections for individual records. Team access and clinician credentials are shared between Test and Live.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.team.get_practice_team(practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Team::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.team.<a href="/lib/Affinity/team/client.rb">list_practice_team_members</a>(practice_id) -> Affinity::Types::ListPracticeTeamMembersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires team:read. Search the roster by name or email, and filter by role or membership status. Includes members invited in Clinic, location access, and account-specific prescriber connections. Memberships are shared between Test and Live.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.team.list_practice_team_members(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  starting_after: "mbr_01j2y8m6jcc9tt24af5pw9x1bc",
  ending_before: "mbr_01j2y8m6jcc9tt24af5pw9x1bc"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**limit:** `Integer`

</dd>
</dl>

<dl>
<dd>

**starting_after:** `String`

</dd>
</dl>

<dl>
<dd>

**ending_before:** `String`

</dd>
</dl>

<dl>
<dd>

**search:** `String`

</dd>
</dl>

<dl>
<dd>

**role:** `Affinity::Team::Types::ListPracticeTeamMembersRequestRole`

</dd>
</dl>

<dl>
<dd>

**status:** `Affinity::Team::Types::ListPracticeTeamMembersRequestStatus`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Team::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.team.<a href="/lib/Affinity/team/client.rb">list_practice_team_prescribers</a>(practice_id) -> Affinity::Types::ListPracticeTeamPrescribersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires team:read. Filter practice prescribers by name, NPI, state, and practice status. Records include submitted licenses and their IDs. Signing authority also requires an active account connection, Live practice access, and prescription eligibility.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.team.list_practice_team_prescribers(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  starting_after: "prov_01j2y8m6jcc9tt24af5pw9x1bc",
  ending_before: "prov_01j2y8m6jcc9tt24af5pw9x1bc"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**limit:** `Integer`

</dd>
</dl>

<dl>
<dd>

**starting_after:** `String`

</dd>
</dl>

<dl>
<dd>

**ending_before:** `String`

</dd>
</dl>

<dl>
<dd>

**search:** `String`

</dd>
</dl>

<dl>
<dd>

**npi:** `String`

</dd>
</dl>

<dl>
<dd>

**state:** `String` — Match a submitted license jurisdiction. This does not establish signing eligibility.

</dd>
</dl>

<dl>
<dd>

**status:** `Affinity::Team::Types::ListPracticeTeamPrescribersRequestStatus`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Team::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.team.<a href="/lib/Affinity/team/client.rb">get_practice_team_member</a>(practice_id, member_id) -> Affinity::Types::GetPracticeTeamMemberResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires team:read. Returns current account membership, roles, location access, and prescriber connection. The member ID identifies practice access; it is not the integration user ID used by orders.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.team.get_practice_team_member(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  member_id: "mbr_01j2y8m6jcc9tt24af5pw9x1bc"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**member_id:** `String`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Team::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.team.<a href="/lib/Affinity/team/client.rb">update_practice_team_member</a>(practice_id, member_id, request) -> Affinity::Types::UpdatePracticeTeamMemberResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires team:write. Supply role, status, or locationIds; omitted values stay unchanged. A role replaces existing roles. Disable access with status disabled. An empty locationIds array grants all practice locations. Ownership changes require an active practice owner using a personal API key; service keys manage non-owner memberships. The final active owner cannot be removed. Changes apply to both Test and Live. Sign-in email and account security remain account settings.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.team.update_practice_team_member(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  member_id: "mbr_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**member_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**role:** `Affinity::Team::Types::UpdatePracticeTeamMemberRequestRole`

</dd>
</dl>

<dl>
<dd>

**roles:** `Internal::Types::Array[Affinity::Team::Types::UpdatePracticeTeamMemberRequestRolesItem]`

</dd>
</dl>

<dl>
<dd>

**status:** `Affinity::Team::Types::UpdatePracticeTeamMemberRequestStatus`

</dd>
</dl>

<dl>
<dd>

**location_ids:** `Internal::Types::Array[String]` — Replace location access. An empty array grants access to all practice locations.

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Team::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.team.<a href="/lib/Affinity/team/client.rb">get_practice_team_prescriber</a>(practice_id, prescriber_id) -> Affinity::Types::GetPracticeTeamPrescriberResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires team:read. Returns the clinical profile and submitted licenses, including license IDs. This is setup information, not a signing authorization.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.team.get_practice_team_prescriber(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  prescriber_id: "prov_01j2y8m6jcc9tt24af5pw9x1bc"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**prescriber_id:** `String`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Team::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.team.<a href="/lib/Affinity/team/client.rb">update_practice_team_prescriber</a>(practice_id, prescriber_id, request) -> Affinity::Types::UpdatePracticeTeamPrescriberResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires team:write. Set practiceStatus to inactive to remove prescribing access in this practice, or active to restore an existing association. This does not create membership or signing authority. Practice status applies to Test and Live. Shared identity and license edits require Affinity support.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.team.update_practice_team_prescriber(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  prescriber_id: "prov_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**prescriber_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**display_name:** `String`

</dd>
</dl>

<dl>
<dd>

**legal_name:** `String`

</dd>
</dl>

<dl>
<dd>

**credentials:** `String`

</dd>
</dl>

<dl>
<dd>

**phone:** `String`

</dd>
</dl>

<dl>
<dd>

**address:** `Affinity::Team::Types::UpdatePracticeTeamPrescriberRequestAddress`

</dd>
</dl>

<dl>
<dd>

**practice_status:** `Affinity::Team::Types::UpdatePracticeTeamPrescriberRequestPracticeStatus`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Team::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.team.<a href="/lib/Affinity/team/client.rb">create_practice_team_license</a>(practice_id, prescriber_id, request) -> Affinity::Types::CreatePracticeTeamLicenseResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires team:write and an active accepted prescriber account connection in this practice. Adds a license. Expiration is optional, but must be in the future when supplied. An exact repeat returns the existing license; update an existing license with PATCH and its license ID. Licenses are shared across practices and Test/Live. Other licenses stay unchanged.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.team.create_practice_team_license(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  prescriber_id: "prov_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key",
  state: "state",
  license_number: "licenseNumber"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**prescriber_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**state:** `String`

</dd>
</dl>

<dl>
<dd>

**license_number:** `String`

</dd>
</dl>

<dl>
<dd>

**expires_at:** `String`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Team::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.team.<a href="/lib/Affinity/team/client.rb">update_practice_team_license</a>(practice_id, prescriber_id, license_id, request) -> Affinity::Types::UpdatePracticeTeamLicenseResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires team:write and an active accepted prescriber account connection in this practice. Correct the state or license number, or set or clear the optional expiresAt value. A supplied expiration must be in the future. Other licenses stay unchanged. Changes apply across practices and Test/Live.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.team.update_practice_team_license(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  prescriber_id: "prov_01j2y8m6jcc9tt24af5pw9x1bc",
  license_id: "lic_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**prescriber_id:** `String`

</dd>
</dl>

<dl>
<dd>

**license_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**state:** `String`

</dd>
</dl>

<dl>
<dd>

**license_number:** `String`

</dd>
</dl>

<dl>
<dd>

**expires_at:** `String`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Team::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.team.<a href="/lib/Affinity/team/client.rb">get_practice_team_invitation</a>(practice_id, invitation_id) -> Affinity::Types::GetPracticeTeamInvitationResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires team:read. Returns invitation status and current onboarding state for your integration. An accepted invitation can still have disabled membership or pending clinical review. Invitation tokens are never returned.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.team.get_practice_team_invitation(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  invitation_id: "invite_01j2y8m6jcc9tt24af5pw9x1bc"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**invitation_id:** `String`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Team::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.team.<a href="/lib/Affinity/team/client.rb">revoke_practice_team_invitation</a>(practice_id, invitation_id) -> Affinity::Types::RevokePracticeTeamInvitationResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires team:write. Revokes a pending or expired invitation and its pending prescriber account connection. Repeating the revoke returns the revoked invitation. Accepted invitations return 409; disable the member instead. Retains invitation history.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.team.revoke_practice_team_invitation(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  invitation_id: "invite_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**invitation_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Team::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.team.<a href="/lib/Affinity/team/client.rb">resend_practice_team_invitation</a>(practice_id, invitation_id) -> Affinity::Types::ResendPracticeTeamInvitationResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires team:write. Resends a pending or expired invitation with the same ID, recipient, roles, and locations. The previous link stops working and the new link expires in seven days. Accepted and revoked invitations return 409. A 502 means the invitation was saved but email delivery could not be confirmed; retry this operation.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.team.resend_practice_team_invitation(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  invitation_id: "invite_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**invitation_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Team::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Patients
<details><summary><code>client.patients.<a href="/lib/Affinity/patients/client.rb">list_patient_addresses</a>(practice_id, patient_id) -> Affinity::Types::ListPatientAddressesResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.patients.list_patient_addresses(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  patient_id: "pat_01j2y8m6jcc9tt24af5pw9x1bc",
  starting_after: "addr_01j2y8m6jcc9tt24af5pw9x1bc",
  ending_before: "addr_01j2y8m6jcc9tt24af5pw9x1bc"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**patient_id:** `String`

</dd>
</dl>

<dl>
<dd>

**status:** `Affinity::Patients::Types::ListPatientAddressesRequestStatus`

</dd>
</dl>

<dl>
<dd>

**starting_after:** `String`

</dd>
</dl>

<dl>
<dd>

**ending_before:** `String`

</dd>
</dl>

<dl>
<dd>

**limit:** `Integer`

</dd>
</dl>

<dl>
<dd>

**affinity_actor_id:** `String` — Required for user actors and optional for system actors. Omit both actor headers to use the authenticated service account as a system actor.

</dd>
</dl>

<dl>
<dd>

**affinity_actor_type:** `String` — Use user when a person initiated the action and system for autonomous work. Omit both actor headers to default to system.

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Patients::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.patients.<a href="/lib/Affinity/patients/client.rb">create_patient_address</a>(practice_id, patient_id, request) -> Affinity::Types::CreatePatientAddressResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the existing active address for a normalized duplicate. The first address becomes the default. API keys require Idempotency-Key.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.patients.create_patient_address(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  patient_id: "pat_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key",
  address: {
    city: "city",
    line1: "line1",
    postal_code: "postalCode",
    state: "state"
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**patient_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**affinity_actor_id:** `String` — Required for user actors and optional for system actors. Omit both actor headers to use the authenticated service account as a system actor.

</dd>
</dl>

<dl>
<dd>

**affinity_actor_type:** `String` — Use user when a person initiated the action and system for autonomous work. Omit both actor headers to default to system.

</dd>
</dl>

<dl>
<dd>

**address:** `Affinity::Patients::Types::CreatePatientAddressRequestAddress`

</dd>
</dl>

<dl>
<dd>

**label:** `String`

</dd>
</dl>

<dl>
<dd>

**preferred_shipping:** `Internal::Types::Boolean`

</dd>
</dl>

<dl>
<dd>

**recipient_name:** `String`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Patients::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.patients.<a href="/lib/Affinity/patients/client.rb">archive_patient_address</a>(practice_id, patient_id, address_id) -> Affinity::Types::ArchivePatientAddressResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Preserves the address ID and history. Archiving the default selects the oldest remaining active address. Existing orders remain unchanged.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.patients.archive_patient_address(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  patient_id: "pat_01j2y8m6jcc9tt24af5pw9x1bc",
  address_id: "addr_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**patient_id:** `String`

</dd>
</dl>

<dl>
<dd>

**address_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**affinity_actor_id:** `String` — Required for user actors and optional for system actors. Omit both actor headers to use the authenticated service account as a system actor.

</dd>
</dl>

<dl>
<dd>

**affinity_actor_type:** `String` — Use user when a person initiated the action and system for autonomous work. Omit both actor headers to default to system.

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Patients::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.patients.<a href="/lib/Affinity/patients/client.rb">update_patient_address</a>(practice_id, patient_id, address_id, request) -> Affinity::Types::UpdatePatientAddressResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.patients.update_patient_address(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  patient_id: "pat_01j2y8m6jcc9tt24af5pw9x1bc",
  address_id: "addr_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**patient_id:** `String`

</dd>
</dl>

<dl>
<dd>

**address_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**affinity_actor_id:** `String` — Required for user actors and optional for system actors. Omit both actor headers to use the authenticated service account as a system actor.

</dd>
</dl>

<dl>
<dd>

**affinity_actor_type:** `String` — Use user when a person initiated the action and system for autonomous work. Omit both actor headers to default to system.

</dd>
</dl>

<dl>
<dd>

**address:** `Affinity::Patients::Types::UpdatePatientAddressRequestAddress`

</dd>
</dl>

<dl>
<dd>

**label:** `String`

</dd>
</dl>

<dl>
<dd>

**recipient_name:** `String`

</dd>
</dl>

<dl>
<dd>

**preferred_shipping:** `Internal::Types::Boolean`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Patients::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.patients.<a href="/lib/Affinity/patients/client.rb">set_default_patient_address</a>(practice_id, patient_id, address_id) -> Affinity::Types::SetDefaultPatientAddressResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Changes delivery selection for future drafts, without changing patient clinical location or existing signed orders.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.patients.set_default_patient_address(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  patient_id: "pat_01j2y8m6jcc9tt24af5pw9x1bc",
  address_id: "addr_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**patient_id:** `String`

</dd>
</dl>

<dl>
<dd>

**address_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**affinity_actor_id:** `String` — Required for user actors and optional for system actors. Omit both actor headers to use the authenticated service account as a system actor.

</dd>
</dl>

<dl>
<dd>

**affinity_actor_type:** `String` — Use user when a person initiated the action and system for autonomous work. Omit both actor headers to default to system.

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Patients::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.patients.<a href="/lib/Affinity/patients/client.rb">list_patients</a>(practice_id) -> Affinity::Types::ListPatientsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists patients in one practice and mode. Use externalId for an exact match in the calling integration's namespace. Use externalIdentitySource with externalIdentityValue to search an explicit alias. Identity matching is case-sensitive after trimming whitespace. Other filters also apply.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.patients.list_patients(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  ending_before: "pat_01j2y8m6jcc9tt24af5pw9x1bc",
  starting_after: "pat_01j2y8m6jcc9tt24af5pw9x1bc"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**ending_before:** `String`

</dd>
</dl>

<dl>
<dd>

**external_id:** `String`

</dd>
</dl>

<dl>
<dd>

**external_identity_source:** `String`

</dd>
</dl>

<dl>
<dd>

**external_identity_value:** `String`

</dd>
</dl>

<dl>
<dd>

**gender:** `Affinity::Patients::Types::ListPatientsRequestGender`

</dd>
</dl>

<dl>
<dd>

**last_order_after:** `String`

</dd>
</dl>

<dl>
<dd>

**last_order_before:** `String`

</dd>
</dl>

<dl>
<dd>

**limit:** `Integer`

</dd>
</dl>

<dl>
<dd>

**program:** `String`

</dd>
</dl>

<dl>
<dd>

**query:** `String`

</dd>
</dl>

<dl>
<dd>

**sort:** `Affinity::Patients::Types::ListPatientsRequestSort`

</dd>
</dl>

<dl>
<dd>

**starting_after:** `String`

</dd>
</dl>

<dl>
<dd>

**states:** `String`

</dd>
</dl>

<dl>
<dd>

**status:** `Affinity::Patients::Types::ListPatientsRequestStatus`

</dd>
</dl>

<dl>
<dd>

**affinity_actor_id:** `String` — Required for user actors and optional for system actors. Omit both actor headers to use the authenticated service account as a system actor.

</dd>
</dl>

<dl>
<dd>

**affinity_actor_type:** `String` — Use user when a person initiated the action and system for autonomous work. Omit both actor headers to default to system.

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Patients::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.patients.<a href="/lib/Affinity/patients/client.rb">create_patient</a>(practice_id, request) -> Affinity::Types::CreatePatientResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a patient or resolves a matching externalId or external identity within this practice and mode. externalId belongs to the calling integration; externalIdentities holds aliases from other systems. Resolution preserves existing demographics; use PATCH to update them. Conflicting identifiers return 409. Email never merges patients. API keys require Idempotency-Key.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.patients.create_patient(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key",
  date_of_birth: "dateOfBirth",
  name: {
    first: "first",
    last: "last"
  }
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**affinity_actor_id:** `String` — Required for user actors and optional for system actors. Omit both actor headers to use the authenticated service account as a system actor.

</dd>
</dl>

<dl>
<dd>

**affinity_actor_type:** `String` — Use user when a person initiated the action and system for autonomous work. Omit both actor headers to default to system.

</dd>
</dl>

<dl>
<dd>

**address:** `Affinity::Patients::Types::CreatePatientRequestAddress`

</dd>
</dl>

<dl>
<dd>

**clinical_profile:** `Affinity::Patients::Types::CreatePatientRequestClinicalProfile`

</dd>
</dl>

<dl>
<dd>

**date_of_birth:** `String`

</dd>
</dl>

<dl>
<dd>

**email:** `String`

</dd>
</dl>

<dl>
<dd>

**external_id:** `String`

</dd>
</dl>

<dl>
<dd>

**external_identities:** `Internal::Types::Array[Affinity::Patients::Types::CreatePatientRequestExternalIdentitiesItem]`

</dd>
</dl>

<dl>
<dd>

**addresses:** `Internal::Types::Array[Affinity::Patients::Types::CreatePatientRequestAddressesItem]`

</dd>
</dl>

<dl>
<dd>

**encounters:** `Internal::Types::Array[Affinity::Patients::Types::CreatePatientRequestEncountersItem]`

</dd>
</dl>

<dl>
<dd>

**gender:** `Affinity::Patients::Types::CreatePatientRequestGender`

</dd>
</dl>

<dl>
<dd>

**location_id:** `String`

</dd>
</dl>

<dl>
<dd>

**metadata:** `Internal::Types::Hash[String, Object]`

</dd>
</dl>

<dl>
<dd>

**medical_record_number:** `String`

</dd>
</dl>

<dl>
<dd>

**measurements:** `Internal::Types::Array[Affinity::Patients::Types::CreatePatientRequestMeasurementsItem]`

</dd>
</dl>

<dl>
<dd>

**name:** `Affinity::Patients::Types::CreatePatientRequestName`

</dd>
</dl>

<dl>
<dd>

**phone:** `String`

</dd>
</dl>

<dl>
<dd>

**programs:** `Internal::Types::Array[Affinity::Patients::Types::CreatePatientRequestProgramsItem]`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Patients::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.patients.<a href="/lib/Affinity/patients/client.rb">get_patient</a>(practice_id, patient_id) -> Affinity::Types::GetPatientResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns one patient in the authorized practice and mode.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.patients.get_patient(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  patient_id: "pat_01j2y8m6jcc9tt24af5pw9x1bc"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**patient_id:** `String`

</dd>
</dl>

<dl>
<dd>

**affinity_actor_id:** `String` — Required for user actors and optional for system actors. Omit both actor headers to use the authenticated service account as a system actor.

</dd>
</dl>

<dl>
<dd>

**affinity_actor_type:** `String` — Use user when a person initiated the action and system for autonomous work. Omit both actor headers to default to system.

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Patients::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.patients.<a href="/lib/Affinity/patients/client.rb">delete_patient</a>(practice_id, patient_id) -> Affinity::Types::DeletePatientResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires patients:write and Idempotency-Key for API keys. Permanently deletes a patient with no order history. Any order history returns 409; use Update patient with status archived instead. Available to practice keys and authorized platform keys. Reusing the same idempotency key returns the original deletion result.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.patients.delete_patient(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  patient_id: "pat_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**patient_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**affinity_actor_id:** `String` — Required for user actors and optional for system actors. Omit both actor headers to use the authenticated service account as a system actor.

</dd>
</dl>

<dl>
<dd>

**affinity_actor_type:** `String` — Use user when a person initiated the action and system for autonomous work. Omit both actor headers to default to system.

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Patients::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.patients.<a href="/lib/Affinity/patients/client.rb">update_patient</a>(practice_id, patient_id, request) -> Affinity::Types::UpdatePatientResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a patient in the current practice and mode. Omitted fields remain unchanged; null clears an optional field. externalId updates the calling integration's identifier. externalIdentities replaces its explicit aliases. Identifiers cannot be reassigned from another patient. API keys require Idempotency-Key.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.patients.update_patient(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  patient_id: "pat_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**patient_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**affinity_actor_id:** `String` — Required for user actors and optional for system actors. Omit both actor headers to use the authenticated service account as a system actor.

</dd>
</dl>

<dl>
<dd>

**affinity_actor_type:** `String` — Use user when a person initiated the action and system for autonomous work. Omit both actor headers to default to system.

</dd>
</dl>

<dl>
<dd>

**address:** `Affinity::Patients::Types::UpdatePatientRequestAddress`

</dd>
</dl>

<dl>
<dd>

**clinical_profile:** `Affinity::Patients::Types::UpdatePatientRequestClinicalProfile`

</dd>
</dl>

<dl>
<dd>

**date_of_birth:** `String`

</dd>
</dl>

<dl>
<dd>

**email:** `String`

</dd>
</dl>

<dl>
<dd>

**external_id:** `String`

</dd>
</dl>

<dl>
<dd>

**external_identities:** `Internal::Types::Array[Affinity::Patients::Types::UpdatePatientRequestExternalIdentitiesItem]`

</dd>
</dl>

<dl>
<dd>

**addresses:** `Internal::Types::Array[Affinity::Patients::Types::UpdatePatientRequestAddressesItem]`

</dd>
</dl>

<dl>
<dd>

**encounters:** `Internal::Types::Array[Affinity::Patients::Types::UpdatePatientRequestEncountersItem]`

</dd>
</dl>

<dl>
<dd>

**gender:** `Affinity::Patients::Types::UpdatePatientRequestGender`

</dd>
</dl>

<dl>
<dd>

**location_id:** `String`

</dd>
</dl>

<dl>
<dd>

**metadata:** `Internal::Types::Hash[String, Object]`

</dd>
</dl>

<dl>
<dd>

**medical_record_number:** `String`

</dd>
</dl>

<dl>
<dd>

**measurements:** `Internal::Types::Array[Affinity::Patients::Types::UpdatePatientRequestMeasurementsItem]`

</dd>
</dl>

<dl>
<dd>

**name:** `Affinity::Patients::Types::UpdatePatientRequestName`

</dd>
</dl>

<dl>
<dd>

**programs:** `Internal::Types::Array[Affinity::Patients::Types::UpdatePatientRequestProgramsItem]`

</dd>
</dl>

<dl>
<dd>

**phone:** `String`

</dd>
</dl>

<dl>
<dd>

**status:** `Affinity::Patients::Types::UpdatePatientRequestStatus`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Patients::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.patients.<a href="/lib/Affinity/patients/client.rb">get_patient_allergies</a>(practice_id, patient_id) -> Affinity::Types::GetPatientAllergiesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the patient's structured allergy entries and review status. A not_reviewed status is not a no-known-allergies assertion and blocks clinical review and signing.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.patients.get_patient_allergies(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  patient_id: "pat_01j2y8m6jcc9tt24af5pw9x1bc"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**patient_id:** `String`

</dd>
</dl>

<dl>
<dd>

**affinity_actor_id:** `String` — Required for user actors and optional for system actors. Omit both actor headers to use the authenticated service account as a system actor.

</dd>
</dl>

<dl>
<dd>

**affinity_actor_type:** `String` — Use user when a person initiated the action and system for autonomous work. Omit both actor headers to default to system.

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Patients::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.patients.<a href="/lib/Affinity/patients/client.rb">replace_patient_allergies</a>(practice_id, patient_id, request) -> Affinity::Types::ReplacePatientAllergiesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Replaces the patient's structured allergy record. Sending no_known is the explicit no-known-allergies acknowledgement; recorded requires at least one entry. Idempotency-Key is required.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.patients.replace_patient_allergies(
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  patient_id: "pat_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key",
  allergies: [{
    category: "drug",
    reactions: [{
      display: "display"
    }],
    source: "Doctor",
    substance: "substance",
    verification_status: "unconfirmed"
  }],
  review_status: "not_reviewed"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**patient_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**affinity_actor_id:** `String` — Required for user actors and optional for system actors. Omit both actor headers to use the authenticated service account as a system actor.

</dd>
</dl>

<dl>
<dd>

**affinity_actor_type:** `String` — Use user when a person initiated the action and system for autonomous work. Omit both actor headers to default to system.

</dd>
</dl>

<dl>
<dd>

**allergies:** `Internal::Types::Array[Affinity::Patients::Types::ReplacePatientAllergiesRequestAllergiesItem]`

</dd>
</dl>

<dl>
<dd>

**review_status:** `Affinity::Patients::Types::ReplacePatientAllergiesRequestReviewStatus`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Patients::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Practices
<details><summary><code>client.practices.<a href="/lib/Affinity/practices/client.rb">list_practices</a>() -> Affinity::Types::ListPracticesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the practices that belong to the platform. The default Affinity-Version is 2026-09-28.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.practices.list_practices(
  ending_before: "prac_01j2y8m6jcc9tt24af5pw9x1bc",
  starting_after: "prac_01j2y8m6jcc9tt24af5pw9x1bc"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**search:** `String` — Case-insensitive search by practice name or external ID.

</dd>
</dl>

<dl>
<dd>

**ending_before:** `String`

</dd>
</dl>

<dl>
<dd>

**limit:** `Integer`

</dd>
</dl>

<dl>
<dd>

**starting_after:** `String`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Practices::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.practices.<a href="/lib/Affinity/practices/client.rb">create_practice</a>(request) -> Affinity::Types::CreatePracticeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a practice owned by the platform. Set liveEnabled to true to enable Live access at creation with an approved platform and a Live request. Defaults to false. Requires practices:write. Send Idempotency-Key when you retry the same request.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.practices.create_practice(
  address: {
    city: "Los Angeles",
    country: "US",
    line1: "100 Practice Way",
    postal_code: "90001",
    state: "CA"
  },
  attestations: {
    authorized_practice_relationship: true,
    authorized_phi_transfer: true,
    minimum_necessary_phi: true,
    provider_data_accuracy: true
  },
  external_id: "practice_123",
  legal_name: "Example Medical Group PLLC",
  metadata: {
    key: "value"
  },
  name: "Example Medical Group",
  prescribers: [{
    credentials: "MD",
    license_states: ["CA"],
    name: "Alex Morgan",
    npi: "1234567893"
  }],
  primary_contact: {
    email: "operations@example-practice.com",
    name: "Jordan Lee"
  },
  support_email: "support@example-practice.com"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**live_enabled:** `Internal::Types::Boolean` — Enable Live access at creation. Requires an approved platform and a Live request. Defaults to false.

</dd>
</dl>

<dl>
<dd>

**address:** `Affinity::Practices::Types::CreatePracticeRequestAddress`

</dd>
</dl>

<dl>
<dd>

**attestations:** `Affinity::Practices::Types::CreatePracticeRequestAttestations`

</dd>
</dl>

<dl>
<dd>

**compliance_contact:** `Affinity::Practices::Types::CreatePracticeRequestComplianceContact`

</dd>
</dl>

<dl>
<dd>

**external_id:** `String`

</dd>
</dl>

<dl>
<dd>

**legal_name:** `String`

</dd>
</dl>

<dl>
<dd>

**metadata:** `Internal::Types::Hash[String, Object]`

</dd>
</dl>

<dl>
<dd>

**name:** `String`

</dd>
</dl>

<dl>
<dd>

**prescribers:** `Internal::Types::Array[Affinity::Practices::Types::CreatePracticeRequestPrescribersItem]`

</dd>
</dl>

<dl>
<dd>

**primary_contact:** `Affinity::Practices::Types::CreatePracticeRequestPrimaryContact`

</dd>
</dl>

<dl>
<dd>

**support_email:** `String`

</dd>
</dl>

<dl>
<dd>

**support_phone:** `String`

</dd>
</dl>

<dl>
<dd>

**timezone:** `String` — Optional IANA timezone override. Omit to leave unchanged; null clears it. No timezone is inferred when creating a record.

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Practices::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.practices.<a href="/lib/Affinity/practices/client.rb">get_practice</a>(practice_id) -> Affinity::Types::GetPracticeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns one practice that belongs to the platform.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.practices.get_practice(practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Practices::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.practices.<a href="/lib/Affinity/practices/client.rb">update_practice</a>(practice_id, request) -> Affinity::Types::UpdatePracticeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates one practice owned by the platform. Set liveEnabled to true or false to control Live access with an approved platform and a Live request. Affinity Admin decisions take precedence. Requires practices:write. Send Idempotency-Key when you retry the same request.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.practices.update_practice(practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc")
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**live_enabled:** `Internal::Types::Boolean` — Enable or disable Live access for an owned practice. Requires an approved platform and a Live request. Affinity Admin decisions take precedence.

</dd>
</dl>

<dl>
<dd>

**address:** `Affinity::Practices::Types::UpdatePracticeRequestAddress`

</dd>
</dl>

<dl>
<dd>

**attestations:** `Affinity::Practices::Types::UpdatePracticeRequestAttestations`

</dd>
</dl>

<dl>
<dd>

**compliance_contact:** `Affinity::Practices::Types::UpdatePracticeRequestComplianceContact`

</dd>
</dl>

<dl>
<dd>

**external_id:** `String`

</dd>
</dl>

<dl>
<dd>

**legal_name:** `String`

</dd>
</dl>

<dl>
<dd>

**metadata:** `Internal::Types::Hash[String, Object]`

</dd>
</dl>

<dl>
<dd>

**name:** `String`

</dd>
</dl>

<dl>
<dd>

**prescribers:** `Internal::Types::Array[Affinity::Practices::Types::UpdatePracticeRequestPrescribersItem]`

</dd>
</dl>

<dl>
<dd>

**primary_contact:** `Affinity::Practices::Types::UpdatePracticeRequestPrimaryContact`

</dd>
</dl>

<dl>
<dd>

**support_email:** `String`

</dd>
</dl>

<dl>
<dd>

**support_phone:** `String`

</dd>
</dl>

<dl>
<dd>

**timezone:** `String` — Optional IANA timezone override. Omit to leave unchanged; null clears it. No timezone is inferred when creating a record.

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::Practices::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Platform Pricing
<details><summary><code>client.platform_pricing.<a href="/lib/Affinity/platform_pricing/client.rb">platform_public_api_selling_prices_read_selling_price</a>(catalog_item_id) -> Affinity::Types::PlatformPublicAPISellingPricesReadSellingPriceResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires selling_prices:read. Omit practiceId for the platform default, or supply a managed practice. A null amount inherits the next applicable price. Amounts use the catalog pricing basis, in USD cents. purchaseAmountCents is the platform's Affinity purchase price for that same basis. requiresReview indicates changed product pricing terms, not a below-purchase-price discount.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.platform_pricing.platform_public_api_selling_prices_read_selling_price(
  catalog_item_id: "cat_01j2y8m6jcc9tt24af5pw9x1bc",
  practice_id: "prac_01j2y8m6jcc9tt24af5pw9x1bc"
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**catalog_item_id:** `String`

</dd>
</dl>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::PlatformPricing::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.platform_pricing.<a href="/lib/Affinity/platform_pricing/client.rb">platform_public_api_selling_prices_update_selling_price</a>(catalog_item_id, request) -> Affinity::Types::PlatformPublicAPISellingPricesUpdateSellingPriceResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Requires selling_prices:write. Sets a platform default or managed practice override in the current Test/Live mode. Send baseVersion from Read selling price. Null removes the override. Prices use the catalog pricing basis. Intentional discounts below purchaseAmountCents are allowed; compare these amounts to warn about selling below your Affinity purchase price. This does not change the platform's Affinity purchase price or collect practice payments.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.platform_pricing.platform_public_api_selling_prices_update_selling_price(
  catalog_item_id: "cat_01j2y8m6jcc9tt24af5pw9x1bc",
  idempotency_key: "Idempotency-Key",
  base_version: 1
)
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**catalog_item_id:** `String`

</dd>
</dl>

<dl>
<dd>

**idempotency_key:** `String`

</dd>
</dl>

<dl>
<dd>

**practice_id:** `String`

</dd>
</dl>

<dl>
<dd>

**amount_cents:** `Integer`

</dd>
</dl>

<dl>
<dd>

**base_version:** `Integer`

</dd>
</dl>

<dl>
<dd>

**request_options:** `Affinity::PlatformPricing::RequestOptions`

</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>
