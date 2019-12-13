require "administrate/base_dashboard"

class ProjectDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    organization: Field::BelongsTo,
    city: Field::BelongsTo,
    counterparts: Field::HasMany,
    donations: Field::HasMany,
    likes: Field::HasMany,
    project_links: Field::HasMany,
    alerts: Field::HasMany,
    admins: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    description: Field::Text,
    logo_url: Field::String,
    starting_date: Field::DateTime,
    donation_targeted: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    donation_start: Field::DateTime,
    donation_end: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    name
    donation_targeted
    donation_end
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    name
    description
    logo_url
    organization
    admins
    city  
    donations
    likes
    project_links
    starting_date
    donation_targeted
    created_at
    updated_at
    donation_start
    donation_end
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    organization
    city
    counterparts
    donations
    likes
    project_links
    alerts
    admins
    name
    description
    logo_url
    starting_date
    donation_targeted
    donation_start
    donation_end
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

  # Overwrite this method to customize how projects are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(project)
  #   "Project ##{project.id}"
  # end
end
