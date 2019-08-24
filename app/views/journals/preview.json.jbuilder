# frozen_string_literal: true

# Preview

json.journal do
  # Journal
  json.slug         @journal.slug
  json.title        @journal.title
  json.description  @journal.description
  json.published    @journal.published
  json.created_at   @journal.created_at
  json.updated_at   @journal.updated_at
  # Access Tokens
  json.access_id    @journal.access_id
  json.access_token @journal.access_token

  # Articles
  json.articles @articles do |article|
    json.article article
    json.union article.union
    json.agents article.union.agents do |agent|
      json.union_id agent.union_id
      json.id agent.act_id
      json.type agent.act_type
      json.slug agent.act.slug
      if agent.text?
        json.body agent.act.body.body
      elsif agent.picture?
        json.path polymorphic_url(agent.act.upload)
      end
    end
  end

  # Sections
  json.sections @sections do |section|
    json.section section
    # json.union section.union
    json.agents section.union.agents do |agent|
      json.union agent.union_id
      if agent.picture?
        json.slug agent.act.slug
        json.path polymorphic_url(agent.act.upload)
      end
    end
  end
end
