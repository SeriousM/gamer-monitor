module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Quacking-Nemesis"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def obscure_email(email)
    return nil if email.nil? #Don't bother if the parameter is nil.
    lower = ('a'..'z').to_a
    upper = ('A'..'Z').to_a
    email.split('').map { |char|
        output = lower.index(char) + 97 if lower.include?(char)
        output = upper.index(char) + 65 if upper.include?(char)
        output ? "&##{output};" : (char == '@' ? '&#0064;' : char)
    }.join
  end
end
