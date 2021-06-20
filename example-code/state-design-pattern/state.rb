class Post
  attr_accessor :id, :content, :state

  def initialize(id, content)
    @id = id
    @content = content
    @state = DraftState.new(self)
  end

  def current_state
    @state.current_state
  end

  def publish
    @state.publish
  end

  def archive
    @state.archive
  end

  def post_to_socials
    puts "Posted to social accounts!"
  end
end

class State
  attr_reader :context

  def initialize(context)
    @context = context
  end

  def unpublish
    raise StandardError "Cannot unpublish post in draft state."
  end

  def current_state
    raise NotImplementedError
  end

  def publish
    raise NotImplementedError
  end

  def archive
    raise NotImplementedError
  end

  def log_state(state)
    puts "Transitioning from: #{context.state.current_state} to: #{state}"
  end
end

class DraftState < State
  def current_state
    "draft"
  end

  def unpublish
    raise StandardError "Cannot unpublish post in draft state."
  end

  def publish
    post_to_socials
    log_state("published")
    context.state = PublishedState.new(context)
  end

  def archive
    log_state("archived")
    context.state = ArchivedState.new(context)
  end

  private

  def post_to_socials
    context.post_to_socials
  end
end

class PublishedState < State
  def current_state
    'published'
  end

  def unpublish
    log_state("unpublished")
    context.state = DraftState.new(context)
  end

  def publish
    raise StandardError "Cannot publish already published post!"
  end

  def archive
    log_state("archived")
    context.state = ArchivedState.new(context)
  end
end

class ArchivedState < State
  def current_state
    'archived'
  end

  def unpublish
    log_state("unpublished")
    context.state = DraftState.new(context)
  end

  def publish
    log_state("published")
    context.state = PublishedState.new(context)
  end

  def archive
    raise StandardError "Cannot archive already archived post!"
  end
end
