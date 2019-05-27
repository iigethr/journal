# frozen_string_literal: true

# Index

json.data @publications do |publication|
  json.id publication.id
  json.title publication.title
end
