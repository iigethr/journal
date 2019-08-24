# frozen_string_literal: true

# Index

json.data @journals do |journal|
  json.id journal.id
  json.title journal.title
end
