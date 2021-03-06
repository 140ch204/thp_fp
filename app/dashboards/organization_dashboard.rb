require "administrate/base_dashboard"

class OrganizationDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    admins: Field::HasMany,
    projects: Field::HasMany,
    donations: Field::HasMany,
    follows: Field::HasMany,
    tag_lists: Field::HasMany,
    alerts: Field::HasMany,
    organization_links: Field::HasMany,
    tags: Field::HasMany,
    users: Field::HasMany,
    counterparts: Field::HasMany,
    city: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    description: Field::Text,
    category: Field::String,
    logo_url: Field::String,
    siret: Field::String,
    is_association: Field::Boolean,
    is_company: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    RNA: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    name
    is_company
    is_association
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    name
    logo_url
    city
    category
    is_company
    is_association
    siret
    RNA
    is_association
    is_company
    created_at
    updated_at
    organization_links
    tag_lists
    donations
    follows
    admins
    projects
    alerts
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    admins
    projects
    donations
    follows
    tag_lists
    alerts
    organization_links
    tags
    users
    counterparts
    city
    name
    description
    category
    logo_url
    siret
    is_association
    is_company
    RNA
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how organizations are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(organization)
  #   "Organization ##{organization.id}"
  # end
end
