# frozen_string_literal: true

# Preview

json.publication do
  # Publication
  json.slug         @publication.slug
  json.title        @publication.title
  json.description  @publication.description
  json.published    @publication.published
  json.created_at   @publication.created_at
  json.updated_at   @publication.updated_at
  # Access Tokens
  json.access_id    @publication.access_id
  json.access_token @publication.access_token

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
