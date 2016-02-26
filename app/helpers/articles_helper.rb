module ArticlesHelper

  def mechanize
    @@mechanize ||= Mechanize.new
  end

  def get_meta_property(doc, prop)
    prop_value = doc.at("[property='#{prop}']")
    puts "#{prop} -> #{prop_value}"
    prop_value = prop_value["content"].strip if prop_value.present?
    prop_value
  end

  def get_meta_properties(doc, prop)
    prop_values = doc.search("[property='#{prop}']")
    if prop_values.present?
      prop_values.map do |tag|
        tag["content"].strip.downcase
      end
    else
      []
    end
  end

  def generate_article_metadata(link)
    doc = mechanize.get(link)

    link        = get_meta_property(doc, "og:url")
    type        = get_meta_property(doc, "og:type")
    title       = get_meta_property(doc, "og:title")
    section     = get_meta_property(doc, "og:description")
    image       = get_meta_property(doc, "og:image")
    # section     = get_meta_property(doc, "article:section")
    subjects    = get_meta_properties(doc, "article:tag")

    subject_ids = []

    unless subjects.empty?
      subjects.each do |subject|
        subject = Subject.where(name: subject).first_or_create!
        subject_ids << subject.id
      end
    end

    # assign all available attribute values to the article
    {
      title:         title,
      link:          link,
      thumbnail_img: image,
      section:       section,
      subject_ids:   subject_ids
    }
  end

end
